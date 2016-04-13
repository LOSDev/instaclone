Feature: Following users

  Scenario: Following another user
    Given I am a logged in user
    When I follow another user
    Then another user has 1 follower
    And I am following 1 user

  Scenario: Unfollow another user
    Given I am a logged in user
    When I follow another user
    And I unfollow him
    Then another user has 0 followers
    And I am following 0 users
