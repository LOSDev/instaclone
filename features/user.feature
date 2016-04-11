Feature: User Pages

  Scenario: Create User
    Given I am a guest
    When I sign up for the website
    Then I have created a user account
