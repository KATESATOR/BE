Feature: AP Leaves Management by admin

  Background:
    Given I am logged in actiPLANS as admin
    And I am on leaves_management page
    And ap_leaves_management is visible

  @Smoke
  Scenario: Pager on requests list
    When I click lt_requests_tab
    And I click next_page_button
    And I wait 1 seconds for animation stops
    Then I should not see a web element request_10th_row

  @Smoke
  Scenario: Sorting in requests table
    When I click lt_requests_tab
    And I click sort_users
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Alvarez, Daniel
    And I click sort_groups
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Meyers, Allison
    And I click sort_leave_type
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Ramirez, Maria
    And I click sort_status
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Alvarez, Daniel
    And I click sort_period
    And I wait 1 seconds for animation stops
    Then first_row_name_table should contain Ramirez, Maria

  @Smoke
  Scenario: User Filter in leave time planning chart
    When I click user_filter
    And I click selected_users
    And I perform select in the qc_in_user_filter
    And I click apply_filter
    And I wait 2 seconds for animation stops
    And user_filter should contain 1 department
    And first_row_name_chart should contain Ramirez, Maria
    And I click user_filter
    And I click selected_users
    And I perform select in the qc_in_user_filter
    And I click all_users
    And I click apply_filter
    And I wait 2 seconds for animation stops
    Then user_filter should contain All Users

  @Smoke
  Scenario: Modifying leave request in chart and user filter in table
    When I click previous_week_button
    And I click week_start_day_cell
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType2 approved fullLeave
    And first_row_balance_chart should contain 28
    And I click week_start_day_cell
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType2 fullLeave
    And I click week_start_day_cell
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType2 approved fullLeave
    And I click week_start_day_cell
    And I click fourth_element_in_menu
    And I click lt_edit_menu
    And I click second_element_in_menu
    And I enter 2 in the lt_time_field
    And I click save_lt_edit
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 approved twentyFivePercentLeave
    And I click week_start_day_cell
    And I click second_element_in_menu
    And I click reject_button
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay noLeave
    And I click lt_requests_tab
    And I click user_filter_table
    And I click selected_users
    And I perform select in the hr_in_user_filter
    And I click apply_filter
    And I wait 2 seconds for animation stops
    And user_filter_table should contain 1 department
    And I click sort_users
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Meyers, Allison
    And I perform select in the first_row_checkbox
    And I click delete_bulk
    And I click delete_ok_button
    And I wait 1 seconds for animation stops
    And I click sort_period
    And I click user_filter_table
    And I click selected_users
    And I perform deselect in the hr_in_user_filter
    And I click all_users
    And I click apply_filter
    And I wait 2 seconds for animation stops
    Then user_filter_table should contain All Users

  @Smoke
  Scenario: Deleting leave request in chart and Changing weeks
    When I click previous_week_button
    And I click week_start_day_cell
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType2 approved fullLeave
    And I click week_start_day_cell
    And I click sixth_element_in_menu
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay noLeave
    And I click next_week_button
    And I click return_to_cur_week
    Then I should not see a web element return_to_cur_week

  @Smoke
  Scenario: Filtering by leave type and status, and edit request in table
    When I click lt_requests_tab
    And I click status_filter
    And I click all_statuses_in_filter
    And I click first_row_request_date
    And I enter 2 in the request_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_period should contain 0.3d (2h)
    And I click leave_type_filter
    And I click selected_ltype_in_filter
    And I perform select in the vacation_in_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And first_row_leave_type should contain Vacation
    And leave_type_filter should contain Vacation
    And I click first_row_status
    And I click first_element_in_menu
    And I refresh the page
    And I click status_filter
    And I click third_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_status should contain Approved
    And status_filter should contain Approved
    And I click first_row_leave_type
    And I click fourth_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_leave_type should contain Business Trip
    And I click first_row_status
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_status should contain Waiting for Approval
    And I click first_row_leave_type
    And I click second_element_in_menu
    And I click first_row_status
    And I click first_element_in_menu
    And I click leave_type_filter
    And I perform select in the vacation_in_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And I click status_filter
    And I click all_statuses_in_filter
    And I wait 1 seconds for animation stops
    Then status_filter should contain All statuses

  @Smoke
  Scenario: Bulk actions in table
    When I click today_cell
    And I click first_element_in_menu
    And I click lt_requests_tab
    And I refresh the page
    And I click user_filter_table
    And I click selected_users
    And I perform select in the hr_in_user_filter
    And I click apply_filter
    And I wait 2 seconds for animation stops
    And user_filter_table should contain 1 department
    And first_row_name_table should contain Meyers, Allison
    And I click first_row_status
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_status should contain Waiting for Approval
    And I perform select in the first_row_checkbox
    And I click approve_bulk
    And I wait 1 seconds for animation stops
    And first_row_status should contain Approved
    And I perform select in the first_row_checkbox
    And I click reject_bulk
    And I click reject_ok_button
    And I wait 1 seconds for animation stops
    And first_row_status should contain Rejected
    And I click status_filter
    And I click rejected_status_filter
    And I perform select in the first_row_checkbox
    And I click delete_bulk
    And I click delete_ok_button
    And I wait 1 seconds for animation stops
    And I should not see a web element first_row_name_table
    And I click user_filter_table
    And I click selected_users
    And I perform select in the hr_in_user_filter
    And I click apply_filter
    And I wait 2 seconds for animation stops
    And user_filter_table should contain All Users
    And I click status_filter
    And I click first_element_in_menu
    Then status_filter should contain All statuses