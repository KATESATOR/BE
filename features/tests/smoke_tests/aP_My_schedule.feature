Feature: aP My Schedule interface by admin


  Background:
    Given I am logged in actiPLANS as admin
    And ap_my_schedule is visible

  @Smoke
  Scenario: 'Balances as of' changing
    When I click calendar
    And I click month_in_calendar
    And I click March_in_calendar
    And I click calendar_ok_button
    And I click first_date_calendar
    And I wait 1 seconds for animation stops
    And calendar should contain Mar 01, 2019
    And pto_value should contain 4.4d
    And sick_value should contain 1.3d
    And I click calendar
    And I click calendar_today
    And I wait 1 seconds for animation stops
    Then calendar should contain today

  @Smoke
  Scenario: Pager on requests list
    When I click page_selector
    And I click second_option_page_selector
    And I wait 1 seconds for animation stops
    And I should see a web element twenty_first_user_in_list
    And I click page_selector
    And I click first_option_page_selector
    And I wait 1 seconds for animation stops
    And I should not see a web element twenty_first_user_in_list
    And I click next_page_button
    And I wait 1 seconds for animation stops
    And selected_page should contain 2
    And I click previous_page_button
    And I wait 1 seconds for animation stops
    Then selected_page should contain 1

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
    And week_start_day_cell should have class with dayCell weekStartDay noLeave
    And I click week_start_day_no_leave
    And I click leave_type_selector
    And I click third_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click week_start_day_no_leave
    And I click leave_type_selector
    And I click third_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click week_start_day_no_leave
    And I click leave_type_selector
    And I click last_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click week_start_day_no_leave
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click week_start_day_no_leave
    And I click leave_type_selector
    And I click sixth_leave_type
    And I click submit_request
    And I wait 1 seconds for animation stops
    And I click last_day_cell
    And I click submit_request
    And I wait 1 seconds for animation stops
    Then I should see a web element leave_last_day_cell

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
  Scenario: Filtering and searching users
    When I click user_selector
    And I click selected_users
    And I click filter_in_user_selector
    And I enter Stivers in the search_in_user_selector
    And I click stivers_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain Stivers, Melanie
    And colleague_first_row should contain Stivers, Melanie
    And I click user_selector
    And I click selected_users
    And I click collapse_all_in_user_selector
    And I click design_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain Design
    And colleague_first_row should contain Gibson, Maurice
    And I click user_selector
    And I click all_users
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain All users
    And colleague_first_row should contain Cruz, Gordman
    And I click user_selector
    And I click selected_users
    And I click design_in_selector
    And I click apply_user_selector
    And I wait 1 seconds for animation stops
    And user_selector should contain All users
    And colleague_first_row should contain Cruz, Gordman
    And I enter Moss in the users_search_field
    And I wait 1 seconds for animation stops
    And search_result_first_row should contain Moss
    And I enter 123 in the users_search_field
    And I wait 1 seconds for animation stops
    And colleague_first_row should contain There are no users found
    And I click clear_search
    And I wait 1 seconds for animation stops
    Then colleague_first_row should contain Cruz, Gordman

  @Smoke
  Scenario: Sorting and filter in table
    When I click requests_tab
    And I click sorting_leave_type
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Sick Leave
    And I click sorting_leave_type
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And I click sorting_status
    And I should see a web element status_sorting_asc
    And I click sorting_period
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Vacation
    And I should see a web element period_sorting_asc
    And I click balances_filter
    And I click sick_days_balances_filter
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And balances_filter should contain Sick Days Balance
    And I click balances_filter
    And I click pto_balances_filter
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Vacation
    And balances_filter should contain PTO Balance
    And I click balances_filter
    And I click all_balances_filter
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Vacation
    Then balances_filter should contain All balances

  @Smoke
  Scenario: Editing and deleting request in table
    When I click requests_tab
    And I click first_row_edit_period
    And I enter 4 in the day_duration_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_requested_time should contain 0.5 days (4h)
    And first_row_balance_after should contain 5.1d
    And I click first_row_leave_name
    And I click leave_type_selector
    And I click last_leave_type
    And I enter Test in the comment_field
    And I click save_changes
    And I wait 1 seconds for animation stops
    And first_row_leave_name should contain Medical Treatment
    And first_row_balance_after should contain 0d
    And I should see a web element first_row_sd_balance
    And I should see a web element leave_comment
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I should not see a web element leave_comment
    And I should not see a web element first_row_sd_balance
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I click first_row_delete
    And I accept alert menu
    And I wait 1 seconds for animation stops
    Then empty_data_row should contain No matching records found

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