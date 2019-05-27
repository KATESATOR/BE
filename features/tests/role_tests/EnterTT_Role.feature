Feature: Enter TT role

  Background:
    Given I am logged in as enter tt role
    And enter tt page is visible

  @role
  Scenario: Add Task
    When I enter Page updates in the search task
    And I click tasks found list
    And I wait 2 seconds for animation stops
    Then I should see a text Page updates on the page

  @role
  Scenario: Save time-track
    When I enter 2:00 in the tt field
    And I click save button
    And I wait 2 seconds for animation stops
    Then tt field should have value with 2:00

  @role
  Scenario: Save leave time
    When I click leave button
    And I click choose leave
    And I click ok leave
    And I click save button
    Then leave button should contain whole day

  @role
  Scenario: Save comment
    When I click tt comment
    And I enter comment in the comment field
    And I click ok comment
    Then comment length should contain 7

  @role
  Scenario: Change week status
    When I click change own status
    And I click save button
    Then I should see a text Your changes were successfully saved. on the page

  @role
  Scenario: Select another week
    When I click user calendar
    And I click user next month
    And I click user next week
    Then I should see a web element add only

  @role
  Scenario: Edit Task on Enter TT interface
    When I click edit task
    And I click task status
    And I click task status review
    And I wait 2 seconds for animation stops
    Then I should see a text Status of task 'Page updates' has been changed on the page

  @role
  Scenario: Edit Task on View TT interface
    When general_page is visible
    And I click my view tt
    And view tt page is visible
    And I wait 2 seconds for animation stops
    And I click ttdetails_show_tasks
    And I wait 2 seconds for animation stops
    And I click ttdetails_edit_task_in_day
    And I click task status
    And I click task status clarification
    And I wait 2 seconds for animation stops
    Then I should see a text Status of task 'Page updates' has been changed on the page

  @role
  Scenario: Edit Task through panel
    When I am on tasks page
    And tasks page is visible
    And I click default view
    And I enter Page design in the search tasks
    And I wait 1 seconds for animation stops
    And I click found test task
    And I wait 1 seconds for animation stops
    And I click task status
    And I click complete task
    And I wait 1 seconds for animation stops
    Then I should see a text Status of task 'Page design' has been changed on the page

  @role
  Scenario: Edit Task through panel when feature WA off
    When I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click features
    And features_page is visible
    And I click features_work_assignments
    And I wait 1 seconds for animation stops
    And I am logged in as enter tt role
    And I am on tasks page
    And tasks page is visible
    And I click default view
    And I enter Branding in the search tasks
    And I wait 1 seconds for animation stops
    And I click found test task
    And I wait 1 seconds for animation stops
    And I click task status
    And I click complete task
    And I wait 1 seconds for animation stops
    Then I should see a text Status of task 'Branding' has been changed on the page

  @role
  Scenario Outline: Export Reports in .csv files
    Examples: <report_name>
      | report                    | report_name               | prev_report_url      |
      | staff_performance_button  | Staff Performance         | staffperformance.do  |
      | time_balance_button       | Time Balance and Overtime | overtime.do          |
      | leave_time_balance_button | Leave Time                | leaves.do            |
      | time_track_detail_button  | Time Track In Detail      | commentsreport.do    |
      | estimated_button          | Estimated vs. Actual Time | estimatedvsactual.do |

    When I am on reports page
    And reports_page is visible
    And I click new_report_button
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

  @role
  Scenario Outline: Create and Save Reports on dashboard
    Examples: <report_name>
      | report                    | report_name                     | prev_report_url      | report_url                  |
      | staff_performance_button  | Staff Performance Smoke         | staffperformance.do  | staffperformanceresults.do  |
      | time_balance_button       | Time Balance and Overtime Smoke | overtime.do          | overtimeresults.do          |
      | leave_time_balance_button | Leave Time and Balances Smoke   | leaves.do            | leavesresults.do            |
      | time_track_detail_button  | Time Track In Detail Smoke      | commentsreport.do    | commentsreportresults.do    |
      | estimated_button          | Estimated vs. Actual Time Smoke | estimatedvsactual.do | estimatedvsactualresults.do |

    When I am on reports page
    And reports_page is visible
    And I click new_report_button
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

  @role
  Scenario Outline: Change report
    Examples: <report_name>
      | report_name                     | report_name_changed                     | report_url                  |
      | Staff Performance Smoke         | Staff Performance Smoke Changed         | staffperformanceresults.do  |
      | Time Balance and Overtime Smoke | Time Balance and Overtime Smoke Changed | overtimeresults.do          |
      | Leave Time and Balances Smoke   | Leave Time and Balances Smoke Changed   | leavesresults.do            |
      | Time Track In Detail Smoke      | Time Track In Detail Smoke Changed      | commentsreportresults.do    |
      | Estimated vs. Actual Time Smoke | Estimated vs. Actual Time Smoke Changed | estimatedvsactualresults.do |

    When I am on reports page
    And reports_page is visible
    And I open report on dashboard with name <report_name>
    And I wait 2 seconds for animation stops
    And My current URL should contain /reports/<report_url>
    And I click report_name
    And I enter <report_name_changed> in the report_name_text_field
    And I wait 1 seconds for animation stops
    And I click save_report_changes_button
    And I wait 1 seconds for animation stops
    And I click save_changes_button
    And I click reports_dashboard
    And I wait 1 seconds for animation stops
    Then I should see a text <report_name_changed> on the page

  @role
  Scenario Outline: Remove report from dashboard
    Examples: <report_name>
      | report_name                             |
      | Staff Performance Smoke Changed         |
      | Time Balance and Overtime Smoke Changed |
      | Leave Time and Balances Smoke Changed   |
      | Time Track In Detail Smoke Changed      |
      | Estimated vs. Actual Time Smoke Changed |

    When I am on reports page
    And reports_page is visible
    And I remove <report_name> report from dashboard
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a text <report_name> on the page

  @role
  Scenario Outline: Export charts in .pdf files
    Examples: <chart_name>
      | chart_name             |
      | Total working hours    |
      | Leave hours            |
      | PTO Balance            |
      | Sick Days Balance      |
      | Approved working hours |

    When I am on reports page
    And reports_page is visible
    And I click create_chart_button
    And I wait 2 seconds for animation stops
    And I click month_selector_from_calendar
    And I wait 1 seconds for animation stops
    And I click month_selector_calendar
    And I wait 1 seconds for animation stops
    And I click Jan_in_calendar
    And I click calendar_month_ok
    And I wait 1 seconds for animation stops
    And I click calendar_ok_button
    And I wait 1 seconds for animation stops
    And I click show_selector_button
    And I wait 1 seconds for animation stops
    And I select <chart_name> in chart selector
    And I wait 2 seconds for animation stops
    And I click export_chart_button
    And I wait 2 seconds for animation stops
    And I click download_chart_button
    And I wait 2 seconds for animation stops
    Then I search report <chart_name> with the extension pdf in downloads folder

  @role
  Scenario Outline: Create and Save Charts on dashboard
    Examples: <chart_name>
      | chart                  | chart_name                   |
      | Total working hours    | Total working hours Smoke    |
      | Approved working hours | Approved working hours Smoke |
      | Leave hours            | Leave hours Smoke            |
      | PTO Balance            | PTO Balance Smoke            |
      | Sick Days Balance      | Sick Days Balance Smoke      |

    When I am on reports page
    And reports_page is visible
    And I click create_chart_button
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
    Then I should see a text <chart_name> on the page

  @role
  Scenario Outline: Change charts
    Examples: <chart_name>
      | chart_name                   | chart_name_changed                   |
      | Total working hours Smoke    | Total working hours Smoke Changed    |
      | Approved working hours Smoke | Approved working hours Smoke Changed |
      | Leave hours Smoke            | Leave hours Smoke Changed            |
      | PTO Balance Smoke            | PTO Balance Smoke Changed            |
      | Sick Days Balance Smoke      | Sick Days Balance Smoke Changed      |

    When I am on reports page
    And reports_page is visible
    And I open report on dashboard with name <chart_name>
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

  @role
  Scenario Outline: Remove chart from dashboard
    Examples: <report_name>
      | chart_name                           |
      | Total working hours Smoke Changed    |
      | Approved working hours Smoke Changed |
      | Leave hours Smoke Changed            |
      | PTO Balance Smoke Changed            |
      | Sick Days Balance Smoke Changed      |

    When I am on reports page
    And reports_page is visible
    And I remove <chart_name> report from dashboard
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a text <chart_name> on the page

  # 1-я настройка DAR включена
  @role
  Scenario: General settings: data access restrictions
    When I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings
    And general_settings_page is visible
    And I perform select in the gs_dar_see_all_tt
    And I click gs_dar_see_all_tt_selector
    And I click dar_selector_filter
    And I enter Enter TT in the dar_search_in_selector
    And I click gs_dar_see_all_tt_selector_entertt
    And I click gs_dar_see_all_tt_selector_apply
    And I click gs_save
    And I wait 2 seconds for animation stops
    Then gs_dar_see_all_tt_selector should contain Enter TT, Role

  @role
  Scenario Outline: Export Reports in .csv files with DAR
    Examples: <report_name>
      | report                    | report_name               | prev_report_url      |
      | staff_performance_button  | Staff Performance         | staffperformance.do  |
      | time_balance_button       | Time Balance and Overtime | overtime.do          |
      | leave_time_balance_button | Leave Time                | leaves.do            |
      | time_track_detail_button  | Time Track In Detail      | commentsreport.do    |
      | estimated_button          | Estimated vs. Actual Time | estimatedvsactual.do |

    When I am on reports page
    And reports_page is visible
    And I click new_report_button
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

  @role
  Scenario Outline: Create and Save Reports on dashboard with DAR
    Examples: <report_name>
      | report                    | report_name                     | prev_report_url      | report_url                  |
      | staff_performance_button  | Staff Performance Smoke         | staffperformance.do  | staffperformanceresults.do  |
      | time_balance_button       | Time Balance and Overtime Smoke | overtime.do          | overtimeresults.do          |
      | leave_time_balance_button | Leave Time and Balances Smoke   | leaves.do            | leavesresults.do            |
      | time_track_detail_button  | Time Track In Detail Smoke      | commentsreport.do    | commentsreportresults.do    |
      | estimated_button          | Estimated vs. Actual Time Smoke | estimatedvsactual.do | estimatedvsactualresults.do |

    When I am on reports page
    And reports_page is visible
    And I click new_report_button
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

  @role
  Scenario Outline: Change report with DAR
    Examples: <report_name>
      | report_name                     | report_name_changed                     | report_url                  |
      | Staff Performance Smoke         | Staff Performance Smoke Changed         | staffperformanceresults.do  |
      | Time Balance and Overtime Smoke | Time Balance and Overtime Smoke Changed | overtimeresults.do          |
      | Leave Time and Balances Smoke   | Leave Time and Balances Smoke Changed   | leavesresults.do            |
      | Time Track In Detail Smoke      | Time Track In Detail Smoke Changed      | commentsreportresults.do    |
      | Estimated vs. Actual Time Smoke | Estimated vs. Actual Time Smoke Changed | estimatedvsactualresults.do |

    When I am on reports page
    And reports_page is visible
    And I open report on dashboard with name <report_name>
    And I wait 2 seconds for animation stops
    And My current URL should contain /reports/<report_url>
    And I click report_name
    And I enter <report_name_changed> in the report_name_text_field
    And I wait 1 seconds for animation stops
    And I click save_report_changes_button
    And I wait 1 seconds for animation stops
    And I click save_changes_button
    And I click reports_dashboard
    And I wait 1 seconds for animation stops
    Then I should see a text <report_name_changed> on the page

  @role
  Scenario Outline: Remove report from dashboard with DAR
    Examples: <report_name>
      | report_name                             |
      | Staff Performance Smoke Changed         |
      | Time Balance and Overtime Smoke Changed |
      | Leave Time and Balances Smoke Changed   |
      | Time Track In Detail Smoke Changed      |
      | Estimated vs. Actual Time Smoke Changed |

    When I am on reports page
    And reports_page is visible
    And I remove <report_name> report from dashboard
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a text <report_name> on the page

  @role
  Scenario Outline: Export charts in .pdf files with DAR
    Examples: <chart_name>
      | chart_name             |
      | Total working hours    |
      | Leave hours            |
      | PTO Balance            |
      | Sick Days Balance      |
      | Approved working hours |

    When I am on reports page
    And reports_page is visible
    And I click create_chart_button
    And I wait 2 seconds for animation stops
    And I click month_selector_from_calendar
    And I wait 1 seconds for animation stops
    And I click month_selector_calendar
    And I wait 1 seconds for animation stops
    And I click Jan_in_calendar
    And I click calendar_month_ok
    And I wait 1 seconds for animation stops
    And I click calendar_ok_button
    And I wait 1 seconds for animation stops
    And I click show_selector_button
    And I wait 1 seconds for animation stops
    And I select <chart_name> in chart selector
    And I wait 2 seconds for animation stops
    And I click export_chart_button
    And I wait 2 seconds for animation stops
    And I click download_chart_button
    And I wait 2 seconds for animation stops
    Then I search report <chart_name> with the extension pdf in downloads folder

  @role
  Scenario Outline: Create and Save Charts on dashboard with DAR
    Examples: <chart_name>
      | chart                  | chart_name                   |
      | Total working hours    | Total working hours Smoke    |
      | Approved working hours | Approved working hours Smoke |
      | Leave hours            | Leave hours Smoke            |
      | PTO Balance            | PTO Balance Smoke            |
      | Sick Days Balance      | Sick Days Balance Smoke      |

    When I am on reports page
    And reports_page is visible
    And I click create_chart_button
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
    Then I should see a text <chart_name> on the page

  @role
  Scenario Outline: Change charts with DAR
    Examples: <chart_name>
      | chart_name                   | chart_name_changed                   |
      | Total working hours Smoke    | Total working hours Smoke Changed    |
      | Approved working hours Smoke | Approved working hours Smoke Changed |
      | Leave hours Smoke            | Leave hours Smoke Changed            |
      | PTO Balance Smoke            | PTO Balance Smoke Changed            |
      | Sick Days Balance Smoke      | Sick Days Balance Smoke Changed      |

    When I am on reports page
    And reports_page is visible
    And I open report on dashboard with name <chart_name>
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

  @role
  Scenario Outline: Remove chart from dashboard with DAR
    Examples: <report_name>
      | chart_name                           |
      | Total working hours Smoke Changed    |
      | Approved working hours Smoke Changed |
      | Leave hours Smoke Changed            |
      | PTO Balance Smoke Changed            |
      | Sick Days Balance Smoke Changed      |

    When I am on reports page
    And reports_page is visible
    And I remove <chart_name> report from dashboard
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a text <chart_name> on the page

  # 5-я настройка DAR выключена
  @role
  Scenario: User list read-only
    When I am on user_list page
    And user_list_page is visible
    And I click user_cruz_gordman
    Then I should not see a web element edit_first_name_field

  @role
  Scenario: Searching users
    When I am on user_list page
    And user_list_page is visible
    And I click search_button
    And I enter Kloss in the search_field
    And I wait 2 seconds for animation stops
    Then first_search_result should contain Kloss

  @role
  Scenario: User filter in user list
    When I am on user_list page
    And user_list_page is visible
    And I click user_filter_button
    And I click selected_users_in_selector
    And user_list_page is visible
    And I wait 2 seconds for animation stops
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

  @role
  Scenario: Sorting by users
    When I am on user_list page
    And user_list_page is visible
    And I click sorting_by_group
    And I wait 1 seconds for animation stops
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Wooster, Jennifer

  @role
  Scenario: Sorting by groups
    When I am on user_list page
    And user_list_page is visible
    And I click sorting_by_group
    And I wait 1 seconds for animation stops
    And I click sorting_by_group
    And I wait 1 seconds for animation stops
    Then first_group_in_list should contain Development

  @role
  Scenario: Sorting by time zones
    When I am on user_list page
    And user_list_page is visible
    And I click sorting_by_tzg
    And I wait 1 seconds for animation stops
    And I click sorting_by_tzg
    And I wait 1 seconds for animation stops
    Then first_tzg_in_list should contain Sydney Office

  @role
  Scenario: Management filter
    When I am on user_list page
    And user_list_page is visible
    And I click management_filter
    And I click users_wo_permissions_filter
    And I wait 1 seconds for animation stops
    And first_username_in_list should contain Venson, Ronald
    And I click management_filter
    And I click all_staff_filter
    And I click sorting_by_users
    And I wait 1 seconds for animation stops
    Then first_username_in_list should contain Barber, Robert

  @role
  Scenario: No User List
    When I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click general_settings_button
    And general_settings_page is visible
    And I perform select in the gs_dar_hide_not_assigned_users
    And I wait 1 seconds for animation stops
    And I click gs_save
    And I am logged in as enter tt role
    And general_page is visible
    Then I should not see a web element user_list