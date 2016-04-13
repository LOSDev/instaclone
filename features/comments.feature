Feature: Comments

  Scenario: Create a comment
    Given I am a logged in user
    When I create a comment
    Then I should see the comment
