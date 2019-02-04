Feature: aP My Schedule interface by admin


  Background:
    Given I am logged in actiPLANS as admin
    And ap_my_schedule is visible

  @Smoke
  Scenario: Creating, editing, deleting leave request
    When I click week_start_day_cell
    And I click submit_request
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType1 approved fullLeave
    And I click week_start_day_cell
    And I click edit_request
    And I click leave_type_selector
    And I click third_leave_type
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 approved fiftyPercentLeave
    And I click week_start_day_cell
    And I click delete_request
    And I accept alert menu
    And I wait 1 seconds for animation stops
    Then week_start_day_cell should have class with dayCell weekStartDay noLeave

  @Smoke
  Scenario: Switching weeks
    When I click next_week
    And I click return_to_cur_week
    And I should see a web element current_week
    And I click previous_week
    And I click return_to_cur_week
    Then I should see a web element current_week

  @Smoke
  Scenario: Users selector
    When I click user_selector
    And I click selected_user
    And I click meyers_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain Meyers, Allison
    And colleague_first_row should contain Meyers, Allison
    And I click user_selector
    And I click selected_user
    And I click meyers_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain All users
    Then colleague_first_row should contain Alvarez, Daniel

  @Smoke
  Scenario: Editing and deleting request in table
    When I click last_day_cell
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I should see a web element approved_last_day_cell
    And I click requests_tab
    And I click sorting_period
    And I click first_row_leave_name
    And I click leave_type_selector
    And I click third_leave_type
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Vacation
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click sorting_period
    And I should see a web element period_sorting_asc
    And I click first_row_edit_period
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    Then first_row_requested_time should contain 0.5 days (4h)

  @Smoke
  Scenario: Sorting in table
    When I click requests_tab
    And I click show_past_leaves_chkbx
    And I should see a web element past_leave_row
    And I click sorting_leave_type
    And first_row_leave_name should contain Sick Leave
    And I click sorting_leave_type
    And first_row_leave_name should contain Business Trip
    And I click sorting_period
    And first_row_leave_name should contain Time Off
    And I should see a web element period_sorting_asc
    And I click show_past_leaves_chkbx
    And I wait 1 seconds for animation stops
    Then I should not see a web element past_leave_row
    
  @Smoke
  Scenario: Editing My profile
    When I click my_profile
    And I enter Test in the profile_first_name
    And I enter T in the profile_middle_name
    And I enter Smith in the profile_last_name
    And I click profile_save
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I should see a text Test on the page
    And I should see a text Smith on the page
    And I click my_profile
    And I enter John in the profile_first_name
    And I enter   in the profile_middle_name
    And I enter Doe in the profile_last_name
    And I click profile_save
    And I wait 1 seconds for animation stops
    And I refresh the page
    Then I should see a text Doe on the page

