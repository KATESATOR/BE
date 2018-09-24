Feature: Enter TT interface by user

  Background:
    Given I am logged in as user
    And enter_tt_page is visible

  @smoke
  Scenario: Add Task
    When I enter Page_updates in the search_task
    And I click tasks_found_list
    And I wait 2 seconds for animation stops
    Then I should see a text Page updates on the page

  @smoke
  Scenario: Save time-track
    When I enter 2:00 in the tt_field
    And I click save_button
    And I wait 2 seconds for animation stops
    Then tt_field should have value with 2:00

  @smoke
  Scenario: Save leave time
    When I click leave_button
    And I click choose_leave
    And I click ok_leave
    And I click save_button
    Then leave_button should contain whole day

  @smoke
  Scenario: Save comment
    When I click tt_comment
    And I enter comment in the comment_field
    And I click ok_comment
    Then comment_length should contain 7

  @smoke
  Scenario: Change week status
    When I click change_own_status
    And I click save_button
    Then I should see a text Your changes were successfully saved. on the page

  @smoke
  Scenario: Select another week
    When I click calendar
    And I click next_month
    And I click first_day
    Then I should see a web element add_only

  @smoke
  Scenario: Create Task
    When I click new_task
    And I wait 1 seconds for animation stops
    And I click select_customer_for_task
    And I click our_company_customer
    And I click select_project_for_task
    And I click general_project
    And I enter _TestTask in the task_field
    And I click create_task
    And I wait 1 seconds for animation stops
    Then I should see a text TestTask on the page

  @smoke
  Scenario: Edit Task
    When I click edit_task
    And I click task_name
    And I enter _Edited name in the task_name_field
    And I click close_task_panel
    And I refresh the page
    Then I should see a text _Edited name on the page

  @smoke
  Scenario: Delete Task
    When I click edit_task
    And I click task_actions
    And I click delete_task
    And I click confirm_deletion
    And I wait 2 seconds for animation stops
    Then I should not see a text Phone calls on the page
