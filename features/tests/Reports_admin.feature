Feature: Reports interface by admin

  Background:
    Given I am logged in as admin
    And reports_page is visible
    And I click reports_page_button

  @smoke
  Scenario Outline: Export Reports in .csv files
    Examples: <report_name>
      | report                    | report_name               | prev_report_url      |
      | staff_performance_button  | Staff Performance         | staffperformance.do  |
      | time_balance_button       | Time Balance and Overtime | overtime.do          |
      | leave_time_balance_button | Leave Time and Balances   | leaves.do            |
      | time_track_detail_button  | Time Track In Detail      | commentsreport.do    |
      | estimated_button          | Estimated vs. Actual Time | estimatedvsactual.do |
      | billing_summary_button    | Billing Summary           | billingsummary.do    |
      | cost_of_work_button       | Cost of Work              | cost.do              |
      | profit_loss_button        | Profit Loss               | profitloss.do        |

    When I click new_report_button
    And I wait 2 seconds for animation stops
    And I should see a web element choose_report_window
    And I click <report>
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    And My current URL should contain http://rdbuild-agent:8080/cur/reports/<prev_report_url>
    And I click csv_preview_button
    And I click export_to_csv_button
    And I wait 2 seconds for animation stops
    Then I search report <report_name> with the extension csv in downloads folder

  @smoke
  Scenario: Export Invoice Report to PDF
    When I click new_report_button
    And I wait 2 seconds for animation stops
    And I should see a web element choose_report_window
    And I click invoice_export_button
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    And My current URL should contain http://rdbuild-agent:8080/cur/reports/invoice.do
    And I click generate_html_button
    And I wait 2 seconds for animation stops
    And My current URL should contain http://rdbuild-agent:8080/cur/reports/invoiceresults.do
    And I enter №1 in the invoice_number_text_field
    And I click create_pdf_invoice_button
    And I wait 3 seconds for animation stops
    Then I search report Invoice with the extension pdf in downloads folder

  @smoke
  Scenario Outline: Create and Save Reports on dashboard
    Examples: <report_name>
      | report                    | report_name                     | prev_report_url      | report_url                  |
      | staff_performance_button  | Staff Performance Smoke         | staffperformance.do  | staffperformanceresults.do  |
      | time_balance_button       | Time Balance and Overtime Smoke | overtime.do          | overtimeresults.do          |
      | leave_time_balance_button | Leave Time and Balances Smoke   | leaves.do            | leavesresults.do            |
      | time_track_detail_button  | Time Track In Detail Smoke      | commentsreport.do    | commentsreportresults.do    |
      | estimated_button          | Estimated vs. Actual Time Smoke | estimatedvsactual.do | estimatedvsactualresults.do |
      | billing_summary_button    | Billing Summary Smoke           | billingsummary.do    | billingsummaryresults.do    |
      | invoice_export_button     | Invoice Smoke                   | invoice.do           | invoiceresults.do           |
      | cost_of_work_button       | Cost of Work Smoke              | cost.do              | costresults.do              |
      | profit_loss_button        | Profit Loss Smoke               | profitloss.do        | profitlossresults.do        |

    When I click new_report_button
    And I wait 2 seconds for animation stops
    And I should see a web element choose_report_window
    And I click <report>
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    And My current URL should contain http://rdbuild-agent:8080/cur/reports/<prev_report_url>
    And I click generate_html_button
    And I wait 2 seconds for animation stops
    And My current URL should contain http://rdbuild-agent:8080/cur/reports/<report_url>
    And I click add_to_dashboard_button
    And I enter <report_name> in the report_name_text_field
    And I click save_report_name_button
    And I wait 2 seconds for animation stops
    Then report_name should contain <report_name>

  @smoke
  Scenario Outline: Change report
    Examples: <report_name>
      | report_name                     | report_name_changed                     | report_url                  |
      | Staff Performance Smoke         | Staff Performance Smoke Changed         | staffperformanceresults.do  |
      | Time Balance and Overtime Smoke | Time Balance and Overtime Smoke Changed | overtimeresults.do          |
      | Leave Time and Balances Smoke   | Leave Time and Balances Smoke Changed   | leavesresults.do            |
      | Time Track In Detail Smoke      | Time Track In Detail Smoke Changed      | commentsreportresults.do    |
      | Estimated vs. Actual Time Smoke | Estimated vs. Actual Time Smoke Changed | estimatedvsactualresults.do |
      | Billing Summary Smoke           | Billing Summary Smoke Changed           | billingsummaryresults.do    |
      | Invoice Smoke                   | Invoice Smoke Changed                   | invoiceresults.do           |
      | Cost of Work Smoke              | Cost of Work Smoke Changed              | costresults.do              |
      | Profit Loss Smoke               | Profit Loss Smoke Changed               | profitlossresults.do        |

    When I open report on dashboard with name <report_name>
    And I wait 2 seconds for animation stops
    And My current URL should contain http://rdbuild-agent:8080/cur/reports/<report_url>
    And I click report_name
    And I enter <report_name_changed> in the report_name_text_field
    And I wait 1 seconds for animation stops
    And I click save_report_changes_button
    And I wait 1 seconds for animation stops
    And I click save_changes_button
    And I click reports_dashboard
    And I wait 1 seconds for animation stops
    Then I should see a text <report_name_changed> on the page


  @smoke
  Scenario Outline: Remove report from dashboard
    Examples: <report_name>
      | report_name                             |
      | Staff Performance Smoke Changed         |
      | Time Balance and Overtime Smoke Changed |
      | Leave Time and Balances Smoke Changed   |
      | Time Track In Detail Smoke Changed      |
      | Estimated vs. Actual Time Smoke Changed |
      | Billing Summary Smoke Changed           |
      | Invoice Smoke Changed                   |
      | Cost of Work Smoke Changed              |
      | Profit Loss Smoke Changed               |

    When I remove <report_name> report from dashboard
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a text <report_name> on the page

  @smoke
  Scenario Outline: Export charts in .pdf files
    Examples: <chart_name>
      | chart_name             |
      | Total working hours    |
      | Approved working hours |
      | Leave hours            |
      | PTO Balance            |
      | Sick Days Balance      |
      | Overtime hours         |
      | Cost of work           |
      | Billable amounts       |

    When I click create_chart_button
    And I wait 2 seconds for animation stops
    And I click show_selector_button
    And I wait 2 seconds for animation stops
    And I select <chart_name> in chart selector
    And I click export_chart_button
    And I wait 2 seconds for animation stops
    And I click download_chart_button
    And I wait 2 seconds for animation stops
    Then I search report <chart_name> with the extension pdf in downloads folder

  @smoke
  Scenario Outline: Create and Save Charts on dashboard
    Examples: <chart_name>
      | chart                  | chart_name                   |
      | Total working hours    | Total working hours Smoke    |
      | Approved working hours | Approved working hours Smoke |
      | Leave hours            | Leave hours Smoke            |
      | PTO Balance            | PTO Balance Smoke            |
      | Sick Days Balance      | Sick Days Balance Smoke      |
      | Overtime hours         | Overtime hours Smoke         |
      | Cost of work           | Cost of work Smoke           |
      | Billable amounts       | Billable amounts Smoke       |

    When I click create_chart_button
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

  @smoke
  Scenario Outline: Change charts
    Examples: <chart_name>
      | chart_name                   | chart_name_changed                   |
      | Total working hours Smoke    | Total working hours Smoke Changed    |
      | Approved working hours Smoke | Approved working hours Smoke Changed |
      | Leave hours Smoke            | Leave hours Smoke Changed            |
      | PTO Balance Smoke            | PTO Balance Smoke Changed            |
      | Sick Days Balance Smoke      | Sick Days Balance Smoke Changed      |
      | Overtime hours Smoke         | Overtime hours Smoke Changed         |
      | Cost of work Smoke           | Cost of work Smoke Changed           |
      | Billable amounts Smoke       | Billable amounts Smoke Changed       |

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

  @smoke
  Scenario Outline: Remove chart from dashboard
    Examples: <report_name>
      | chart_name                           |
      | Total working hours Smoke Changed    |
      | Approved working hours Smoke Changed |
      | Leave hours Smoke Changed            |
      | PTO Balance Smoke Changed            |
      | Sick Days Balance Smoke Changed      |
      | Overtime hours Smoke Changed         |
      | Cost of work Smoke Changed           |
      | Billable amounts Smoke Changed       |

    When I remove <chart_name> report from dashboard
    And I accept alert menu
    And I wait 3 seconds for animation stops
    Then I should not see a text <chart_name> on the page