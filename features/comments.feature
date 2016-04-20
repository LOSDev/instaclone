Feature: Comments

  Scenario: Create a comment
    Given I am a logged in user
    When I create a comment
    Then I should see the comment

  Scenario: Create invalid comment
    Given I am a logged in user
    When I create an invalid comment
    Then I should see a flash error message

  Scenario: Delete a comment
    Given I am a logged in user
    When I create a comment
    And I delete the comment
    Then I should not see the comment

  Scenario: Delete comment of another user
    Given I am a logged in user
    When I see a comment from another user
    Then I should not see the delete link
