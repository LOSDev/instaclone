Feature: User Pages

  Scenario: Create User
    Given I am a guest
    When I sign up for the website
    Then I have created a user account

  Scenario: Edit User
    Given I am a logged in user
    When I change my username
    Then I should see the new username

  Scenario: Show User Profile
    Given I am a logged in user
    When I visit my Profile
    Then I should see my bio
