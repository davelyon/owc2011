Feature: Newsletter Signup

  Acceptance Criteria: Constant contact integration Given I am an end user And I am on the home page Then I should see a form with the label: "Subscribe to our newsletter!" And I should see an input for email that integrates with the client's constant contact page. Login Credentials: username: gcurk@osmworldwide.com password: jake7117

  @happy-tparty
  Scenario: Signup!
    Given I am on the home page
    When I fill in "Subscribe to our newsletter!" with "kidshavedope@mailinator.com"
    And I press "Subscribe"
    Then I should see "Thanks for signing up!"
