require_relative 'seed_methods'

create_restaurant_categories(%w(Thai Italian Steakhouse))

10.times do
  create_restaurant
end

build_menus_with_dishes(%W(Lunch À\ la\ carte))