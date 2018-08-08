Feature: Enter TT interface by admin

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

  @smoke
  Scenario: Select another week
    Given enter_tt_page is visible
    When I click calendar
    And I click next_month
    And I click first_day
    Then I should see a web element add_only

  @smoke
  Scenario: Create Task for the first time
    Given enter_tt_page is visible
    When I click new_task
    And I wait 2 seconds for animation stops
    And I click customer_button
    And I click our_company_customer
    And I click project_button
    And I click general_project
    And I enter _TestTask in the task_field
    And I click create_task
    And I wait 2 seconds for animation stops
    Then I should see a text TestTask on the page

  @smoke
  Scenario: Create Task for the second and more times
    Given enter_tt_page is visible
    When I click new_task
    And I wait 2 seconds for animation stops
    And I enter _TestTask2 in the task_field
    And I click create_task
    And I wait 2 seconds for animation stops
    Then I should see a text TestTask2 on the page

  @smoke
  Scenario: Edit Task
    Given enter_tt_page is visible
    When I click edit_task
    And I click task_name
    And I enter _Edited name in the task_name_field
    And I click close_task_panel
    And I refresh the page
    Then I should see a text _Edited name on the page

  @smoke
  Scenario: Delete Task
    Given enter_tt_page is visible
    When I click edit_task
    And I click task_actions
    And I click delete_task
    And I click confirm_deletion
    And I wait 2 seconds for animation stops
    Then I should not see a text Phone calls on the page

  @smoke
  Scenario: Edit name in My Profile
    Given general_page is visible
    When I click my_profile
    And I enter Firstname in the first_name_field
    And I enter Lastname in the last_name_field
    And I click save_profile_changes
    And I wait 2 seconds for animation stops
    Then I should see a text Firstname Lastname on the page

  @smoke
  Scenario: Select another user
    Given enter_tt_page is visible
    When I click user_selector_button
    And I click gibson_maurice_user
    Then I should see a text Back to me on the page