Feature: Approve TT interface by admin

  Background:
    Given I am logged in as admin
    And I am on approve_tt page
    And approve_tt_page is visible

  @Smoke
  Scenario: Status filter
    When I wait 1 seconds for animation stops
    And I click status_selector
    And I perform deselect in the not_ready_for_approval_cbx
    And I perform deselect in the rejected_cbx
    And I click status_selector_apply_button
    And I wait 1 seconds for animation stops
    And status_selector should contain Ready for Approval
    And first_row_tt_status should contain Ready for Approval
    And I click status_selector
    And I perform deselect in the ready_for_approval_cbx
    And I perform select in the not_ready_for_approval_cbx
    And I click status_selector_apply_button
    And I wait 1 seconds for animation stops
    And status_selector should contain Not Ready
    And first_row_tt_status should contain Not Ready
    And I click status_selector
    And I perform deselect in the not_ready_for_approval_cbx
    And I perform select in the rejected_cbx
    And I click status_selector_apply_button
    And I wait 1 seconds for animation stops
    And status_selector should contain Rejected
    And first_row_tt_status should contain Rejected
    And I click status_selector
    And I perform deselect in the rejected_cbx
    And I click status_selector_apply_button
    And I wait 1 seconds for animation stops
    Then status_selector should contain Ready for Approval, Not Ready, Rejected

  @Smoke
  Scenario: Month filter
    When I click month_selector_button
    And I click mar_month_button
    And I wait 1 seconds for animation stops
    And month_selector_button should contain Mar, 2019
    And I should see a web element month_selector_reset
    And I click month_selector_reset
    And I wait 1 seconds for animation stops
    Then month_selector_button should contain Select month

  @Smoke
  Scenario: Sorting
    When I click sort_by_weeks
    And I wait 1 seconds for animation stops
    And I should see a web element first_row_week
    And first_row_week should contain Apr 08 - Apr 14, 2019
    And I click sort_by_weeks
    And I wait 1 seconds for animation stops
    And I should see a web element first_row_week
    And first_row_week should contain Feb 25 - Mar 03, 2019
    And I click sort_by_users
    And I wait 1 seconds for animation stops
    And I should see a web element first_row_username
    And first_row_username should contain Gibson, Maurice
    And I click sort_by_users
    And I wait 1 seconds for animation stops
    And I should see a web element first_row_username
    And first_row_username should contain Venson, Ronald
    And I click first_row_collapse
    And I wait 1 seconds for animation stops
    And I should not see a web element first_row_tt_status
    And I click first_row_collapse
    And I wait 1 seconds for animation stops
    And I should see a web element first_row_tt_status
    And I click collapse_all_button
    And I wait 1 seconds for animation stops
    And I should not see a web element first_row_tt_status
    And I click expand_all_button
    And I wait 1 seconds for animation stops
    Then I should see a web element first_row_tt_status

  @Smoke
  Scenario: User filter and search
    When I click user_selector
    And I click selected_users_filter
    And I perform select in the moss_checkbox_in_selector
    And I click apply_user_filter_button
    And I wait 2 seconds for animation stops
    And first_row_username should contain Moss, Bruno
    And user_selector should contain Moss, Bruno
    And I should not see a web element venson_att_record
    And I click user_selector
    And I click selected_users_filter
    And I perform select in the development_in_selector
    And I click apply_user_filter_button
    And I wait 1 seconds for animation stops
    And user_selector should contain 3 users
    And I click user_selector
    And I click all_users_filter
    And I click apply_user_filter_button
    And I wait 1 seconds for animation stops
    And user_selector should contain All users
    And I enter Moss in the user_search_field
    And I wait 1 seconds for animation stops
    And first_row_search_result should contain Moss
    And I click clear_search_button
    And I wait 1 seconds for animation stops
    And first_row_username should contain Venson, Ronald
    And I enter 123 in the user_search_field
    And I wait 1 seconds for animation stops
    And I should see a web element empty_data_row
    And I click clear_search_button
    And I wait 1 seconds for animation stops
    Then first_row_username should contain Venson, Ronald

  @Smoke
  Scenario: Reject TT and Revoke
    When I perform select in the user_checkbox
    And I wait 1 seconds for animation stops
    And reject_tt_button should have class with actionButton reject disabled
    And I click sort_by_users
    And I wait 1 seconds for animation stops
    And I perform select in the user_checkbox
    And I click reject_tt_button
    And I click reject_tt_pop_button
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Rejected
    And I click revoke_rejected
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Not Ready
    And I perform select in the first_row_common_chkbx
    And I click reject_tt_button
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Rejected
    And last_row_tt_status should contain Rejected
    And I click first_row_common_revoke
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Not Ready
    And last_row_tt_status should contain Not Ready
    And I click select_all_button
    And I wait 1 seconds for animation stops
    And approve_tt_button should have class with actionButton approve
    And reject_tt_button should have class with actionButton reject
    And I click deselect_all_button
    And I wait 1 seconds for animation stops
    And approve_tt_button should have class with actionButton approve disabled
    And reject_tt_button should have class with actionButton reject disabled
    And I click select_all_button
    And I wait 1 seconds for animation stops
    And I click reject_tt_button
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Rejected
    And last_row_tt_status should contain Rejected
    And I click first_row_common_revoke
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Not Ready
    Then last_row_tt_status should contain Not Ready

  @Smoke
  Scenario: Approve TT and Revoke
    When I perform select in the user_checkbox
    And I click approve_tt_button
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Approved
    And I click revoke_approved
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Not Ready
    And I perform select in the first_row_common_chkbx
    And I click approve_tt_button
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Approved
    And last_row_tt_status should contain Approved
    And I click first_row_common_revoke
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Not Ready
    And last_row_tt_status should contain Not Ready
    And I click select_all_button
    And I wait 1 seconds for animation stops
    And approve_tt_button should have class with actionButton approve
    And reject_tt_button should have class with actionButton reject
    And I click deselect_all_button
    And I wait 1 seconds for animation stops
    And approve_tt_button should have class with actionButton approve disabled
    And reject_tt_button should have class with actionButton reject disabled
    And I click select_all_button
    And I click approve_tt_button
    And I accept alert menu
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Approved
    And last_row_tt_status should contain Approved
    And I click first_row_common_revoke
    And I wait 1 seconds for animation stops
    And first_row_tt_status should contain Not Ready
    Then last_row_tt_status should contain Not Ready

  @Smoke
  Scenario: User TT status history
    When I click history_button
    And I click show_more_history_button
    And I wait 1 seconds for animation stops
    And last_row_history_date should contain Feb 17, 00:00
    And last_row_history_comment should contain Your undertime is more than 3 hours.
    Then show_more_history_button should contain + Show 10 more records (20 are shown)