Feature: Posts

  Scenario: Create a post
    Given I am a logged in user
    When I create a post
    Then I should be redirected to the new post

  Scenario: Create invalid post
    Given I am a logged in user
    When I create a post without an image
    Then I should see a flash message with an error
