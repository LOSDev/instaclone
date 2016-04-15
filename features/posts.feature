Feature: Posts

  Scenario: Create a post
    Given I am a logged in user
    When I create a post
    Then I should be redirected to the new post

  Scenario: Create invalid post
    Given I am a logged in user
    When I create a post without an image
    Then I should see a flash message with an error

  Scenario: Delete a posts
    Given I am a logged in user
    When I delete my post
    Then I should have 0 posts

  @javascript
  Scenario: Show post in a modal
    Given I am a guest
    When I visit a user
    And I click on one of his posts
    Then I should see the post in a modal
