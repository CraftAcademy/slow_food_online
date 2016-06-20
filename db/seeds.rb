require_relative 'seed_methods'

create_restaurant_categories(%w(Thai Italian Steakhouse))

10.times do
  create_restaurant
end
