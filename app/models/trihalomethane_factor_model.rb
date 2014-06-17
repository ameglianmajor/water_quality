class TrihalomethaneFactorModel < ActiveRecord::Base
  include FilteredRecord
  has_and_belongs_to_many :user_preferences

end
