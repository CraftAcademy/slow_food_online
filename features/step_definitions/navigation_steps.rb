And(/^my location is "([^"]*)"$/) do |city|
  case city
    when 'Gothenburg' then
      lat, lng = 57.7088700, 11.9745600
    when 'Stockholm' then
      lat, lng = 59.3293230, 18.0685810
  end
  simulate_location(lat, lng)
end

When /^I wait for the Google map to load$/ do
  loop until all(:css, '#map .gm-style').length == 1
end


def simulate_location(lat, lng)
  page.execute_script("navigator.geolocation.getCurrentPosition = function(success) { success({coords: {latitude: #{lat}, longitude: #{lng}}}); }")
  page.execute_script("map.setCenter(#{lat}, #{lng});")
end