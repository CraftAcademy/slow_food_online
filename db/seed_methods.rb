def create_restaurant_categories(rest_cats)
  rest_cats.each do |category|
    RestaurantCategory.create(title: category)
  end
end

def create_restaurant(args = {})
  suffix = %W(Place Parlor House Bar Food\ Court Pub)
  prefix = %w(The Local Homemade)
  cat = RestaurantCategory.all.sample
  name = "#{prefix.sample} #{cat.title} #{suffix.sample}"
  address = args[:address] || [Faker::Address.street_address, Faker::Address.postcode, Faker::Address.city].join(', ')
  phone_number = args[:phone] || Faker::PhoneNumber.cell_phone

  Restaurant.create(name: name,
                    address: address,
                    phone: phone_number,
                    restaurant_category: cat)
end