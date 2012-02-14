Given /^I am on "([^"]*)"$/ do |page_name|
  visit path_to(page_name)
end

When /^I fill "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see "([^"]*)"$/ do |msg|
  page.should have_content(msg)
end

