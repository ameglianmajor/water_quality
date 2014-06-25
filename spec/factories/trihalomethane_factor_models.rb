# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trihalomethane_factor_model do
    chloroform_weight 1.5
    bromoform_weight 1.5
    bromodichloromethane_weight 1.5
    dibromochloromethane_weight 1.5
    name 'clean model 1'
  end
end
