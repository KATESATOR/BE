Feature: User List interface by admin

  Background:
    Given I am logged in as admin
    And I am on user_list page
    And user_list_page is visible

  @Smoke
  Scenario: Creating and deleting new user
    When I click new_user_button
    And I enter TestName in the first_name_field
    And I enter TestLastName in the last_name_field
    And I enter test@test in the email_field
    And I wait 1 seconds for animation stops
    And I click save_send_invitation_button
    And I wait 2 seconds for animation stops
    And I should see a text Account for TestName TestLastName has been created. on the page
    And I should see a text The invitation has been sent to the user's email address: test@test on the page
    And I click close_add_user_panel
    And I should see a web element new_test_user
    And I click new_test_user
    And I click delete_user_button
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a web element new_test_user

  @Smoke
  Scenario: User filter in user list
    When I click sorting_by_group
    And I wait 1 seconds for animation stops
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    And I click user_filter_button
    And I wait 1 seconds for animation stops
    And I click selected_users_in_selector
    And I wait 1 seconds for animation stops
    And I perform select in the cruz_in_selector
    And I click apply_button_user_filter
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Cruz, Gordman
    And I click user_filter_button
    And I click all_users_in_selector
    And I click apply_button_user_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Barber, Robert

  @Smoke
  Scenario: Edit user
    When I click user_cruz_gordman
    And I fill 123 in the edit_first_name_field
    And I wait 1 seconds for animation stops
    And I fill 123 in the edit_last_name_field
    And I wait 1 seconds for animation stops
    And I click close_panel_button
    And I wait 2 seconds for animation stops
    Then I should see a web element edited_cruz_gordman

  @Smoke
  Scenario: Creating and deleting new time zone group
    When I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I enter Washington in the time_zone_search_field
    And I click first_city_in_selector
    And I wait 1 seconds for animation stops
    And I click add_time_zone_button
    And I should see a web element Washington_time_zone_group
    And I click delete_Washington_button
    And I click confirm_delete_group_button
    And I wait 1 seconds for animation stops
    Then I should not see a web element Washington_time_zone_group

  @Smoke
  Scenario: Editing time zone group name
    When I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I click London_time_zone_group
    And I enter LONDON TEST in the London_time_zone_name_field
    And I click accept_edit_London_tzg_button
    And I wait 2 seconds for animation stops
    Then London_time_zone_group should have title with LONDON TEST

  @Smoke
  Scenario: Editing time zone group users
    When I click manage_groups_selector
    And I click time_zone_groups_in_selector
    And I click Sydney_office_group
    And I wait 1 seconds for animation stops
    And I click select_all_button_tzg
    And I click move_to_button
    And I click default_tzg_in_selector
    And I wait 2 seconds for animation stops
    Then I should see a text There are no users in the "Sydney Office" time zone group on the page
    And I click first_tzg_in_group_list
    And I click select_all_button_tzg
    And I click move_to_button
    And I click sydney_tzg_in_selector

  @Smoke
  Scenario: Creating and deleting new department
    When I click manage_groups_selector
    And I click departments_in_selector
    And I enter Test Dept in the new_dept_textfield
    And I wait 2 seconds for animation stops
    And I click add_new_dept_button
    And I should see a web element test_dept
    And I click delete_test_dept_button
    And I click confirm_delete_group_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element test_dept

  @Smoke
  Scenario: Editing users in department
    When I click manage_groups_selector
    And I click departments_in_selector
    And I click administration_dept
    And I wait 1 seconds for animation stops
    And I click select_all_button_depts
    And I click move_to_button
    And I click first_in_depts_move_to_selector
    And I wait 2 seconds for animation stops
    Then I should see a text "Administration" department contains only users with disabled access on the page
    And I click users_wo_dept
    And I click select_all_button_depts
    And I click move_to_button
    And I click first_in_depts_move_to_selector

  @Smoke
  Scenario: Bulk invitations
    When I click bulk_invitations_button
    And I enter user1 in the bulk_first_name_field1
    And I enter user1 in the bulk_last_name_field1
    And I enter 1@1 in the bulk_email_field1
    And I enter user2 in the bulk_first_name_field2
    And I enter user2 in the bulk_last_name_field2
    And I enter 2@2 in the bulk_email_field2
    And I click send_invitations_button
    And I wait 2 seconds for animation stops
    Then I should see a text Invitations have been sent to the following users: on the page
    And I should see a text user1 user1 (1@1) on the page
    And I should see a text user2 user2 (2@2) on the page
    And I click close_bulk_button
    And I should see a web element user1
    And I should see a web element user2

  @Smoke
  Scenario: Editing access to users
    When I click stivers_melanie
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I click access_to_users
    And I click access_to_all_users
    And I click access_to_users_back_button
    And I wait 1 seconds for animation stops
    Then access_to_users should contain All users
    And I click access_to_users
    And I click custom_access_to_users

  @Smoke
  Scenario: Editing access to scope of work
    When I click stivers_melanie
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I click access_to_scope
    And I wait 1 seconds for animation stops
    And I click no_access_to_scope
    And I wait 1 seconds for animation stops
    And I click access_to_scope_back_button
    And I wait 1 seconds for animation stops
    Then access_to_scope_label should contain No Access
    And I click access_to_scope_label
    And I click custom_access_to_scope

  @Smoke
  Scenario: Searching users
    When I click search_button
    And I enter Kloss in the search_field
    And I wait 1 seconds for animation stops
    Then first_search_result should contain Kloss

  @Smoke
  Scenario: Sorting by users
    When I click sorting_by_group
    And I wait 1 seconds for animation stops
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Wooster, Jennifer

  @Smoke
  Scenario: Sorting by groups
    When I click sorting_by_group
    And I wait 1 seconds for animation stops
    And I click sorting_by_group
    And I wait 1 seconds for animation stops
    Then first_group_in_list should contain Development

  @Smoke
  Scenario: Sorting by time zones
    When I click sorting_by_tzg
    And I wait 1 seconds for animation stops
    Then first_tzg_in_list should contain New York Office

  @Smoke
  Scenario: Switching page
    When I click sorting_by_users
    And I wait 2 seconds for animation stops
    And I click next_page
    And I wait 1 seconds for animation stops
    Then last_username_in_list should contain Wooster, Jennifer
    And I click previous_page
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Barber, Robert

  @Smoke
  Scenario: Management filter
    When I click management_filter
    And I click users_wo_permissions_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Venson, Ronald
    And I click management_filter
    And I click all_staff_filter
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Barber, Robert

  @Smoke
  Scenario: Editing work assignments
    When I click work_assignments_tab
    And I click search_in_wa
    And I enter Ronald in the search_wa_field
    And I wait 1 seconds for animation stops
    And first_row_in_wa_tab_projects_counter should contain 3
    And I click first_row_in_wa_tab_projects_counter
    And I click edit_assignments_button
    And I click our_company_in_wa_panel
    And I wait 1 seconds for animation stops
    And I click first_project_in_wa_panel
    And I click close_edit_wa_button
    And I wait 1 seconds for animation stops
    Then first_row_in_wa_tab_projects_counter should contain 4
    And I click first_row_in_wa_tab_projects_counter
    And I click administration_proj_del

  @Smoke
  Scenario: PTO settings ON/OFF
    When I click pto_tab
    And I click kloss_pto_control_switcher
    And I wait 1 seconds for animation stops
    Then kloss_pto_balance_cell should contain OFF
    And I click kloss_pto_control_switcher

  @Smoke
  Scenario: PTO balance editing
    When I click pto_tab
    And I click kloss_pto_balance_cell
    And I wait 2 seconds for animation stops
    And I enter 10.1 in the balance_field
    And I click balance_edit_apply_button
    And I wait 1 seconds for animation stops
    Then kloss_pto_balance_cell should contain 10.1d
    And I click kloss_pto_balance_cell
    And I enter 4.1 in the balance_field
    And I click balance_edit_apply_button

  @Smoke
  Scenario: PTO rules editing
    When I click pto_tab
    And I click kloss_pto_rules_cell
    And I click custom_pto_switcher
    And I click reset_pto_checkbox
    And I enter 1 in the reset_pto_field
    And I enter 5 in the accrue_pto_field
    And I enter 66 in the limit_pto_field
    And I click save_pto_rules_button
    And I wait 1 seconds for animation stops
    Then kloss_pto_rules_reset should contain 1d  on Jan 01
    And kloss_pto_rules_accrue should contain 5d monthly
    And kloss_pto_rules_limit should contain 66d
    And I click kloss_pto_rules_cell
    And I click default_pto_switcher
    And I click save_pto_rules_button
    And I wait 1 seconds for animation stops
    And I should see a web element kloss_default_pto_rules

  @Smoke
  Scenario: Sorting by current PTO
    When I click pto_tab
    And I click sorting_by_current_pto
    And I wait 1 seconds for animation stops
    Then first_current_pto_cell should contain 0d
    And I click sorting_by_current_pto
    And I wait 1 seconds for animation stops
    And first_current_pto_cell should contain 5.7d

  @Smoke
  Scenario: Sorting by reported PTO
    When I click pto_tab
    And I click sorting_by_reported_pto
    And I wait 1 seconds for animation stops
    Then first_reported_pto_cell should contain 0d
    And I click sorting_by_reported_pto
    And I wait 1 seconds for animation stops
    And first_reported_pto_cell should contain 6.3d

  @Smoke
  Scenario: Sick days settings ON/OFF
    When I click sick_days_tab
    And I click sorting_by_users
    And I click kloss_sd_control_switcher
    And I wait 1 seconds for animation stops
    Then kloss_sd_balance_cell should contain OFF
    And I click kloss_sd_control_switcher

  @Smoke
  Scenario: Sick days balance editing
    When I click sick_days_tab
    And I click kloss_sd_balance_cell
    And I enter 10.1 in the balance_field
    And I click balance_edit_apply_button
    And I wait 1 seconds for animation stops
    Then kloss_sd_balance_cell should contain 10.1d
    And I click kloss_sd_balance_cell
    And I enter 2.5 in the balance_field
    And I click balance_edit_apply_button

  @Smoke
  Scenario: Sick days rules editing
    When I click sick_days_tab
    And I click kloss_sd_rules_cell
    And I click custom_sd_switcher
    And I enter 5 in the accrue_sd_field
    And I click save_sd_rules_button
    And I wait 1 seconds for animation stops
    Then kloss_sd_rules_accrue should contain 5d monthly
    And I click kloss_sd_rules_cell
    And I click default_sd_switcher
    And I click save_sd_rules_button
    And I wait 1 seconds for animation stops
    And I should see a web element kloss_default_sd_rules

  @Smoke
  Scenario: Sorting by current sick days
    When I click sick_days_tab
    And I click sorting_by_current_sd
    And I wait 1 seconds for animation stops
    Then first_current_sd_cell should contain -1d
    And I click sorting_by_current_sd
    And I wait 1 seconds for animation stops
    And first_current_sd_cell should contain 3d

  @Smoke
  Scenario: Sorting by reported sick days
    When I click sick_days_tab
    And I click sorting_by_reported_sd
    And I wait 1 seconds for animation stops
    Then first_reported_sd_cell should contain 0d
    And I click sorting_by_reported_sd
    And I wait 1 seconds for animation stops
    And first_reported_sd_cell should contain 0d