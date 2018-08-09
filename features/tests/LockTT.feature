Feature: Lock TT interface

  @smoke
  Scenario: Change sorting by Group/TZ/User
    Given I open a page http://rdbuild-agent:8080/cur/login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
    And lock_tt_page is visible
    And I click lock_tt_button
    And I wait 2 seconds for animation stops
    And I click sort_by_group_button
    And I wait 2 seconds for animation stops
    And I click sort_by_time_zone_button
    And I wait 2 seconds for animation stops
    And I click sort_by_user_button
    And I wait 2 seconds for animation stops

  @smoke
  Scenario: Change user filter
    Given I open a page http://rdbuild-agent:8080/cur/login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
    And lock_tt_page is visible
    And I click lock_tt_button
    And I click date_selector_button
    And I click current_week_button
    And I click users_selector_button
    And I click selected_users_button
    And I click user_barber_robert
    And I click close_users_selector_button
    And I click clear_filter_button
    And I click date_selector_button
    And I wait 5 seconds for animation stops
    And I click cur_and_prev_week_button

  @smoke
  Scenario: Change task
    Given I open a page http://rdbuild-agent:8080/cur/login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
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
    Given I open a page http://rdbuild-agent:8080/cur/login.do
    When at_login_page is visible
    And I enter admin in the username_field
    And I enter manager in the password_field
    And I click login_button
    And lock_tt_page is visible
    And I click lock_tt_button
    And I click date_cell
    And I click lock_selected
    And I click date_cell
    And I click unlock_selected