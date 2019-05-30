Feature: AP Leaves Management by admin

  Background:
    Given I am logged in actiPLANS as admin
    And I am on ap_leaves_management page
    And ap_leaves_management is visible

  @Smoke
  Scenario: Changing weeks in chart
    When I click previous_week_button
    And I click return_to_cur_week
    And I wait 1 seconds for animation stops
    And I should not see a web element return_to_cur_week
    And I click next_week_button
    And I click return_to_cur_week
    And I wait 1 seconds for animation stops
    And I should not see a web element return_to_cur_week
    And I click date_selector
    And I click first_week_date_selector
    And I wait 1 seconds for animation stops
    And I should see a web element return_to_cur_week
    And I click date_selector
    And I click current_week_date_selector
    And I wait 1 seconds for animation stops
    Then I should not see a web element return_to_cur_week

  @Smoke
  Scenario: Creating and deleting leave requests in chart
    When first_row_name_chart should contain Cruz, Gordman
    And I click week_start_day_cell_no_leave
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell_leave should have class with dayCell weekStartDay leaveType1 approved fullLeave
    And I click week_start_day_cell_leave
    And I click sixth_element_in_menu
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay noLeave
    And I refresh the page
    And I click week_start_day_cell_no_leave
    And I click third_element_in_menu
    And I wait 1 seconds for animation stops
    And I click week_start_day_cell_no_leave
    And I click fourth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click fifth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click sixth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click seventh_element_in_menu
    And I click sort_users_chart
    And I wait 1 seconds for animation stops
    And first_row_name_chart should contain Wooster, Jennifer
    And I click week_start_day_cell_no_leave
    And I click ninth_element_in_menu
    And I wait 1 seconds for animation stops
    And I click lt_edit_menu
    And I click third_element_in_menu
    And I enter 4 in the lt_time_field
    And I enter Test comment in the lt_comment_field
    And I click submit_request_button
    And I wait 1 seconds for animation stops
    And week_start_day_cell_leave should have class with dayCell weekStartDay leaveType3 approved fiftyPercentLeave
    And I click week_start_day_cell_no_leave
    And I click second_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click third_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click fourth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click fifth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click sixth_element_in_menu
    And I click week_start_day_cell_no_leave
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And I click sort_users_chart
    And I wait 1 seconds for animation stops
    And first_row_name_chart should contain Cruz, Gordman
    Then first_row_planned_lt should contain 45

  @Smoke
  Scenario: Pager on requests list
    When I click lt_requests_tab
    And I click page_selector
    And I click second_option_page_selector
    And I wait 1 seconds for animation stops
    And I should see a web element twelfth_row
    And I click page_selector
    And I click first_option_page_selector
    And I wait 1 seconds for animation stops
    And I should not see a web element twenty_fifth_row
    And I click next_page_button
    And I wait 1 seconds for animation stops
    And selected_page should contain 2
    And I click previous_page_button
    And I wait 1 seconds for animation stops
    Then selected_page should contain 1

  @Smoke
  Scenario: Searching user in Chart
    When I enter 123 in the search_field_chart
    And I wait 1 seconds for animation stops
    And first_row_name_chart should contain There are no users to review
    And I click clear_search
    And I wait 1 seconds for animation stops
    And first_row_name_chart should contain Cruz, Gordman
    And I enter Moss in the search_field_chart
    And I wait 1 seconds for animation stops
    Then search_result_chart should contain Moss

  @Smoke
  Scenario: Searching user in Table
    When I click lt_requests_tab
    And I enter 123 in the search_field_table
    And I wait 2 seconds for animation stops
    And no_leave_time_row should contain There are no leave time requests to process
    And I click clear_search
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Cruz, Gordman
    And I enter Wooster in the search_field_table
    And I wait 1 seconds for animation stops
    Then search_result_table should contain Wooste

  @Smoke
  Scenario: Sorting and filtering in requests table
    When I click lt_requests_tab
    And I click sort_period
    And I wait 1 seconds for animation stops
    And sort_period should have class with descending
    And first_row_name_table should contain Wooster, Jennifer
    And I click user_filter_table
    And I click selected_users
    And I perform select in the administration_in_user_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And user_filter_table should contain 1 department
    And first_row_name_table should contain Wooster, Jennifer
    And I click user_filter_table
    And I click selected_users
    And I perform select in the administration_in_user_filter
    And I perform select in the wo_dept_in_user_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And no_leave_time_row should contain There are no leave time requests to process
    And I click user_filter_table
    And I click all_users
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And user_filter_table should contain All Users
    And I click sort_users
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Cruz, Gordman
    And I click sort_groups
    And I wait 1 seconds for animation stops
    And first_row_name_table should contain Cruz, Gordman
    And first_group_in_table should have title with Administration
    And I click sort_by_time_zone
    And I wait 1 seconds for animation stops
    And sort_by_time_zone should have class with ascending
    And first_row_name_table should contain Wooster, Jennifer
    And first_group_in_table should have title with New York Office
    And I click request_comment_button
    And I should see a web element request_comment
    And request_comment should contain Test comment
    And I refresh the page
    And I click sort_leave_type
    And I wait 1 seconds for animation stops
    And first_row_leave_type should contain Sick Leave
    And I click sort_status
    And I wait 1 seconds for animation stops
    And sort_status should have class with ascending
    And I click sort_period
    And I wait 1 seconds for animation stops
    Then sort_period should have class with ascending

  @Smoke
  Scenario: User Filter in leave time planning chart
    When I click user_filter
    And I click selected_users
    And I perform select in the administration_in_user_filter
    And I click apply_filter
    And I wait 2 seconds for animation stops
    And user_filter should contain 1 department
    And first_row_name_chart should contain Cruz, Gordman
    And I click user_filter
    And I click selected_users
    And I perform select in the administration_in_user_filter
    And I click all_users
    And I click apply_filter
    And I wait 2 seconds for animation stops
    Then user_filter should contain All Users

  @Smoke
  Scenario: Modifying leave request in chart
    When I click week_start_day_cell
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 fullLeave
    And I click week_start_day_cell
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType3 approved fullLeave
    And I click week_start_day_cell
    And I click fourth_element_in_menu
    And I click lt_edit_menu
    And I click second_element_in_menu
    And I enter 2 in the lt_time_field
    And I click save_lt_edit
    And I wait 1 seconds for animation stops
    And week_start_day_cell should have class with dayCell weekStartDay leaveType2 approved tenPercentLeave
    And I click week_start_day_cell
    And I click second_element_in_menu
    And I click reject_button
    And I wait 1 seconds for animation stops
    Then week_start_day_cell should have class with dayCell weekStartDay noLeave

  @Smoke
  Scenario: Filtering by leave type and status, and edit request in table
    When I click lt_requests_tab
    And I click first_row_status
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    And first_row_status should contain Waiting for Approval
    And I click first_row_request_date
    And I enter 2 in the request_duration_field
    And I click save_changes
    And I wait 2 seconds for animation stops
    And first_row_period should contain 0.3d (2.03h)
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
    And I click third_element_in_menu
    And I click leave_type_filter
    And I perform select in the vacation_in_filter
    And I click apply_filter
    And I wait 1 seconds for animation stops
    And I click status_filter
    And I click all_statuses_in_filter
    And I wait 1 seconds for animation stops
    And status_filter should contain All statuses
    And I click balances_filter
    And I click second_element_in_menu
    And I wait 1 seconds for animation stops
    And balances_filter should contain PTO Balance
    And first_row_leave_type should contain Time Off
    And I click balances_filter
    And I click third_element_in_menu
    And I wait 1 seconds for animation stops
    And balances_filter should contain Sick Days Balance
    And first_row_leave_type should contain Medical Treatment
    And I click balances_filter
    And I click first_element_in_menu
    And I wait 1 seconds for animation stops
    Then balances_filter should contain All balances

  @Smoke
  Scenario: Bulk actions in table
    When I click lt_requests_tab
    And I perform select in the first_row_checkbox
    And I click reject_bulk
    And I click reject_ok_button
    And I wait 1 seconds for animation stops
    And first_row_status should contain Rejected
    And I perform select in the first_row_checkbox
    And I click delete_bulk
    And I click delete_ok_button
    And I wait 1 seconds for animation stops
    And first_row_status should contain Waiting for Approval
    And I perform select in the first_row_checkbox
    And I click approve_bulk
    And I wait 1 seconds for animation stops
    And first_row_status should contain Approved
    And I perform select in the common_chkbx
    And I click delete_bulk
    And I click delete_ok_button
    And I wait 1 seconds for animation stops
    And I perform select in the common_chkbx
    And I click delete_bulk
    And I click delete_ok_button
    And I wait 1 seconds for animation stops
    And no_leave_time_row should contain There are no leave time requests to process
    Then I should not see a web element first_row_status
