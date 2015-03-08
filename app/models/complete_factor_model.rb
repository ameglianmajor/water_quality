# Model class for storing different user defined complete factor models.
class CompleteFactorModel < ActiveRecord::Base
  include FilteredRecord
  has_and_belongs_to_many :user_preferences

  def sym_name
    name.gsub(' ', '_')
  end
end
