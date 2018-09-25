Feature: Enter TT interface of other user

  Background:
    Given I am logged in as admin
    And enter tt page is visible
    And I select tt of other user

  @smoke
  Scenario: Add Task
    When I enter Page updates in the search task
    And I click tasks found list
    And I wait 1 seconds for animation stops
    Then I should see a text Page updates on the page

  @smoke
  Scenario: Save time-track
    When I enter 2:00 in the tt field
    And I click save button
    And I wait 1 seconds for animation stops
    Then tt field should have value with 2:00

  @smoke
  Scenario: Save leave time
    When I click leave button
    And I click choose leave
    And I click ok leave
    And I click save button
    Then leave button should contain whole day

  @smoke
  Scenario: Save comment
    When I click tt comment
    And I enter comment in the comment field
    And I click ok comment
    Then comment length should contain 7

  @smoke
  Scenario: Approve week
    When I click approve status
    And I wait 1 seconds for animation stops
    Then current status should contain Approved

  @smoke
  Scenario: Revoke status
    When I click revoke status
    And I wait 1 seconds for animation stops
    Then current status should contain Not Ready

  @smoke
  Scenario: Reject week
    When I click reject status
    And I click confirm rejection
    And I wait 1 seconds for animation stops
    Then current status should contain Rejected

  @smoke
  Scenario: Select another week
    When I click calendar
    And I click next month
    And I click next week
    Then I should see a web element add only

  #Сейчас тест падает из-за бага AT-2128
  @smoke
  Scenario: Create Task
    When I click new task
    And I wait 1 seconds for animation stops
    And I click select customer for task
    And I click our company customer
    And I click select project for task
    And I click general project
    And I enter _TestTask in the task field
    And I click create task
    And I wait 1 seconds for animation stops
    Then I should see a text _TestTask on the page

  @smoke
  Scenario: Edit Task
    When I click edit task
    And I click task name
    And I enter _Edited name in the task name field
    And I click close task panel
    And I wait 1 seconds for animation stops
    And I refresh the page
    Then I should see a text _Edited name on the page

  @smoke
  Scenario: Delete Task
    When I click edit task
    And I click task actions
    And I click delete task
    And I click confirm deletion
    And I wait 2 seconds for animation stops
    Then I should not see a text _Edited name on the page
