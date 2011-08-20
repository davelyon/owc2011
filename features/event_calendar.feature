Feature: Event Calendar
  Given I am a teacher/parent/donor

  When I go to the events page

  Then I should see a calendar of all the events titles.
  When I click on the title, 
  Then I should see the full description of the event.

  I should also see fund raisers and their details


  Scenario: I see workshops and fundraisers
    Given the following events exist: 
      | name        | start_at   | end_at              | description         |
      | hanging out | 2011-08-20 | 2011-08-20T12:00:00 | playing video games |
    Given the following fundraisers exist: 
      | name         | start_at            | end_at              | description |
      | freaking out | 2011-08-20          | 2011-08-20T12:00:00 | what the... |
      | chilling out | 2011-08-20T13:00:00 | 2011-08-20T14:00:00 | chillaxin   |
    When I go to the events page
    Then I should see the event named "hanging out"
    Then I should see the event named "freaking out"
    Then I should see the event named "chilling out"
    When I follow "hanging out"
    Then I should see "hanging out"
    And I should see "playing video games"
    When I go to the events page
    And I follow "chilling out"
    Then I should see "chilling out"
    And I should see "chillaxin"
