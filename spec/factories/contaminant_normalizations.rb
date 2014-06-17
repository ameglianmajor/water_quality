# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contaminant_normalization do
    contaminant "MyString"
    normalization_factor 1.5
  end
end
