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
    When I follow "Workshop Events"
    Then I should see the following list:
      | Workshop One          |
      | Good Touch, Bad Touch |

  Scenario: create
    Given I follow "Workshop Events"
    And I follow "New Workshop Event"
    And I fill in the following:
			| Name        | Good Touch, Bad Touch              |
			| Location    | Caleb's pad                        |
			| Description | A seminar on Good Touch, Bad Touch |
			|Start at     | 2011-08-20 14:00                   |
			|End at     | 2011-08-20 14:00                   |
		When I press "Create"
		And I go to the admin events page
		Then I should see the following list:
			| Good Touch, Bad Touch |
			
	Scenario: edit
		Given an event exists with name: "Good Touch, Bad Touch"
    And I follow "Workshop Events"
		And I follow "Edit" within the "Good Touch, Bad Touch" section
		And I fill in "Name" with "herp derp"
		When I press "Update"
		Then I should see the following list:
			| herp derp |
		And I should see "Event successfully updated"

	Scenario: destroy
		Given an event exists with name: "Good Touch, Bad Touch"
    And I follow "Workshop Events"
		When I follow "Delete" within the "Good Touch, Bad Touch" section
		Then I should be on the admin events page
		And I should see "Event successfully deleted"
		And I should not see "Good Touch, Bad Touch"
