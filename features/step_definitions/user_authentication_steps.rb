Given(/^the following users are registered in the system$/) do |table|
  table.hashes.each do |user|
    FactoryGirl.create(:user, username: user[:username], email: user[:email], password: 'password')
  end
end
