Feature: Approve TT interface by admin

  Background:
    Given I am logged in as admin

  @Smoke
  Scenario: Approve TT and Revoke
    Given approve_tt_page is visible
    When I click approve_tt_tab
    And I click collapse_all_button
    And I click expand_all_button
    And I click select_all_button
    And I click deselect_all_button
    And I perform select in the user_checkbox
    And I click approve_tt_button
    Then I click revoke_att

  @Smoke
  Scenario: Reject TT and Revoke
    Given approve_tt_page is visible
    When I click approve_tt_tab
    And I perform select in the user_checkbox
    And I click reject_tt_button
    And I enter test in the reject_tt_comment
    And I click reject_tt_pop_button
    Then I click revoke_att

  @Smoke
  Scenario: Status filter
    Given approve_tt_page is visible
    When I click approve_tt_tab
    And I click status_selector_button
    And I perform deselect in the ready_for_approval_cbx
    Then I click status_selector_apply_button

  @Smoke
  Scenario: User filter
    Given approve_tt_page is visible
    When I click approve_tt_tab
    And I click user_selector_button
    And I click selected_users_filter
    And I perform select in the user_checkbox_in_selector
    Then I click apply_user_filter_button

  @Smoke
  Scenario: Month filter
    Given approve_tt_page is visible
    When I click approve_tt_tab
    And I click month_selector_button
    And I click select_month_button
    Then I click month_selector_reset

  @Smoke
  Scenario: Sorting by Users and by Weeks
    Given approve_tt_page is visible
    When I click approve_tt_tab
    And I click sort_by_users
    And I click sort_by_users
    And I click sort_by_weeks
    And I click sort_by_weeks

  @Smoke
  Scenario: User TT status history
    Given approve_tt_page is visible
    When I click approve_tt_tab
    And I click history_button
    And I click show_more_history_button
    And I click show_more_history_button