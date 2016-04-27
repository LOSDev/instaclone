Feature: Likes

  Scenario: Like a post
    Given I am a logged in user
    When I like a post
    Then The post should have one like

  @javascript
  Scenario: Like a post
    Given I am a logged in user
    When I like a post
    Then The post should have one like

  Scenario: unliking a post
    Given I am a logged in user
    And I like a post
    When I unlike a post
    Then the post should have 0 likes

  @javascript
  Scenario: Watch Liked Posts
    Given I am a logged in user
    When I like 13 posts
    And I watch my liked posts
    Then I should see 12 posts
    When I click "Load more"
    Then I should see 13 posts
