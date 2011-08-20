Then /^I should see the event named "([^"]*)"$/ do |event_name|
  page.should have_css ".ec-event a[title='#{event_name}']"
end
