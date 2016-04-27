Feature: Following users

  Scenario: Following another user
    Given I am a logged in user
    When I follow another user
    Then another user has 1 follower
    And I am following 1 user

  @javascript
  Scenario: Follow user via ajax
    Given I am a logged in user
    When I follow another user
    Then another user has 1 follower

  Scenario: Unfollow another user
    Given I am a logged in user
    When I follow another user
    And I unfollow him
    Then another user has 0 followers
    And I am following 0 users

  Scenario: Show users i follow
    Given I am a logged in user
    When I follow a user
    And I look at the users I follow
    Then I should see the user's bio

  Scenario: Show followers
    Given I am a logged in user
    When another user follows me
    And I look at my followers
    Then I should see the user's bio

  @javascript
  Scenario: Paginate followers page
    Given I am a logged in user
    When 21 users follow me
    Then I should see 20 followers
    When I click "Load more"
    Then I should see 21 followers

  @javascript
  Scenario: Paginate followed users page
    Given I am a logged in user
    When I follow 21 users
    Then I should see 20 followed users
    When I click "Load more"
    Then I should see 21 followed users
