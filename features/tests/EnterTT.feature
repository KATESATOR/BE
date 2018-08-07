Feature: Enter TT interface

  Background:
    Given I am logged in as admin

  @smoke
  Scenario: Add Task
    Given enter_tt_page is visible
    When I enter Page updates in the search_task
    And I click tasks_found_list
    And I wait 2 seconds for animation stops
    Then I should see a text Page updates on the page

  @smoke
  Scenario: Save time-track
    Given I wait 2 seconds for animation stops
    When enter_tt_page is visible
    And I enter 2:00 in the tt_field
    And I click save_button
    And I wait 2 seconds for animation stops
    Then tt_field should contain value with 2:00

  @smoke
  Scenario: Save leave time
    Given enter_tt_page is visible
    When I click leave_button
    And I click choose_leave
    And I click ok_leave
    And I click save_button
    Then leave_button should contain whole day

  @smoke
  Scenario: Save comment
    Given enter_tt_page is visible
    When I click tt_comment
    And I enter comment in the comment_field
    And I click ok_comment
    Then comment_length should contain 7

  @smoke
  Scenario: Change week status
    Given enter_tt_page is visible
    When I click change_own_status
    And I click save_button
    Then I should see a text Your changes were successfully saved. on the page


