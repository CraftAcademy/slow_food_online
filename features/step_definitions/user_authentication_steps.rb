Given(/^the following users are registered in the system$/) do |table|
  table.hashes.each do |user|
    FactoryGirl.create(:user, username: user[:username], email: user[:email],
                       password: 'password', cvc: '123')
  end
end

Given(/^I am logged\-in as "([^"]*)"$/) do |name|
  user = User.find_by(username: name)
  login_as(user, scope: :user)
end
