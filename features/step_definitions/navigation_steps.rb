And(/^my location is "([^"]*)"$/) do |city|
  case city
    when 'Gothenburg' then
      lat, lng = 57.7088700, 11.9745600
    when 'Stockholm' then
      lat, lng = 59.3293230, 18.0685810
  end
  page.execute_script("map.setCenter(#{lat}, #{lng});")
end