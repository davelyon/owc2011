Given /^I am not signed in$/ do
  visit destroy_admin_session_path
end

Given /^I am signed in as an admin$/ do
    steps %Q{
      Given a admin exists with email: "foo@bar.baz", password: "password"
      Given I am signed in as "foo@bar.baz" with password "password"
    }
end

Given /^I (?:am )?sign(?:ed)? in as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  steps %Q{
    When I go to the new admin session page
    And I fill in "Email" with "#{email}"
    And I fill in "Password" with "#{password}"
    And I press "Sign in"
  }
end

Given /^I am signed in as "([^"]*)"$/ do |email|
  Given %{I am signed in as "#{email}" with password "password"}
end
