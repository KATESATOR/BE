Feature: Approve TT interface by admin

  Background:
    Given I am logged in as admin
    And I am on approve_tt page
    And approve_tt_page is visible

  @Smoke
  Scenario: Approve TT and Revoke
    When I perform select in the user_checkbox
    And I click approve_tt_button
    And I wait 1 seconds for animation stops
    And tt_status should contain Approved
    And I click revoke_approved
    And I wait 1 seconds for animation stops
    Then tt_status should contain Not Ready

  @Smoke
  Scenario: Reject TT and Revoke
    When I perform select in the user_checkbox
    And I click reject_tt_button
    And I enter test in the reject_tt_comment
    And I click reject_tt_pop_button
    And I wait 1 seconds for animation stops
    And tt_status should contain Rejected
    And I click revoke_rejected
    And I wait 1 seconds for animation stops
    Then tt_status should contain Not Ready

  @Smoke
  Scenario: Status filter
    When I click status_selector_button
    And I perform deselect in the ready_for_approval_cbx
    And I perform deselect in the rejected_cbx
    And I click status_selector_apply_button
    And I wait 1 seconds for animation stops
    Then tt_status should contain Not Ready

  @Smoke
  Scenario: User filter
    When I click user_selector_button
    And I click selected_users_filter
    And I perform select in the moss_checkbox_in_selector
    And I click apply_user_filter_button
    And I wait 1 seconds for animation stops
    And I should see a web element moss_att_record
    Then I should not see a web element venson_att_record

  @Smoke
  Scenario: Month filter
    When I click month_selector_button
    And I click select_month_button
    And I wait 1 seconds for animation stops
    Then I should see a web element month_selector_reset

  @Smoke
  Scenario: Sorting by Users and by Weeks
    When I click sort_by_users
    And I should see a web element one_user_group
    And I click sort_by_weeks
    And I wait 1 seconds for animation stops
    Then I should not see a web element one_user_group

  @Smoke
  Scenario: User TT status history
    When I click history_button
    And I click show_more_history_button
    And I wait 1 seconds for animation stops
    Then show_more_history_button should contain + Show 10 more records (20 are shown)