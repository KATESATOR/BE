Feature: aP Work Schedule settings

  Background:
    When I am logged in actiPLANS as admin
    And general_page is visible
    And I click settings_button
    And I click ap_work_schedule_button
    And work_schedule_page is visible

    # Перед началом теста, необходимо чтобы было выбрано для показа три месяца
  @smoke
  Scenario: Change months to view in actiPLANS
    When I click format_selector
    And I click show_5
    And I should see a web element last_month_table
    And I wait 1 seconds for animation stops
    And I click format_selector
    And I click show_3
    Then I should not see a web element last_month_table

# Тест проходит только в рабочие дни
  @smoke
  Scenario: Change work/weekend day in actiPLANS
    When I click current_working_day
    And I wait 1 seconds for animation stops
    And I should see a web element current_weekend_day
    And I click current_weekend_day
    And I wait 1 seconds for animation stops
    Then I should not see a web element current_weekend_day