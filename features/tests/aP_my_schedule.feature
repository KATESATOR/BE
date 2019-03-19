Feature: aP My Schedule interface by admin


  Background:
    Given I am logged in actiPLANS as admin
    And ap_my_schedule is visible

  @Smoke
  Scenario: Creating, editing, deleting leave request
    When I click week_start_day_cell
    And I click submit_request
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType1 fullLeave
    And I click week_start_day_cell
    And I click edit_request
    And I click leave_type_selector
    And I click third_leave_type
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 fiftyPercentLeave
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
    And I should see a web element current_week
    And I click date_selector
    And I click first_week_date_selector
    And I wait 1 seconds for animation stops
    And I should see a web element return_to_cur_week
    And I click date_selector
    And I click current_week_date_selector
    And I wait 1 seconds for animation stops
    Then I should not see a web element return_to_cur_week

  @Smoke
  Scenario: Users selector
    When I click user_selector
    And I click selected_user
    And I click stivers_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain Stivers, Melanie
    And colleague_first_row should contain Stivers, Melanie
    And I click user_selector
    And I click selected_user
    And I click stivers_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain All users
    Then colleague_first_row should contain Cruz, Gordman

  @Smoke
  Scenario: Editing and deleting request in table
    When I click last_day_cell
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I should see a web element leave_last_day_cell
    And I click no_leave_cell
    And I click leave_type_selector
    And I click sixth_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click requests_tab
    And I click first_row_edit_period
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_requested_time should contain 0.5 days (4h)
    And first_row_balance_after should contain 3.6d
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I click balances_filter
    And I click sick_days_balances_filter
    And I click sorting_period
    And I click first_row_leave_name
    And I click leave_type_selector
    And I click last_leave_type
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And I click first_row_edit_period
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_requested_time should contain 0 days (0h)
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click balances_filter
    And I click all_balances_filter
    And I click sorting_period
    Then I should see a web element period_sorting_asc

  @Smoke
  Scenario: Sorting in table
    When I click requests_tab
    And I click show_past_leaves_chkbx
    And I should see a web element past_leave_row
    And I click sorting_leave_type
    And first_row_leave_name should contain Sick Leave
    And I click sorting_leave_type
    And first_row_leave_name should contain Medical Treatment
    And I click sorting_period
    And first_row_leave_name should contain Sick Leave
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
    And I should see a text T. on the page
    And I click my_profile
    And I enter Robert in the profile_first_name
    And I enter   in the profile_middle_name
    And I enter Barber in the profile_last_name
    And I click profile_save
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I should see a text Robert on the page
    Then I should see a text Barber on the page