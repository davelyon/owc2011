Feature: Admin edits a quiz
  Background:
    Given a quiz exists with title: "Some title", explanation: "Some explanation"
    And I am signed in as an admin
    When I am on the admin quizzes page
    And I follow "edit" within the "Some title" section

  Scenario: happy path
    When I fill in "Title" with "A new title"
    And I check "Active"
    And I press "Update Quiz"
    Then I should see "Quiz successfully updated."
    And I should see "A new title"

  Scenario: missing required fields
    When I fill in "Title" with ""
    And I press "Update Quiz"
    Then I should see "Title can't be blank"

