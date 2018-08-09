Feature: Lock TT interface

  Background:
    Given I am logged in as admin

  @smoke
  Scenario: Change sorting by Group/TZ/User
    And lock_tt_page is visible
    And I click lock_tt_button
    And I click sort_by_group_button
    And I click sort_by_time_zone_button
    And I click sort_by_user_button

  @smoke
  Scenario: Change user filter
    And lock_tt_page is visible
    And I click lock_tt_button
    And I click date_selector_button
    And I click current_week_button
    And I click user_selector_button
    And I click selected_users_radiobutton
    And I click user_barber_robert
    And I click close_user_selector_button
    And I click clear_filter_button

  @smoke
  Scenario: Change task
    And lock_tt_page is visible
    And I click lock_tt_button
    And I click expand_all_button
    And I click task_name
    And I click type_of_work_button
    And I click type_programming
    And I click type_of_work_button
    And I click type_non_billable
    And I click collapse_all_button

  @smoke
  Scenario: Lock/Unlock one day
    And lock_tt_page is visible
    And I click lock_tt_button
    And I click date_cell
    And I click lock_selected
    And I click user_date_cell
    And I wait 2 seconds for animation stops
    And I click date_cell
    And I click unlock_selected