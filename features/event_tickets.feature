Feature: event tickets
  As a donor
  In order to see what tickets I can get for a fundraiser
  I want to see 'em

  Background:
    Given a fundraiser exists with name: "Dinner with 'Da Coach' Mike Ditka"
    And that fundraiser has the following tickets:
      | title                                          | amount | quantity |
      | Iron Mike Corporate Sponsorship - Table for 10 | 2000   | 2        |
      | Singletary - Individual Ticket                 | 15     | 69       |
  
  Scenario:
    When I am on the events page
    And I follow "Dinner with 'Da Coach' Mike Ditka"
    Then I should see "Iron Mike Corporate Sponsorship - Table for 10"
    And I should see "Singletary - Individual Ticket"
    
    
    Scenario: Ticket Donation Completed
      When I am on the events page
      And I follow "Dinner with 'Da Coach' Mike Ditka"
      Then I should see "2 tickets left"
      Then the PayPal button should set the return to the successful donation page for those tickets
      When I am on the successful donation page for ticket "Iron Mike Corporate Sponsorship - Table for 10"
      Then I should see "Thank you for supporting Kids Have Hope"
      When I am on the events page
      And I follow "Dinner with 'Da Coach' Mike Ditka"
      Then I should see "1 ticket left"
    
