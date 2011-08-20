Feature: Workshop events
  As an admin
  In order to let people know when and where workshop events are happening
  I can manage events

  Name of the event
  Time/Location
  Description

  Background:
    Given I am signed in as an admin

  Scenario: look
    Given the following events exist:
      | name                  |
      | Workshop One          |
      | Good Touch, Bad Touch |
    When I follow "workshop events"
    Then I should see the following list:
      | Workshop One          |
      | Good Touch, Bad Touch |

  Scenario: create
    When I follow "workshop events"
    And I follow "create"
    And I fill in the following:
			| Name        | Good Touch, Bad Touch              |
			| Location    | Caleb's pad                        |
			| Description | A seminar on Good Touch, Bad Touch |
		And I select "2011-08-20" as the "Start at" date and time
		And I press "Create"
		Then I should see the following list:
			| Good Touch, Bad Touch |
		And I should see "Event successfully created"
