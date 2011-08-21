Feature: Admin adds questions to quizzes
  Background:
    Given a quiz exists with title: "Safe and Unsafe", explanation: "Explanation"
    And I am signed in as an admin
    And I am on the admin quizzes page
    When I follow "questions" within the "Safe and Unsafe" section
    And I follow "New Question"

  Scenario: happy path
    Given I fill in "Title" with "Walking the dog"
    And I fill in "Reason" with "Walking the dog is safe as can be!"
    And I press "Create"
    Then I should see "Question successfully created."
    And I should see "Walking the dog"

  Scenario: invalid fields
    When I press "Create"
    Then I should see "Title can't be blank"
    And I should see "Reason can't be blank"
