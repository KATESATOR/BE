
Feature: Manage PTO & Sick Days Settings Role

 Background:
    Given I am logged in as managebalancesat

  @Smoke
  Scenario: PTO balance editing
    When user_list_page is visible
    And I click pto_tab
    And I click kloss_pto_balance_cell
    And I enter 10.1 in the balance_field
    And I click balance_edit_apply_button
    And I wait 1 seconds for animation stops
    And kloss_pto_balance_cell should contain 10.1d
    And I click kloss_pto_balance_cell
    And I enter 4.1 in the balance_field
    Then I click balance_edit_apply_button

  @Smoke
  Scenario: PTO rules editing
    When user_list_page is visible
    And I click pto_tab
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
  Scenario: Sorting by current PTO
    When user_list_page is visible
    And I click pto_tab
    And I click sorting_by_current_pto
    And I wait 1 seconds for animation stops
    And first_current_pto_cell should contain 0d
    And I click sorting_by_current_pto
    And I wait 1 seconds for animation stops
    Then first_current_pto_cell should contain 5.7d

  @Smoke
  Scenario: Sorting by reported PTO
    When user_list_page is visible
    And I click pto_tab
    And I click sorting_by_reported_pto
    And I wait 1 seconds for animation stops
    And first_reported_pto_cell should contain 0d
    And I click sorting_by_reported_pto
    And I wait 1 seconds for animation stops
    Then first_reported_pto_cell should contain 3d

  @Smoke
  Scenario: Sick days balance editing
    When user_list_page is visible
    And I click sick_days_tab
    And I click kloss_sd_balance_cell
    And I enter 10.1 in the balance_field
    And I click balance_edit_apply_button
    And I wait 1 seconds for animation stops
    And kloss_sd_balance_cell should contain 10.1d
    And I click kloss_sd_balance_cell
    And I enter 2.5 in the balance_field
    Then I click balance_edit_apply_button

  @Smoke
  Scenario: Sick days rules editing
    When user_list_page is visible
    And I click sick_days_tab
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
  Scenario: Sorting by current sick days
    When user_list_page is visible
    And I click sick_days_tab
    And I click sorting_by_current_sd
    And I wait 1 seconds for animation stops
    And first_current_sd_cell should contain -1d
    And I click sorting_by_current_sd
    And I wait 1 seconds for animation stops
    Then first_current_sd_cell should contain 3d

  @Smoke
  Scenario: Sorting by reported sick days
    When user_list_page is visible
    And I click sick_days_tab
    And I click sorting_by_reported_sd
    And I wait 1 seconds for animation stops
    And first_reported_sd_cell should contain 0d
    And I click sorting_by_reported_sd
    And I wait 1 seconds for animation stops
    Then first_reported_sd_cell should contain 0d

  @Smoke
  Scenario Outline: Export Reports in .csv files
   When I am on reports page
   And reports_page is visible
    Examples: <report_name>
      | report                    | report_name               | prev_report_url      |
      | time_balance_button       | Time Balance and Overtime | overtime.do          |
      | leave_time_balance_button | Leave Time and Balances   | leaves.do            |

    And I click new_report
    And I wait 2 seconds for animation stops
    And I should see a web element choose_report_window
    And I click <report>
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    And My current URL should contain /reports/<prev_report_url>
    And I click csv_preview_button
    And I click export_to_csv_button
    And I wait 2 seconds for animation stops
    Then I search report <report_name> with the extension csv in downloads folder

  @Smoke
  Scenario Outline: Create and Save Reports on dashboard
   When I am on reports page
   And reports_page is visible
    Examples: <report_name>
      | report                    | report_name                     | prev_report_url      | report_url                  |
      | time_balance_button       | Time Balance and Overtime Smoke | overtime.do          | overtimeresults.do          |
      | leave_time_balance_button | Leave Time and Balances Smoke   | leaves.do            | leavesresults.do            |

    When I click new_report
    And I wait 2 seconds for animation stops
    And I should see a web element choose_report_window
    And I click <report>
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    And My current URL should contain /reports/<prev_report_url>
    And I click generate_html_button
    And I wait 2 seconds for animation stops
    And My current URL should contain /reports/<report_url>
    And I click add_to_dashboard_button
    And I enter <report_name> in the report_name_text_field
    And I click save_report_name_button
    And I wait 2 seconds for animation stops
    Then report_name should contain <report_name>

  @Smoke
  Scenario Outline: Change report
   When I am on reports page
   And reports_page is visible
    Examples: <report_name>
      | report_name                     | report_name_changed                     | report_url                  |
      | Time Balance and Overtime Smoke | Time Balance and Overtime Smoke Changed | overtimeresults.do          |
      | Leave Time and Balances Smoke   | Leave Time and Balances Smoke Changed   | leavesresults.do            |

    When I open report on dashboard with name <report_name>
    And I wait 2 seconds for animation stops
    And My current URL should contain /reports/<report_url>
    And I click report_name
    And I enter <report_name_changed> in the report_name_text_field
    And I wait 1 seconds for animation stops
    And I click save_report_changes_button
    And I wait 1 seconds for animation stops
    And I click save_changes_button
    And I wait 1 seconds for animation stops
    And I click reports_dashboard
    And I wait 2 seconds for animation stops
    Then I should see a text <report_name_changed> on the page


  @Smoke
  Scenario Outline: Remove report from dashboard
   When I am on reports page
   And reports_page is visible
    Examples: <report_name>
      | report_name                             |
      | Time Balance and Overtime Smoke Changed |
      | Leave Time and Balances Smoke Changed   |

    When I remove <report_name> report from dashboard
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a text <report_name> on the page

  @Smoke
  Scenario Outline: Export charts in .pdf files
   When I am on reports page
   And reports_page is visible
    Examples: <chart_name>
      | chart_name             |
      | Leave hours            |
      | PTO Balance            |
      | Sick Days Balance      |

    When I click create_chart
    And I wait 2 seconds for animation stops
    And I click show_selector_button
    And I wait 2 seconds for animation stops
    And I select <chart_name> in chart selector
    And I wait 2 seconds for animation stops
    And I click export_chart_button
    And I wait 2 seconds for animation stops
    And I click download_chart
    And I wait 2 seconds for animation stops
    Then I search report <chart_name> with the extension pdf in downloads folder

  @Smoke
  Scenario Outline: Create and Save Charts on dashboard
   When I am on reports page
   And reports_page is visible
    Examples: <chart_name>
      | chart                  | chart_name                   |
      | Leave hours            | Leave hours Smoke            |
      | PTO Balance            | PTO Balance Smoke            |
      | Sick Days Balance      | Sick Days Balance Smoke      |
      | Overtime hours         | Overtime hours Smoke         |

    When I click create_chart
    And I wait 2 seconds for animation stops
    And I click show_selector_button
    And I wait 2 seconds for animation stops
    And I select <chart> in chart selector
    And I click add_to_dashboard_button
    And I enter <chart_name> in the report_name_text_field
    And I click save_report_name_button
    And I wait 2 seconds for animation stops
    And report_name should contain <chart_name>
    And I click close_chart_button
    And I wait 2 seconds for animation stops
    Then I should see a text <chart_name> on the page

  @Smoke
  Scenario Outline: Change charts
   When I am on reports page
   And reports_page is visible
    Examples: <chart_name>
      | chart_name                   | chart_name_changed                   |
      | Leave hours Smoke            | Leave hours Smoke Changed            |
      | PTO Balance Smoke            | PTO Balance Smoke Changed            |
      | Sick Days Balance Smoke      | Sick Days Balance Smoke Changed      |
      | Overtime hours Smoke         | Overtime hours Smoke Changed         |

    When I open report on dashboard with name <chart_name>
    And I wait 2 seconds for animation stops
    And I click report_name
    And I enter <chart_name_changed> in the report_name_text_field
    And I wait 1 seconds for animation stops
    And I click save_report_changes_button
    And I wait 1 seconds for animation stops
    And I click save_changes_button
    And I click close_chart_button
    And I wait 2 seconds for animation stops
    Then I should see a text <chart_name_changed> on the page

  @Smoke
  Scenario Outline: Remove chart from dashboard
   When I am on reports page
   And reports_page is visible
    Examples: <report_name>
      | chart_name                           |
      | Leave hours Smoke Changed            |
      | PTO Balance Smoke Changed            |
      | Sick Days Balance Smoke Changed      |
      | Overtime hours Smoke Changed         |


    When I remove <chart_name> report from dashboard
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a text <chart_name> on the page

  @Smoke
  Scenario: Only User List
    When I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click features
    And features_page is visible
    And I click features_pto_balance
    And I click features_sick_balance
    And I am logged in as managebalancesat
    And general_page is visible
    And I should not see a web element time_track
    And I should not see a web element tasks
    And I should not see a web element reports
    Then I should see a web element user_list

  @Smoke
  Scenario: No User List
    When I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings_button
    And general_settings_page is visible
    And I perform select in the gs_dar_hide_not_assigned_users
    And I wait 1 seconds for animation stops
    And I click gs_save
    And general_page is visible
    And I click settings_button
    And I click features
    And features_page is visible
    And I click features_pto_balance
    And I click features_sick_balance
    And I am logged in as managebalancesat
    And general_page is visible
    And I should not see a web element time_track
    And I should not see a web element tasks
    And I should not see a web element reports
    Then I should not see a web element user_list