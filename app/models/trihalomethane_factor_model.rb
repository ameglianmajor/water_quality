class TrihalomethaneFactorModel < ActiveRecord::Base
  include FilteredRecord
  has_and_belongs_to_many :user_preferences

  def sym_name
    name.gsub(' ', '_')
  end
end
