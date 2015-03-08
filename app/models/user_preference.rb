# Model for storing user display preferences.
class UserPreference < ActiveRecord::Base
  include FilteredRecord
  has_one :user
  has_and_belongs_to_many :trihalomethane_factor_models
  has_and_belongs_to_many :complete_factor_models

  def selected(column_name)
    send("display_#{column_name}".to_sym)
  end

  def set_options_to_false
    self.class.columns_hash.each do |k, v|
      send("#{k}=", false) if v.type == :boolean
    end
  end
end
