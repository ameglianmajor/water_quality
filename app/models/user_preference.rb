class UserPreference < ActiveRecord::Base
  include FilteredRecord
  has_one :user
  has_and_belongs_to_many :trihalomethane_factor_models
  has_and_belongs_to_many :complete_factor_models

  def selected(column_name)
    self.send("display_#{column_name}".to_sym)
  end

  def set_options_to_false
    self.class.columns_hash.each do |k,v|
      if v.type == :boolean
        self.send("#{k}=", false)
      end
    end
  end

end
