Feature: Lock TT interface

  Background:
    Given I am logged in as admin
    And lock_tt_page is visible
    And I click lock_tt_button

  @smoke
  Scenario: Change sorting by Group/TZ/User
    When I click sort_by_group_button
    Then I should see a text Administration on the page
    And I click sort_by_time_zone_button
    Then I should see a text New York Office on the page
    And I click sort_by_user_button

  @smoke
  Scenario: Change user filter
    When I click date_selector_button
    And I click current_week_button
    Then date_selector_button should contain Current week
    And I click user_selector_button
    And I click selected_users_radiobutton
    And I click user_barber_robert
    And I click close_user_selector_button
    Then user_selector_text should contain Barber, Robert
    Then result_text should contain 1
    And I click clear_filter_button

  @smoke
  Scenario: Change task
    When I click expand_all_button
    Then I should see a web element task_backup_controlling
    And I click task_backup_controlling
    And I click type_of_work_button
    And I click type_programming
    Then type_of_work_button should have title with Billable: programming
    And I click type_of_work_button
    And I click type_non_billable
    Then type_of_work_button should have title with Non-Billable
    And I click collapse_all_button
    Then I should not see a web element task_backup_controlling

#  @smoke
#  Scenario: Lock/Unlock one day
#    And I wait 5 seconds for animation stops
#    When I move cursor to
#    Then I wait 5 seconds for animation stops
##    When I click date_cell
##    And I click lock_selected
##    And I click user_date_cell
##    And I wait 2 seconds for animation stops
##    And I click date_cell
##    And I click unlock_selected