# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    address "605 East 82nd Street"
    city "MyString"
    state "NY"
    postal_code "10028"
    description "Greatest building EVER!"
  end
end
