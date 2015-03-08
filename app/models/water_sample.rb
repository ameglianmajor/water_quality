# Model for calculating water sample quality
class WaterSample < ActiveRecord::Base
  include FilteredRecord

  def self.selected_columns(user_preference)
    columns = filtered_columns
    if user_preference
      columns = columns.select { |x| x if (x == 'site' || valid_key(user_preference, x)) }
      add_tfms(columns, user_preference)
      add_cfms(columns, user_preference)
    end
    columns
  end

  def self.add_tfms(columns, user_preference)
    trihalomethane_factor_models = user_preference.trihalomethane_factor_models
    columns.push(*trihalomethane_factor_models.map(&:name))
  end

  def self.add_cfms(columns, user_preference)
    complete_factor_models = user_preference.complete_factor_models
    columns.push(*complete_factor_models.map(&:name))
  end

  def selected_columns(user_preference)
    values = attributes.map do |key, value|
      if self.class.allowed?(key) && (key == 'site' || self.class.valid_key(user_preference, key))
        value
      end
    end
    non_nil_values = values.compact
    if user_preference
      add_tfm_values(non_nil_values, user_preference)
      add_cfm_values(non_nil_values, user_preference)
    end
    non_nil_values
  end

  def calculate_weighted_factor(factor, normalize = false)
    weighted_contributions = factor.attributes.collect do |k, v|
      if k.include? '_weight'
        contaminant = self.class.parse_string(k)
        normalization =
          normalize ? ContaminantNormalization.find_by_contaminant(contaminant).normalization_factor : 1
        product = v * send(contaminant.to_sym) / normalization
      end
      product
    end
    weighted_contributions.compact!
    weighted_contributions.inject(0) { |result, element| result + element }
  end

  def add_tfm_values(values, user_preference)
    trihalomethane_factor_models = user_preference.trihalomethane_factor_models
    values.push(*trihalomethane_factor_models.map do |model|
      calculate_weighted_factor(model)
    end)
  end

  def add_cfm_values(values, user_preference)
    complete_factor_models = user_preference.complete_factor_models
    values.push(*complete_factor_models.map do |model|
      calculate_weighted_factor(model, true)
    end)
  end

  private

  def self.parse_string(input_string)
    input_string.gsub('_weight', '').gsub('normalized_', '')
  end

  def self.valid_key(user_preference, key)
    user_preference ? user_preference.selected(key) : true
  end
end
