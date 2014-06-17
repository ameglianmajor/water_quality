# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_preference do
    display_chloroform false
    display_bromoform false
    display_bromodichloromethane false
    display_dibromochloromethane false
    display_arsenic false
    display_nitrate false
    display_alpha_activity false
    display_beta_activity false
    display_radium_226 false
    display_radium_228 false
    display_tritium false
    display_strontium_90 false
    display_uranium false
  end
end
