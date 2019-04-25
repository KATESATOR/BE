Feature: Users interface by admin


  Background:
    Given I am logged in actiPLANS as admin
    And users_page is visible
    And I click users

  @smoke
  Scenario: Create User
    When I click add_users
    And I wait 2 seconds for animation stops
    And I click new_user_profile
    And I wait 2 seconds for animation stops
    And I enter A in the first_name
    And I enter A1 in the last_name
    And I enter test@test in the email
    And I click save_send_invitation
    And I wait 2 seconds for animation stops
    And I click close_add_user_panel
    And I wait 2 seconds for animation stops
    And I should see a text A1 on the page
    And I refresh the page
    And I wait 2 seconds for animation stops
    And I click edit_user_panel
    And I wait 2 seconds for animation stops
    And I click delete_user
    And I accept alert menu
    And I wait 1 seconds for animation stops
    Then I should not see a text Name, Last on the page

  @smoke
  Scenario: Create several users
    When I click add_users
    And I wait 1 seconds for animation stops
    And I click invite_several_users
    And I wait 2 seconds for animation stops
    And I enter AA1 in the first_name_several
    And I enter AA in the last_name_several
    And I enter Name@name in the email_several
    And I enter AA2 in the first_name_several_2
    And I enter AA in the last_name_several_2
    And I enter Name@name in the email_several_2
    And I click save_send_invitation_several
    And I click close_invite_several_users_panel
    And I wait 1 seconds for animation stops
    And I should see a text AA1 on the page
    Then I should see a text AA2 on the page

  @smoke
  Scenario: Switching page
    When I click pager_next
    And I wait 1 seconds for animation stops
    And I should see a text O'Dowd, Roy on the page
    And I click pager_back
    And I wait 1 seconds for animation stops
    And I should see a text Barber, Robert on the page
    And I choose 25 in shown_by
    And I wait 1 seconds for animation stops
    And I should not see a web element pager_next
    Then I should see a text Wooster, Jennifer on the page

  @smoke
  Scenario: Edit User
    When I click edit_user_panel
    And I wait 2 seconds for animation stops
    And I enter AA11 in the first_name
    And I enter A in the last_name
    And I enter Name@namename in the email
    And I click edit_user_panel_save_changes
    And I wait 2 seconds for animation stops
    And I should see a text AA11 on the page
    Then I should see a text A on the page

  @smoke
  Scenario: Delete user
    When I click edit_user_panel
    And I wait 2 seconds for animation stops
    And I click delete_user
    And I accept alert menu
    And  I click edit_user_panel
    And I wait 2 seconds for animation stops
    And I click delete_user
    And I accept alert menu
    And I refresh the page
    And I should not see a text AA11 on the page
    Then I should not see a text AA2 on the page

  @smoke
  Scenario: Edit User in table
    When I wait 1 seconds for animation stops
    And I click edit_user_permission_leave_balance
    And I wait 1 seconds for animation stops
    And I click edit_user_permission_system
    And I wait 1 seconds for animation stops
    And I click edit_user_permission_requests
    And I should see a web element leave_balance_check
    And I wait 1 seconds for animation stops
    And I should see a web element system_check
    And I wait 2 seconds for animation stops
    And I should see a web element requests_check
    And I click edit_user_permission_leave_balance
    And I click edit_user_permission_system
    And I click edit_user_permission_requests
    And I wait 1 seconds for animation stops
    And I should not see a web element leave_balance_check
    And I wait 1 seconds for animation stops
    And I should not see a web element system_check
    And I wait 1 seconds for animation stops
    Then I should not see a web element requests_check

  @smoke
  Scenario: Changing user filter
    When I click filter
    And I click filter_show_selected
    And I perform select in the filter_show_selected_wo_departments
    And I click filter_apply
    And filter should contain w/o department
    And I wait 1 seconds for animation stops
    And I click filter
    And I click filter_all_users
    And I click filter_apply
    And I wait 1 seconds for animation stops
    Then filter should contain All Users

  @smoke
  Scenario: Sorting user data
    When I perform deselect in the show_disabled_accounts
    And I click disable_last_user
    And I wait 1 seconds for animation stops
    And I should see a web element disabled_user
    And I refresh the page
    And I should not see a text Wooster, Jennifer on the page
    And I perform select in the show_disabled_accounts
    And I wait 1 seconds for animation stops
    And I refresh the page
    And I should see a text Wooster, Jennifer on the page
    And I should see a web element disabled_user
    And I perform select in the show_managers_only
    And I wait 1 seconds for animation stops
    And I should not see a web element disabled_leave_balance
    And I perform deselect in the show_managers_only
    And I wait 1 seconds for animation stops
    And I should see a web element disabled_leave_balance
    And I click sort_by_user
    And I wait 1 seconds for animation stops
    And first_row_username should contain Wooster, Jennifer
    And I click sort_by_group
    And I wait 1 seconds for animation stops
    And first_row_username should contain Enter TT, Role
    And I click sort_by_group
    And I wait 1 seconds for animation stops
    And first_row_username should contain Moss, Bruno
    And I click sort_by_time_zone
    And I wait 1 seconds for animation stops
    And first_row_username should contain Barber, Robert
    And I click sort_by_time_zone
    And I wait 1 seconds for animation stops
    And first_row_username should contain Kloss, Barbara
    And I click sort_by_working_week
    And I wait 1 seconds for animation stops
    And first_row_username should contain Enter TT, Role
    And I click sort_by_working_week
    And I wait 1 seconds for animation stops
    And first_row_username should contain Cruz, Gordman
    And I click sort_by_account
    And I wait 1 seconds for animation stops
    And first_row_username should contain Wooster, Jennifer
    And I click sort_by_account
    And I wait 1 seconds for animation stops
    And first_row_username should contain Barber, Robert
    And I click sort_by_user
    And I wait 1 seconds for animation stops
    And first_row_username should contain Barber, Robert
    And I click enable_last_user
    And I wait 1 seconds for animation stops
    Then I should not see a web element disabled_user

  @smoke
  Scenario: Create, delete departments
    When I click departments
    And I enter Active_department in the new_department
    And I click new_department_add
    And I wait 1 seconds for animation stops
    And I should see a text Active_department on the page
    And I click delete_department
    And I wait 1 seconds for animation stops
    And I click confirm_delete
    And I wait 1 seconds for animation stops
    Then I should not see a text Active_department on the page

  @smoke
  Scenario: Create, delete TZG
    When I click tzg
    And I wait 1 seconds for animation stops
    And I click tzg_field
    And I enter Atlanta in the tzg_search_field
    And I wait 1 seconds for animation stops
    And I click tzg_first_city_in_selector
    And I wait 1 seconds for animation stops
    And I click add_tzg
    And I wait 1 seconds for animation stops
    And I should see a text Atlanta on the page
    And I click tzg_delete
    And I wait 1 seconds for animation stops
    And I click confirm_delete_tzg
    And I wait 1 seconds for animation stops
    Then I should not see a web element city_check

  @smoke
  Scenario: PTO&Sick days edit
    When I click pto_settings
    And I wait 2 seconds for animation stops
    And I click pto_change_balance
    And I wait 1 seconds for animation stops
    And I enter 79 in the pto_balance_field
    And I wait 1 seconds for animation stops
    And I click pto_balance_apply
    And I wait 1 seconds for animation stops
    And I should see a text 79 on the page
    And I click pto_change_balance
    And I enter -1.3 in the pto_balance_field
    And I click pto_balance_apply
    And I click pto_accrue_rules
    And I wait 1 seconds for animation stops
    And I enter 811 in the pto_max_limit
    And I click pto_save_changes
    And I wait 1 seconds for animation stops
    And I should see a text 811 on the page
    And I click pto_accrue_rules
    And I wait 1 seconds for animation stops
    And I enter 15 in the pto_max limit
    And I click pto_save_changes
    And I wait 1 seconds for animation stops
    Then I should not see a web element pto_limit_check