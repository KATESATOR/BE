Feature: Enter TT interface of other user

  Background:
    Given I am logged in as admin
    And enter_tt_page is visible
    And I select tt of other user

  @smoke
  Scenario: Add Task
    When I enter Page updates in the search_task
    And I click tasks_found_list
    And I wait 1 seconds for animation stops
    Then I should see a text Page updates on the page

  @smoke
  Scenario: Save time-track
    When I enter 2:00 in the tt_field
    And I click save_button
    And I wait 1 seconds for animation stops
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
  Scenario: Approve week
    When I click approve_status
    Then current_status should contain Approved

  @smoke
  Scenario: Revoke status
    When I click revoke_status
    Then current_status should contain Not Ready

  @smoke
  Scenario: Reject week
    When I click reject_status
    And I click confirm_rejection
    And I wait 1 seconds for animation stops
    Then current_status should contain Rejected

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
    And I wait 1 seconds for animation stops
    Then I should not see a text Phone calls on the page

  @smoke
  Scenario: Edit name in My Profile
    When I click my_profile
    And I enter Firstname in the first_name_field
    And I enter Lastname in the last_name_field
    And I click save_profile_changes
    And I wait 1 seconds for animation stops
    Then I should see a text Firstname Lastname on the page
