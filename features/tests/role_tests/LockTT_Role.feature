Feature: Lock TT interface

  Background:
    Given I am logged in as lock tt role
    And I am on lock_tt page
    And lock_tt_page is visible

  @role
  Scenario: Change sorting by Group
    When I click sort_by_group_button
    And I wait 1 seconds for animation stops
    Then sort_text should contain Groups / Users

  @role
  Scenario: Change sorting by TZ
    When I click sort_by_time_zone_button
    And I wait 1 seconds for animation stops
    Then sort_text should contain Time Zones / Users

  @role
  Scenario: Change sorting by User
    When I click sort_by_user_button
    And I wait 1 seconds for animation stops
    Then sort_text should contain Users / Tasks

  @role
  Scenario: Change user filter
    When I click date_selector_button
    And I click current_week_button
    And date_selector_button should contain Current week
    And I click user_selector_button
    And I click selected_users_radiobutton
    And I click user_selector_filter
    And I enter Cruz in the user_selector_search
    And I wait 1 seconds for animation stops
    And I click user_cruz
    And I click close_user_selector_button
    And I wait 1 seconds for animation stops
    And user_selector_text should contain Cruz, Gordman
    Then result_text should contain 1
    And I refresh the page
    And I click clear_filter_button
    And I click date_selector_button
    And I click cur_prev_week_button

  @role
  Scenario: Check task
    When I am logged in as admin
    Given I create necessary time-track and return to the lock tt
    And I am logged in as lock tt role
    And lock tt page is visible
    And I click expand_all_button
    And I wait 1 seconds for animation stops
    Then first_row_details should contain Backup controlling

  @role
  Scenario: Change Task with Enter TT permission
    When I am logged in as admin
    And I am on user_list page
    And user_list_page is visible
    And I click locktt_role
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I wait 1 seconds for animation stops
    And I click enter_tt_edit_user
    And I wait 1 seconds for animation stops
    And I am logged in as lock tt role
    And I am on lock_tt page
    And lock tt page is visible
    And I click expand_all_button
    And first_row_details should contain Backup controlling
    And I click first_row_details
    And tasks page is visible
    And I click task status
    And I click complete task
    And I wait 1 seconds for animation stops
    Then I should see a text Status of task 'Backup controlling' has been changed on the page

  @role
  Scenario: Change Task with Manage Scope of Work permission
    When I am logged in as admin
    And I am on user_list page
    And user_list_page is visible
    And I click locktt_role
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I wait 1 seconds for animation stops
    And I click manage_scope_perm_edit_user
    And I wait 1 seconds for animation stops
    And I click access_to_scope
    And I wait 1 seconds for animation stops
    And I click entire_access_to_scope
    And I click access_to_scope_back_button
    And I wait 1 seconds for animation stops
    And access_to_scope_label should contain Entire scope
    And I wait 1 seconds for animation stops
    And I am logged in as lock tt role
    And I am on lock_tt page
    And lock tt page is visible
    And I click expand_all_button
    And I click first_row_details
    And I click type_of_work_button
    And I click type_programming
    And I wait 1 seconds for animation stops
    And type_of_work_button should have title with Billable: programming
    And I click type_of_work_button
    And I click type_non_billable
    And I wait 1 seconds for animation stops
    Then type_of_work_button should have title with Non-Billable


  @role
  Scenario: Check tasks when 3rd DAR setting on
    When I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings
    And general_settings_page is visible
    And I perform select in the gs_dar_hide_tt_lock_tt
    And I click gs_save
    And I wait 2 seconds for animation stops
    And I am logged in as lock tt role
    And lock tt page is visible
    Then I should not see a web element expand_all_button


  @role
  Scenario: Lock/Unlock all dates
    When I click dates_till
    And I click lock_all
    And I should see a web element lock_arrow
    And I click scroll_7_days_back
    And I wait 2 seconds for animation stops
    And I click dates_till
    And I click unlock_all
    And I click scroll_7_days_forward
    And I wait 2 seconds for animation stops
    Then I should not see a web element lock_arrow

  @role
  Scenario: Lock/Unlock one day for all users
    When I click date_cell
    And I click lock_selected
    And I should see a web element user_date_cell_locked
    And I wait 2 seconds for animation stops
    And I click date_cell
    And I click unlock_selected
    And I wait 2 seconds for animation stops
    Then I should not see a web element user_date_cell_locked

  @role
  Scenario: Lock/Unlock one day for one user
    When I click user_date_cell
    And I wait 2 seconds for animation stops
    And I should see a web element user_date_cell_locked
    And I wait 2 seconds for animation stops
    And I click user_date_cell
    And I wait 2 seconds for animation stops
    Then I should not see a web element user_date_cell_locked