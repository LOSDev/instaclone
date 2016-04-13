Feature: Likes

  Scenario: Like a post
    Given I am a logged in user
    When I like a post
    Then The post should have one like

  Scenario: unliking a post
    Given I am a logged in user
    And I like a post
    When I unlike a post
    Then the post should have 0 likes
