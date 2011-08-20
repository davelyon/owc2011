@contact
Feature: User submits contact form
  Given I parent, teacher, school faculty (any adult working with children to stay safe).
  When we go to the contact form, 
  Then we should see contact types:
  -Parent workshops
  -Teacher in service
  -In class student sessions
  -General Question
  And we should allow them to write free text to describe their inquiry.
  Then we should capture some information about the inquirer
  Required fields (*)
  * Name
  * Phone number
  * Email
  Title/Occupation
  Organization
  Then the information should all be emailed to "melicurk@kidshavehope.org"
  And the user should see a message "Thank you for your interest, we will contact you as soon as possible."

  Background:
    Given I am on the home page
    When I follow "Contact Us"

  Scenario: contact information shown
    Then I should see "888-806-8481 - Kids Have Hope"

  Scenario: happy path
    Given I select "General question" from "Contact types"
    And I fill in "My inquiry" for "Message"
    And I fill in "John Doe" for "Name"
    And I fill in "555-555-5555" for "Phone number"
    And I fill in "ChicagoOnRails@example.com" for "Email"
    And I fill in "Developer" for "Title/Occupation"
    And I fill in "Chicago On Rails" for "Organization"
    And I press "Submit"
    Then I should see "Thank you for your interest, we will contact you as soon as possible."
    And "melicurk@kidshavehope.org" should receive an email

    When "melicurk@kidshavehope.org" opens the email
    Then I should see "Contact type: General question" in the email body
    And I should see "Name: John Doe" in the email body
    And I should see "Phone number: 555-555-5555" in the email body
    And I should see "Email: ChicagoOnRails@example.com" in the email body
    And I should see "Title/Occupation: Developer" in the email body
    And I should see "Organization: Chicago On Rails" in the email body
    And I should see "Message: My inquiry" in the email body

  Scenario: required fields not given
    When I press "Submit"
    Then "melicurk@kidshavehope.org" should receive no emails
    And I should see "Name can't be blank"
    And I should see "Phone can't be blank"
    And I should see "Email can't be blank"
