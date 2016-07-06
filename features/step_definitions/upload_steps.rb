Given(/^I choose a file for upload$/) do
  attach_file('upload_name', "#{Rails.root}/features/support/test.png")
end
