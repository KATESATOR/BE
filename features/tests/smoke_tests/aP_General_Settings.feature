Feature: aP General settings

  Background:
    When I am logged in actiPLANS as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings_button
    And ap_general_settings_page is visible

  @smoke
  Scenario: Check all settings blocks
    When I should see a web element user_groups_settings_block
    And I should see a web element tz_groups_settings_block
    And I should see a web element pto_and_sick_settings_block
    And I should see a web element work_schedule_settings_block
    And I should see a web element schedule_visibility_settings_block
    And I should see a web element ltm_access_settings_block
    Then I should see a web element format_settings_block

  @smoke
  Scenario: Select Department Group
    When I should see a web element user_group_naming_selector
    And I choose 15 in user_group_naming_selector
    And I click save_button_top
    And I wait 2 seconds for animation stops
    Then I should see a text Location on the page
    And I choose 13 in user_group_naming_selector
    And I click save_button_top

  @smoke
  Scenario: Change TZG
    When I should see a web element tz_group_selector_textfield
    And I enter Saint Petersburg in the tz_group_selector_textfield
    And I wait 2 seconds for animation stops
    And I click tz_group_search_first_cell
    And I enter Saint-Petersburg in the tz_group_name_field
    And I wait 2 seconds for animation stops
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And tz_group_name_field should have value with Saint-Petersburg
    And I enter New York in the tz_group_selector_textfield
    And I wait 2 seconds for animation stops
    And I click tz_group_search_first_cell
    And I enter New York in the tz_group_name_field
    And I wait 2 seconds for animation stops
    And I click save_button_top
    And I wait 2 seconds for animation stops
    Then tz_group_name_field should have value with New York

  @smoke
  Scenario: Select Calendar layout
    When I should see a web element tz_group_week_start_day_selector
    And I choose 1 in tz_group_week_start_day_selector
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And I choose 2 in tz_group_week_start_day_selector
    And I click save_button_top

  @smoke
  Scenario: Change Pto Settings
    When I click pto_show_in_hours_radiobutton
    And I click pto_round_balance_checkbox
    And I click pto_rule_reset_balance_checkbox
    And I enter 10 in the pto_rule_reset_balance_textfield
    And I enter 3.5 in the pto_rule_accrue_balance_textfield
    And I enter 100 in the pto_rule_cap_balance_textfield
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And pto_rule_reset_balance_textfield should have value with 10
    And pto_rule_accrue_balance_textfield should have value with 3.5
    And pto_rule_cap_balance_textfield should have value with 100
    And I wait 2 seconds for animation stops
    And I click pto_show_in_days_radiobutton
    And I click pto_round_balance_checkbox
    And I click pto_rule_reset_balance_checkbox
    And I click pto_rule_accrue_balance_checkbox
    And I click pto_rule_cap_balance_checkbox
    And I click pto_default_control_mode_checkbox
    And I click save_button_top

  @smoke
  Scenario: Change Sick Settings
    When I click sick_show_in_hours_radiobutton
    And I click sick_round_balance_checkbox
    And I enter 10 in the sick_rule_reset_balance_textfield
    And I enter 3.5 in the sick_rule_accrue_balance_textfield
    And I click sick_rule_cap_balance_checkbox
    And I enter 100 in the sick_rule_cap_balance_textfield
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And sick_rule_reset_balance_textfield should have value with 10
    And sick_rule_accrue_balance_textfield should have value with 3.5
    And sick_rule_cap_balance_textfield should have value with 100
    And I wait 2 seconds for animation stops
    And I click sick_show_in_days_radiobutton
    And I click sick_round_balance_checkbox
    And I click sick_rule_reset_balance_checkbox
    And I click sick_rule_accrue_balance_checkbox
    And I click sick_rule_cap_balance_checkbox
    And I click sick_default_control_mode_checkbox
    And I click save_button_top

  @smoke
  Scenario: Change work schedule
    When I enter 9 in the default_workday_duration_textfield
    And I click save_button_top
    Then default_workday_duration_textfield should have value with 9:00
    And I enter 8 in the default_workday_duration_textfield
    And I click save_button_top

  @smoke
  Scenario: Change Access options for LTM
    When I click ltm_show_auto_approved_checkbox
    And I click ltm_edit_auto_approved_checkbox
    And I click ltm_show_other_assigned_checkbox
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And ltm_show_auto_approved_checkbox should have checked with true
    And ltm_edit_auto_approved_checkbox should have checked with true
    And ltm_show_other_assigned_checkbox should have checked with true
    And I click ltm_edit_auto_approved_checkbox
    And I click ltm_show_auto_approved_checkbox
    And I click ltm_show_other_assigned_checkbox
    And I click save_button_top
    And I wait 2 seconds for animation stops

  @smoke
  Scenario: Change General settings
    When I click user_group_switcher
    And I click tz_group_switcher
    And I click pto_switcher
    And  I click sick_switcher
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And I should see a web element save_message_success_text
    And user_group_switcher_value should have value with false
    And tz_group_switcher_value should have value with false
    And pto_switcher_value should have value with false
    And sick_switcher_value should have value with false
    And I click user_group_switcher
    And I click tz_group_switcher
    And I click pto_switcher
    And I click sick_switcher
    And I click save_button_top
    And I wait 2 seconds for animation stops
    And I should see a web element save_message_success_text
    And user_group_switcher_value should have value with true
    And tz_group_switcher_value should have value with true
    And pto_switcher_value should have value with true
    Then sick_switcher_value should have value with true

  @smoke
  Scenario: Change Number Formats
    When I should see a web element decimal_separator_selector
    And I choose -custom_value- in decimal_separator_selector
    And I enter ' in the decimal_separator_textfield
    And I choose -custom_value- in digit_grouping_symbol_selector
    And I enter ; in the digit_grouping_symbol_textfield
    And I click save_button_top
    Then I wait 2 seconds for animation stops
    And pto_rule_accrue_balance_textfield should have value with 0'44
    And I choose . in decimal_separator_selector
    And I choose   in digit_grouping_symbol_selector
    And I click save_button_top
