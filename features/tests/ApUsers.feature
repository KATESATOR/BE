Feature: Users interface by admin


  Background:
    Given I am logged in aP as admin
    And users_page is visible
    And i click users
    And I wait 3 seconds for animation stops

  @smoke
  Scenario: Create User
    When i click add_users
    And I wait 3 seconds for animation stops
    And i click new_user_profile
    And I wait 3 seconds for animation stops
    And i enter A in the first_name
    And i enter A1 in the last_name
    And i enter test@test in the email
    And i click save_send_invitation
    And I wait 3 seconds for animation stops
    And I click close_add_user_panel
    And I wait 2 seconds for animation stops
    Then I should see a text A1 on the page
    And I refresh the page
    And I wait 2 seconds for animation stops
    And i click edit_user_panel
    And I wait 2 seconds for animation stops
    And i click delete_user
    And I accept alert menu
    And I wait 1 seconds for animation stops
    Then I should not see a text Name, Last on the page

  @smoke
  Scenario: Create several users
    When i click add_users
    And I wait 2 seconds for animation stops
    And i click invite_several_users
    And I wait 2 seconds for animation stops
    And i enter AA1 in the first_name_several
    And i enter AA in the last_name_several
    And i enter Name@name in the email_several
    And i enter AA2 in the first_name_several_2
    And i enter AA in the last_name_several_2
    And i enter Name@name in the email_several_2
    And i click save_send_invitation_several
    And i click close_invite_several_users_panel
    And i should see a text AA1 on the page
    Then I should see a text AA2 on the page

  @smoke
  Scenario: Edit User
    When i click edit_user_panel
    And I wait 2 seconds for animation stops
    And i enter AA11 in the first_name
    And i enter A in the last_name
    And i enter Name@namename in the email
    And i click edit_user_panel_save_changes
    And I wait 2 seconds for animation stops
    And i should see a text AA11 on the page
    Then I should see a text A on the page

  @smoke
  Scenario: Delete user
    When i click edit_user_panel
    And I wait 2 seconds for animation stops
    And i click delete_user
    And I accept alert menu
    And I wait 2 seconds for animation stops
    And  i click edit_user_panel
    And I wait 2 seconds for animation stops
    And i click delete_user
    And I wait 1 seconds for animation stops
    And I accept alert menu
    And I should see a text AA11 on the page
    Then I should see a text AA2 on the page

  @smoke
  Scenario: Edit User in table
    When I wait 1 seconds for animation stops
    And i click edit_user_permission_leave_balance
    And I wait 1 seconds for animation stops
    And i click edit_user_permission_system
    And I wait 1 seconds for animation stops
    And i click edit_user_permission_requests
    And I should see a web element leave_balance_check
    And I wait 1 seconds for animation stops
    And I should see a web element system_check
    And I wait 1 seconds for animation stops
    And I should see a web element requests_check
    And i click edit_user_permission_leave_balance
    And i click edit_user_permission_system
    And i click edit_user_permission_requests
    And I wait 1 seconds for animation stops
    And I should not see a web element leave_balance_check
    And I wait 1 seconds for animation stops
    And I should not see a web element system_check
    And I wait 1 seconds for animation stops
    Then I should not see a web element requests_check

  @smoke
  Scenario: Changing user filter
    When i click filter
    And i click filter_show_selected
    And i perform select in the filter_show_selected_wo_departments
    And i click filter_apply
    And I should see a text w/o department on the page
    And I wait 2 seconds for animation stops
    And i click filter
    And i click filter_all_users
    And i click filter_apply
    Then I should see a text All Users on the page

  @smoke
  Scenario: Sorting user data
    When i choose 10 in shown_by
    And I perform select in the show_disabled_accounts
    And I should not see a text Young, Frank on the page
    And I wait 2 seconds for animation stops
    And I perform select in the show_managers_only
    And I wait 2 seconds for animation stops
    And I should see a text Top Management on the page
    And I perform deselect in the show_managers_only
    And I wait 1 seconds for animation stops
    And i click sort_by_user
    And I wait 3 seconds for animation stops
    And I should see a web element womack_ashley_check
    And i click sort_by_group
    And I should see a text Young, Frank on the page
    And i click sort_by_group
    And I wait 2 seconds for animation stops
    And I should not see a web element womack_ashley_check
    And i click sort_by_working_week
    And I should see a text Young, Frank on the page
    And i click sort_by_working_week
    And I wait 1 seconds for animation stops
    And I should not see a text Young, Frank on the page
    And i click sort_by_account
    And I wait 1 seconds for animation stops
    And I should not see a text Ramirez, Maria on the page
    And i click sort_by_account
    And I wait 1 seconds for animation stops
    And i click sort_by_user
    And I wait 1 seconds for animation stops
    Then I perform deselect in the show_disabled_accounts

  @smoke
  Scenario: Create, delete departments
    When i click departments
    And I enter Active_department in the new_department
    And I wait 1 seconds for animation stops
    And i click new_department_add
    And I wait 2 seconds for animation stops
    And i click delete_department
    And I wait 3 seconds for animation stops
    And i click confirm_delete
    And I wait 1 seconds for animation stops
    Then I should not see a text Active_department on the page

  @smoke
  Scenario: Create, delete TZG
    When i click tzg
    And i click tzg_field
    And i enter Atlanta in the tzg_search_field
    And I wait 1 seconds for animation stops
    And i click tzg_first_city_in_selector
    And I wait 1 seconds for animation stops
    And i click add_tzg
    And I wait 1 seconds for animation stops
    And I should see a text Atlanta on the page
    And i click tzg_delete
    And I wait 1 seconds for animation stops
    And I click confirm_delete_tzg
    And I wait 1 seconds for animation stops
    Then I should not see a web element city_check

  @smoke
  Scenario: Switching page
    When I wait 2 seconds for animation stops
    And I choose 10 in shown_by
    And I wait 2 seconds for animation stops
    And i click pager_next
    And I wait 1 seconds for animation stops
    And I should see a text White, Jane on the page
    And i click pager_back
    And I wait 1 seconds for animation stops
    Then I should see a text Alvarez, Daniel on the page

  @smoke
  Scenario: PTO&Sick days edit
    When i click pto_settings
    And I wait 1 seconds for animation stops
    And i click pto_change_balance
    And I wait 1 seconds for animation stops
    And I enter 79 in the pto_balance_field
    And I wait 1 seconds for animation stops
    And I click pto_balance_apply
    And I wait 1 seconds for animation stops
    And I should see a text 79 on the page
    And i click pto_accrue_rules
    And I wait 1 seconds for animation stops
    And I enter 811 in the pto_max_limit
    And i click pto_save_changes
    And I wait 1 seconds for animation stops
    And I should see a text 811 on the page
    And i click pto_accrue_rules
    And I wait 1 seconds for animation stops
    And i enter 80 in the pto_max limit
    And i click pto_save_changes
    And I wait 1 seconds for animation stops
    Then I should not see a web element pto_limit_check