Feature: PayPal donations
  In order to support Kids Have Hope
  As a donor
  I want use PayPal to send money

  Scenario: View the link to PayPal
    Given I am on the donations page
    Then I should see a PayPal button
    
    #return variable
  Scenario: User Specified Donation Completed
    When I am on the donations page
    Then the PayPal button should set the return to the successful donation page
    When I am on the successful donations page
    Then I should see "Thank you for supporting Kids Have Hope"  
  
  # cancel_return variable
  Scenario: Donation Canceled
  
  
