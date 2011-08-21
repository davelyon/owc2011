Feature: Admin creates a quiz
  Background:
    Given I am signed in as an admin
    And I am on the admin root page
    When I follow "Quizzes"
    And I follow "New Quiz"

  Scenario: happy path
    When I fill in the following:
      | Title       | Safe and Unsafe                 |
      | Explanation | Explain Safe and Unsafe secrets |
    And I press "Create"
    Then I should see "Quiz successfully created."
    And I should see "Safe and Unsafe"

  Scenario: invalid fields
    When I press "Create"
    Then I should see "Title can't be blank"
    And I should see "Explanation can't be blank"

