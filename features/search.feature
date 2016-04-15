Feature: Search

  @javascript
  Scenario: Search for users
    Given I am a guest
    When I search for a user
    Then I should the username
