Feature: Approve TT interface by admin

  Background:
    Given I am logged in as admin
    Given approve_tt_page is visible
    Given I click approve_tt_tab

  @Smoke
  Scenario: Approve TT and Revoke
    When I perform select in the user_checkbox
    And I click approve_tt_button
    And I wait 5 seconds for animation stops
    And tt_status should contain Approved
    And I wait 5 seconds for animation stops
    Then I click revoke_att

  @Smoke
  Scenario: Reject TT and Revoke
    When I perform select in the user_checkbox
    And I click reject_tt_button
    And I enter test in the reject_tt_comment
    And I click reject_tt_pop_button
    Then I click revoke_att

  @Smoke
  Scenario: Status filter
    When I click status_selector_button
    And I perform deselect in the ready_for_approval_cbx
    Then I click status_selector_apply_button

  @Smoke
  Scenario: User filter
    When I click user_selector_button
    And I click selected_users_filter
    And I perform select in the user_checkbox_in_selector
    Then I click apply_user_filter_button

  @Smoke
  Scenario: Month filter
    When I click month_selector_button
    And I click select_month_button
    Then I click month_selector_reset

  @Smoke
  Scenario: Sorting by Users and by Weeks
    When I click sort_by_users
    And I click sort_by_users
    And I click sort_by_weeks
    And I click sort_by_weeks

  @Smoke
  Scenario: User TT status history
    When I click history_button
    And I click show_more_history_button
    And I click show_more_history_button