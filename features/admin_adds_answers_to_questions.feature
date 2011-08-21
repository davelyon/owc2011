Feature: Admin adds answers to questions
  Background:
    Given a quiz exists with title: "Safe and Unsafe", explanation: "Explanation"
    And the "Safe and Unsafe" quiz has the following question: "Walking the dog"
    And I am signed in as an admin
    And I am on the admin quiz questions page for "Safe and Unsafe"
    When I follow "answers" within the "Walking the dog" section
    And I follow "New Answer"

  Scenario: happy path
    Given I fill in "Title" with "Totally Safe"
    And I press "Create"
    Then I should see "Answer successfully created."
    And I should see "Totally Safe"

  Scenario: invalid fields
    When I press "Create"
    Then I should see "Title can't be blank"
