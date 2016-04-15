Feature: Hashtag

  @javascript
  Scenario: Follow a hashtag
    Given I am a guest
    When I visit a post
    And I click on a hashtag
    Then I should see all posts with the hashtag
