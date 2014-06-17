class WaterSample < ActiveRecord::Base
  include FilteredRecord

  def self.selected_columns(user_preference)
    columns = self.filtered_columns
    if user_preference
      columns = columns.select {|x| x if (x == "site" || self.valid_key(user_preference, x) ) }
      self.add_tfms(columns, user_preference)
      self.add_cfms(columns, user_preference)
    end
    columns
  end

  def self.add_tfms(columns, user_preference)
    trihalomethane_factor_models = user_preference.trihalomethane_factor_models
    trihalomethane_factor_models.each do |x|
      columns << x.name
    end
  end

  def self.add_cfms(columns, user_preference)
    complete_factor_models = user_preference.complete_factor_models
    complete_factor_models.each do |x|
      columns << x.name
    end
  end

  def selected_columns(user_preference)
    values = self.attributes.map do |key, value|
      if self.class.allowed?(key) && (key == 'site' || self.class.valid_key(user_preference, key) )
        value
      end
    end
    non_nil_values = values.select{|x| x}
    if user_preference
      add_tfm_values(non_nil_values, user_preference)
      add_cfm_values(non_nil_values, user_preference)
    end
    non_nil_values
  end

  def calculate_weighted_factor(factor, normalize = false)
    weighted_contributions = factor.attributes.collect do |k,v|
      if k.include? '_weight'
        contaminant = parse_string(k)
        if normalize
          normalization = ContaminantNormalization.find_by_contaminant(contaminant).normalization_factor
          product = v*self.send(contaminant.to_sym)/normalization
        else
          product = v*self.send(contaminant.to_sym) 
        end
      end
      product
    end
    weighted_contributions.select! {|x| x}
    weighted_contributions.inject(0) {|result, element| result + element }
  end

  def add_tfm_values(values, user_preference)
    trihalomethane_factor_models = user_preference.trihalomethane_factor_models
    trihalomethane_factor_models.each do |x|
      values << calculate_weighted_factor(x)
    end
  end

  def add_cfm_values(values, user_preference)
    complete_factor_models = user_preference.complete_factor_models
    complete_factor_models.each do |x|
      values << calculate_weighted_factor(x, true)
    end
  end

  private

  def parse_string input_string
    input_string.gsub('_weight','').gsub('normalized_','')
  end

  def self.valid_key(user_preference, key)
    user_preference ? user_preference.selected(key) : true 
  end

end
