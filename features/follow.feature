Feature: Following users

  Scenario: Following another user
    Given I am a logged in user
    When I follow another user
    Then another user has 1 follower
    Then I am following 1 user
