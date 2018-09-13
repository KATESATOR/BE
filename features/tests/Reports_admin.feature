Feature: Reports interface by admin

  Background:
    Given I am logged in as admin
    And reports_page is visible
    And I click reports_page_button

  @smoke
  Scenario Outline: Export Reports in .csv files without Invoice Report
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
    Then I should see a web element choose_report_window
    And I click <report>
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    Then My current URL should contain http://rdbuild-agent:8080/cur/reports/<prev_report_url>
    And I click csv_preview_button
    And I click export_to_csv_button
    And I wait 2 seconds for animation stops
    Then I search report <report_name> with the extension csv in downloads folder

  @smoke
  Scenario: Export Invoice Report to PDF
    When I click new_report_button
    And I wait 2 seconds for animation stops
    Then I should see a web element choose_report_window
    And I click invoice_export_button
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    Then My current URL should contain http://rdbuild-agent:8080/cur/reports/invoice.do
    And I click generate_html_button
    And I wait 2 seconds for animation stops
    Then My current URL should contain http://rdbuild-agent:8080/cur/reports/invoiceresults.do
    And I enter №1 in the invoice_number_text_field
    And I click create_pdf_invoice_button
    And I wait 3 seconds for animation stops
    Then I search report Invoice with the extension pdf in downloads folder

  @smoke
  Scenario Outline: Create and Save Reports in dashboard
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
    Then I should see a web element choose_report_window
    And I click <report>
    And I click configure_report_button
    And I wait 2 seconds for animation stops
    Then My current URL should contain http://rdbuild-agent:8080/cur/reports/<prev_report_url>
    And I click generate_html_button
    And I wait 2 seconds for animation stops
    Then My current URL should contain http://rdbuild-agent:8080/cur/reports/<report_url>
    And I click add_to_dashboard_button
    And I enter <report_name> in the report_name_text_field
    And I click save_report_name_button
    And I wait 2 seconds for animation stops
    Then report_name should contain <report_name>

  @smoke
  Scenario Outline: Remove report from dashboard
    Examples: <report_name>
      | report_name                     |
      | Staff Performance Smoke         |
      | Time Balance and Overtime Smoke |
      | Leave Time and Balances Smoke   |
      | Time Track In Detail Smoke      |
      | Estimated vs. Actual Time Smoke |
      | Billing Summary Smoke           |
      | Invoice Smoke                   |
      | Cost of Work Smoke              |
      | Profit Loss Smoke               |

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
  Scenario Outline: Create and Save Charts in dashboard
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
    And I wait 4 seconds for animation stops
    Then report_name should contain <chart_name>
    And I click close_chart_button
    And I wait 2 seconds for animation stops
    Then I should see a text <chart_name> on the page

  @smoke
  Scenario Outline: Remove chart from dashboard
    Examples: <report_name>
      | chart_name                   |
      | Total working hours Smoke    |
      | Approved working hours Smoke |
      | Leave hours Smoke            |
      | PTO Balance Smoke            |
      | Sick Days Balance Smoke      |
      | Overtime hours Smoke         |
      | Cost of work Smoke           |
      | Billable amounts Smoke       |

    When I remove <chart_name> report from dashboard
    And I accept alert menu
    And I wait 4 seconds for animation stops
    Then I should not see a text <chart_name> on the page