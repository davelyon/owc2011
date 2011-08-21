Feature: event tickets
  As a donor
  In order to see what tickets I can get for a fundraiser
  I want to see 'em

  Scenario:
    Given a fundraiser exists with name: "Dinner with 'Da Coach' Mike Ditka"
    And that fundraiser has the following tickets:
      | title                                          | amount |
      | Iron Mike Corporate Sponsorship - Table for 10 | 2000   |
      | Singletary - Individual Ticket                 | 15     |
    When I am on the events page
    And I follow "Dinner with 'Da Coach' Mike Ditka"
    Then I should see "Iron Mike Corporate Sponsorship - Table for 10"
    And I should see "Singletary - Individual Ticket"
