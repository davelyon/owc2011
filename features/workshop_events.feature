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
    Given I follow "workshop events"
    And I follow "create"
    And I fill in the following:
			| Name        | Good Touch, Bad Touch              |
			| Location    | Caleb's pad                        |
			| Description | A seminar on Good Touch, Bad Touch |
		And I select "2011-08-20" as the "Start at" date and time
		When I press "Create"
		Then I should see the following list:
			| Good Touch, Bad Touch |
		And I should see "Event successfully created"

	Scenario: edit
		Given an event exists with name: "Good Touch, Bad Touch"
    And I follow "workshop events"
		And I follow "edit" within the "Good Touch, Bad Touch" section
		And I fill in "Name" with "herp derp"
		When I press "Update"
		Then I should see the following list:
			| herp derp |
		And I should see "Event successfully updated"

	Scenario: destroy
		Given an event exists with name: "Good Touch, Bad Touch"
    And I follow "workshop events"
		When I follow "delete" within the "Good Touch, Bad Touch" section
		Then I should be on the admin events page
		And I should see "Event successfully deleted"
		And I should not see "Good Touch, Bad Touch"
