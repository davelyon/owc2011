Feature: Admin creates a donation campaign

  Scenario: Happy Path
    Given I am signed in as an admin
    And I am on the new admin donation campaign page
    And I fill in "Title" with "A title"
    And I fill in "Amount" with "10.00"
    And I fill in "Description" with "a description"
    When I press "Submit"
    Then I should be on the admin donation campaign page
    And I should see "A title"
    And I should see "10.00"
    And I should see "a description"
