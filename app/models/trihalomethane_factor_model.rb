class TrihalomethaneFactorModel < ActiveRecord::Base
  include FilteredRecord
  has_and_belongs_to_many :user_preferences

  def sym_name
    self.name.gsub(' ','_')
  end

end
