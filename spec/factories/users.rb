# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'tester@greatwater.com'
    password 'password'
  end
end
