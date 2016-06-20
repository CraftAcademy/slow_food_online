FactoryGirl.define do
  factory :restaurant do
    name 'Restaurant'
    description Faker::Lorem.paragraph(2)
    address 'Street address'
    phone '031 121212'
    org_number '909090-1234'
    active true
    association :restaurant_category
  end
end
