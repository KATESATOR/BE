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
    And I wait 2 seconds for animation stops
    Then I should not see a web element new_test_user

  @Smoke
  Scenario: Edit user permissions
    When I click user_cruz_gordman
    And I click permissions_tab
    And I click manage_accounts_edit_user
    And I wait 2 seconds for animation stops
    And manage_users_icon_selected should have class with icon manageUsers
    And team_scope_edit_user should have class with userPanelScopeCell all disabled highlighted
    And manage_scope_edit_user should have class with userPanelScopeCell all disabled highlighted
    And team_scope_selected should contain All users
    And manage_scope_selected should contain Entire scope
    And I click manage_accounts_edit_user
    And I wait 2 seconds for animation stops
    And manage_users_icon_selected should have class with icon manageUsers inactive
    And manage_accounts_edit_user should have class with userPanel_permissionRow inactive
    And team_scope_edit_user should have class with userPanelScopeCell selected highlighted
    And manage_scope_edit_user should have class with userPanelScopeCell selected highlighted
    And team_scope_selected should contain 3 users
    And manage_scope_selected should contain Part of scope
    And I click modify_tt_edit_user
    And I wait 2 seconds for animation stops
    And modify_tt_icon_selected should have class with icon modifyTT inactive
    And modify_tt_edit_user should have class with userPanel_permissionRow inactive
    And I click manage_scope_perm_edit_user
    And I wait 2 seconds for animation stops
    And manage_scope_icon_selected should have class with icon manageScope inactive
    And manage_scope_perm_edit_user should have class with userPanel_permissionRow inactive
    And I click manage_cost_edit_user
    And I wait 2 seconds for animation stops
    And manage_cost_icon_selected should have class with icon costReports inactive
    And manage_cost_edit_user should have class with userPanel_permissionRow inactive
    And team_scope_edit_user should have class with userPanelScopeCell notAllowed disabled highlighted
    And manage_scope_edit_user should have class with userPanelScopeCell notAllowed disabled highlighted
    And team_scope_selected should contain –
    And manage_scope_selected should contain –
    And I click enter_tt_edit_user
    And I wait 1 seconds for animation stops
    And enter_tt_edit_user should have class with userPanel_permissionRow inactive
    And I click lock_tt_edit_user
    And I wait 1 seconds for animation stops
    And lock_tt_edit_user should have class with userPanel_permissionRow inactive
    And I click manage_balances_edit_user
    And I wait 1 seconds for animation stops
    And manage_balances_edit_user should have class with userPanel_permissionRow active
    And I click manage_settings_edit_user
    And I wait 1 seconds for animation stops
    And manage_settings_edit_user should have class with userPanel_permissionRow active
    And I click permission_info
    And I wait 1 seconds for animation stops
    And I should see a web element permission_info_popup
    And I click permission_info_popup_close
    And I wait 1 seconds for animation stops
    Then I should not see a web element permission_info_popup

  @Smoke
  Scenario: Edit user account settings
    When I click user_cruz_gordman
    And I wait 1 seconds for animation stops
    And I send 123 without clear in the username_field_edit_user
    And I send 123 without clear in the email_field_edit_user
    And I click reset_password
    And I click confirm_reset_password
    And I wait 1 seconds for animation stops
    And I should see a text The password for Gordman Cruz has been reset. on the page
    And I click close_reset_password
    And I click access_at_switcher
    And I wait 1 seconds for animation stops
    And access_at_switcher should have class with components_switcher small animated off
    And I should see a web element gordman_inactive
    And I click access_at_switcher
    And I wait 1 seconds for animation stops
    And access_at_switcher should have class with components_switcher small animated on
    And I should not see a web element gordman_inactive
    And I click access_ap_switcher
    And I wait 1 seconds for animation stops
    And access_ap_switcher should have class with components_switcher small animated off
    And I should not see a web element gordman_ap_access_icon
    And I click access_ap_switcher
    And I wait 1 seconds for animation stops
    And access_ap_switcher should have class with components_switcher small animated on
    And I should see a web element gordman_ap_access_icon
    And I click dept_selector_edit_user
    And I click new_dept_in_selector
    And I enter Dept New in the new_dept_field_edit_user
    And I click create_dept_edit_user
    And I wait 1 seconds for animation stops
    And dept_selector_edit_user should contain Dept New
    And I click tzg_selector_edit_user
    And I click new_tzg_in_selector
    And I enter Moskva in the tzg_search_field_edit_user
    And I wait 1 seconds for animation stops
    And I click moskva_in_city_selector
    And I wait 1 seconds for animation stops
    And I click create_tzg_edit_user
    And I wait 1 seconds for animation stops
    And tzg_selector_edit_user should contain Moskva
    And gordman_time_zone should contain Moskva
    And I click hire_date_edit_user
    And I click hire_date_28_calendar
    And I wait 1 seconds for animation stops
    And I click confirm_hire_date
    And I wait 1 seconds for animation stops
    And hire_date_edit_user should contain Feb 28, 2019
    And I click release_date_edit_user
    And I click today_calendar
    And I wait 1 seconds for animation stops
    And I click delete_release_date_edit_user
    And I wait 1 seconds for animation stops
    And release_date_edit_user should contain Select date
    And I click tt_approval_switcher
    And I wait 1 seconds for animation stops
    And I click tt_approval_managers
    And I should see a web element approvers_pop_up
    And tt_approval_switcher should have class with components_switcher small animated on
    And I click tt_approval_switcher
    And I wait 1 seconds for animation stops
    And I should not see a web element tt_approval_managers
    And tt_approval_switcher should have class with components_switcher small animated off
    And I enter 1 in the work_schedule_first_cell
    And I wait 1 seconds for animation stops
    And total_cell_schedule_edit_user should contain 34:00
    And I click default_schedule_chkbx
    And I wait 1 seconds for animation stops
    And work_schedule_first_cell should have class with disabled
    And I click new_schedule
    And I wait 1 seconds for animation stops
    And I should see a web element current_schedule_edit_user
    And I click delete_schedule_edit_user
    And I click confirm_delete
    And I wait 1 seconds for animation stops
    And I should not see a web element current_schedule_edit_user
    And I click overtime_selector_edit_user
    And I click auto_hidden_overtime_selector
    And I wait 1 seconds for animation stops
    And overtime_selector_edit_user should contain automatically
#    Нужен шаг для скролла панели, чтобы элементы были видимы
#    And I click add_rate_edit_user
#    And I wait 1 seconds for animation stops
#    And I should see a web element second_rate_regular
#    And I click delete_second_row_rate
#    And I wait 1 seconds for animation stops
#    And I should not see a web element second_rate_regular
    And I send 123 without clear in the edit_first_name_field
    And I wait 1 seconds for animation stops
    And I send 123 without clear in the edit_last_name_field
    And I click close_panel_button
    And I wait 1 seconds for animation stops
    Then I should see a web element edited_cruz_gordman

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
    And I should see a text Invitations have been sent to the following users: on the page
    And I should see a text user1 user1 (1@1) on the page
    And I should see a text user2 user2 (2@2) on the page
    And I click close_bulk_button
    And I should see a web element user1
    Then I should see a web element user2

  @Smoke
  Scenario: Editing access to users
    When I click stivers_melanie
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I wait 1 seconds for animation stops
    And I click access_to_users
    And I click access_to_all_users
    And I click access_to_users_back_button
    And I wait 1 seconds for animation stops
    And access_to_users should contain All users
    And I click access_to_users
    And I click no_access_to_users
    And I click access_to_users_back_button
    And I wait 1 seconds for animation stops
    And access_to_users should contain No Access
    And I click access_to_users
    And I wait 1 seconds for animation stops
    And I click custom_access_to_users
    And I click access_to_users_back_button
    And I wait 1 seconds for animation stops
    Then access_to_users should contain - Not selected -

  @Smoke
  Scenario: Editing access to scope of work
    When I click stivers_melanie
    And I wait 1 seconds for animation stops
    And I click permissions_tab
    And I click access_to_scope
    And I wait 1 seconds for animation stops
    And I click no_access_to_scope
    And I click access_to_scope_back_button
    And I wait 2 seconds for animation stops
    And access_to_scope_label should contain No Access
    And I click access_to_scope_label
    And I wait 1 seconds for animation stops
    And I click entire_access_to_scope
    And I click access_to_scope_back_button
    And I wait 1 seconds for animation stops
    And access_to_scope_label should contain Entire scope
    And I click access_to_scope_label
    And I wait 1 seconds for animation stops
    And I click custom_access_to_scope
    And I click access_to_scope_back_button
    And I wait 1 seconds for animation stops
    Then I should see a web element tasks_counter_scope

  @Smoke
  Scenario: Searching users
    When I click search_button
    And I enter Kloss in the search_field
    And I wait 1 seconds for animation stops
    And first_search_result should contain Kloss
    And I click close_search_button
    And I wait 1 seconds for animation stops
    And I should see a web element stivers_melanie
    And I click search_button
    And I enter 888 in the search_field
    And I wait 1 seconds for animation stops
    Then I should see a text There are no users found on the page

  @Smoke
  Scenario: User filter in user list
    When I click user_filter_button
    And I click selected_users_in_selector
    And I click filter_user_selector
    And I enter Kloss in the search_user_selector
    And I click kloss_in_selector
    And I click apply_button_user_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Kloss, Barbara
    And I click user_filter_button
    And I click all_users_in_selector
    And I click apply_button_user_filter
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Barber, Robert

  @Smoke
  Scenario: Sorting by users
    When I click sorting_by_users
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Wooster, Jennifer
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Barber, Robert

  @Smoke
  Scenario: Sorting by groups
    When I click sorting_by_group
    And I wait 1 seconds for animation stops
    And first_group_in_list should contain -- not assigned --
    And I click sorting_by_group
    And I wait 1 seconds for animation stops
    Then first_group_in_list should contain Development

  @Smoke
  Scenario: Sorting by time zones
    When I click sorting_by_tzg
    And I wait 1 seconds for animation stops
    And first_tzg_in_list should contain New York Office
    And I click sorting_by_tzg
    And I wait 1 seconds for animation stops
    Then first_tzg_in_list should contain Sydney Office

  @Smoke
  Scenario: Switching page
    When I choose 10 in page_selector
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    And I click next_page
    And I wait 1 seconds for animation stops
    And I click next_page
    And I wait 1 seconds for animation stops
    And last_username_in_list should contain Wooster, Jennifer
    And I click previous_page
    And I wait 1 seconds for animation stops
    And I click previous_page
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Barber, Robert
    And I choose 50 in page_selector
    And I wait 1 seconds for animation stops
    Then last_username_in_list should contain Wooster, Jennifer

  @Smoke
  Scenario: Management filter
    When I click management_filter
    And I click users_wo_permissions_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Cruz123, Gordman123
    And I click management_filter
    And I click all_permissions_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Barber, Robert
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
    And I click first_row_in_wa_tab_projects_counter
    And I click edit_assignments_button
    And I click our_company_in_wa_panel
    And I wait 1 seconds for animation stops
    And I click first_project_in_wa_panel
    And I click close_edit_wa_button
    And I wait 1 seconds for animation stops
    And first_row_in_wa_tab_projects_counter should contain 4
    And I click first_row_in_wa_tab_projects_counter
    And I click administration_proj_del
    And I click close_wa_button
    And I wait 1 seconds for animation stops
    Then first_row_in_wa_tab_projects_counter should contain 3

  @Smoke
  Scenario: PTO balance editing
    When I click pto_tab
    And I click kloss_pto_balance_cell
    And I enter 4.1 in the balance_field
    And I click balance_edit_apply_button
    And I wait 1 seconds for animation stops
    Then kloss_pto_balance_cell should contain 4.1d

  @Smoke
  Scenario: PTO settings ON/OFF
    When I click pto_tab
    And I click kloss_pto_control_switcher
    And I wait 1 seconds for animation stops
    And kloss_pto_balance_cell should contain OFF
    And I click kloss_pto_control_switcher
    And I wait 1 seconds for animation stops
    Then kloss_pto_balance_cell should contain 4.1d

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
    And kloss_pto_rules_reset should contain 1d  on Jan 01
    And kloss_pto_rules_accrue should contain 5d monthly
    And kloss_pto_rules_limit should contain 66d
    And I click kloss_pto_rules_cell
    And I click default_pto_switcher
    And I click save_pto_rules_button
    And I wait 1 seconds for animation stops
    Then I should see a web element kloss_default_pto_rules

  @Smoke
  Scenario: Sorting by PTO
    When I click pto_tab
    And I click sorting_by_current_pto
    And I wait 1 seconds for animation stops
    And first_current_pto_cell should contain 0d
    And I click sorting_by_current_pto
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Barber, Robert
    And I click sorting_by_reported_pto
    And I wait 1 seconds for animation stops
    And first_reported_pto_cell should contain 0d
    And I click sorting_by_reported_pto
    And I wait 1 seconds for animation stops
    And first_reported_pto_cell should contain 0d
    And I click sorting_by_control_pto
    And I wait 1 seconds for animation stops
    And first_current_pto_cell should contain OFF
    And first_row_pto_control should have class with components_switcher small off
    And I click sorting_by_control_pto
    And I wait 1 seconds for animation stops
    Then first_row_pto_control should have class with components_switcher small on

  @Smoke
  Scenario: Sick days balance editing
    When I click sick_days_tab
    And I click kloss_sd_balance_cell
    And I enter 2.5 in the balance_field
    And I click balance_edit_apply_button
    And I wait 1 seconds for animation stops
    Then kloss_sd_balance_cell should contain 2.5d

  @Smoke
  Scenario: Sick days settings ON/OFF
    When I click sick_days_tab
    And I click kloss_sd_control_switcher
    And I wait 1 seconds for animation stops
    And kloss_sd_balance_cell should contain OFF
    And I click kloss_sd_control_switcher
    And I wait 1 seconds for animation stops
    Then kloss_sd_balance_cell should contain 2.5d

  @Smoke
  Scenario: Sick days rules editing
    When I click sick_days_tab
    And I click kloss_sd_rules_cell
    And I click custom_sd_switcher
    And I enter 5 in the accrue_sd_field
    And I click save_sd_rules_button
    And I wait 1 seconds for animation stops
    And kloss_sd_rules_accrue should contain 5d monthly
    And I click kloss_sd_rules_cell
    And I click default_sd_switcher
    And I click save_sd_rules_button
    And I wait 1 seconds for animation stops
    Then I should see a web element kloss_default_sd_rules

  @Smoke
  Scenario: Sorting by sick days
    When I click sick_days_tab
    And I click sorting_by_current_sd
    And I wait 1 seconds for animation stops
    And first_current_sd_cell should contain -0.9d
    And I click sorting_by_current_sd
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Moss, Bruno
    And I click sorting_by_reported_sd
    And I wait 1 seconds for animation stops
    And first_reported_sd_cell should contain 0d
    And I click sorting_by_reported_sd
    And I wait 1 seconds for animation stops
    And first_reported_sd_cell should contain 0d
    And I click sorting_by_control_sd
    And I wait 1 seconds for animation stops
    And first_current_sd_cell should contain OFF
    And first_row_sd_control should have class with components_switcher small off
    And I click sorting_by_control_sd
    And I wait 1 seconds for animation stops
    Then first_row_sd_control should have class with components_switcher small on

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
    And I should see a text There are no users in the "Sydney Office" time zone group on the page
    And I click first_tzg_in_group_list
    And I click select_all_button_tzg
    And I click move_to_button
    Then I click sydney_tzg_in_selector

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
    And I should see a text "Administration" department contains only users with disabled access on the page
    And I click users_wo_dept
    And I click select_all_button_depts
    And I click move_to_button
    Then I click first_in_depts_move_to_selector