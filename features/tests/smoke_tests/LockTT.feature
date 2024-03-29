Feature: Lock TT interface

  Background:
    Given I am logged in as admin
    And I am on lock_tt page
    And lock_tt_page is visible

  @smoke
  Scenario: Change sorting by Group
    When I click sort_by_group_button
    And I wait 1 seconds for animation stops
    Then sort_text should contain Groups / Users

  @smoke
  Scenario: Change sorting by TZ
    When I click sort_by_time_zone_button
    And I wait 1 seconds for animation stops
    Then sort_text should contain Time Zones / Users

  @smoke
  Scenario: Change sorting by User
    When I click sort_by_user_button
    And I wait 1 seconds for animation stops
    Then sort_text should contain Users / Tasks

  @smoke
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

  @smoke
  Scenario: Change task
    Given I create necessary time-track and return to the lock tt
    And I click expand_all_button
    And first_row_details should contain Backup controlling
    And I click first_row_details
    And I click type_of_work_button
    And I click type_programming
    And I wait 1 seconds for animation stops
    And type_of_work_button should have title with Billable: programming
    And I click type_of_work_button
    And I click type_non_billable
    And I wait 1 seconds for animation stops
    And type_of_work_button should have title with Non-Billable
    And I click collapse_all_button
    And I wait 1 seconds for animation stops
    Then I should not see a web element first_row_details

  @smoke
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

  @smoke
  Scenario: Lock/Unlock one day for all users
    When I click date_cell
    And I click lock_selected
    And I should see a web element user_date_cell_locked
    And I wait 2 seconds for animation stops
    And I click date_cell
    And I click unlock_selected
    And I wait 2 seconds for animation stops
    Then I should not see a web element user_date_cell_locked

  @smoke
  Scenario: Lock/Unlock one day for one user
    When I click user_date_cell
    And I wait 2 seconds for animation stops
    And I should see a web element user_date_cell_locked
    And I wait 2 seconds for animation stops
    And I click user_date_cell
    And I wait 2 seconds for animation stops
    Then I should not see a web element user_date_cell_locked