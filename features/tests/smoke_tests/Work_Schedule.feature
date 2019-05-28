Feature: Work Schedule by admin

  Background:
    Given I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click work_schedule_button
    And work_schedule_page is visible

#  Outdated tests for old interface
#  @smoke
#  Scenario: Change months to view
#    When I click format_selector
#    And I click show_5
#    And I should see a web element last_month_table
#    And I wait 1 seconds for animation stops
#    And I click format_selector
#    And I click show_3
#    Then I should not see a web element last_month_table
#
#  @smoke
#  Scenario: Change work/weekend day
#    When I click current_working_day
#    And I wait 1 seconds for animation stops
#    And I should see a web element current_weekend_day
#    And I click current_weekend_day
#    And I wait 1 seconds for animation stops
#    Then I should not see a web element current_weekend_day

  @Smoke
  Scenario: Changing year
    When I click year_selector
    And I click year_2020_in_selector
    And I wait 2 seconds for animation stops
    And year_selector should contain 2020
    And I should see a web element emptyday_of_april_2020
    And I click holiday_list
    Then year_holiday_list should contain 2020

  @Smoke
  Scenario: Creating, editing, deleting holiday
    When I click first_of_april
    And I wait 1 seconds for animation stops
    And first_of_april should have class with components_day monthDay corporateHoliday
    And I click first_of_april
    And I enter Smoke Test Day in the holiday_pop_up_name_field
    And I click first_of_april
    And I wait 1 seconds for animation stops
    And day_tool_tip should contain Smoke Test Day
    And I refresh the page
    And I click first_of_april
    And I click delete_holiday_pop_up
    And I wait 1 seconds for animation stops
    Then first_of_april should have class with components_day monthDay

  @Smoke
  Scenario: Edit, Sorting and Delete holiday on Holiday List
    When I click first_of_april
    And I wait 1 seconds for animation stops
    And I click first_of_january
    And I wait 1 seconds for animation stops
    And I click first_of_january
    And I enter Smoke Test Day in the holiday_pop_up_name_field
    And I wait 1 seconds for animation stops
    And I click holiday_list
    And I wait 1 seconds for animation stops
    And first_date_holiday_list should contain Jan 1
    And I click first_name_holiday_list
    And I wait 1 seconds for animation stops
    And I click first_name_field_holiday_list_button
    And I send 123 without clear in the first_name_field_holiday_list
    And I click first_of_january
    And I click first_of_january
    And I wait 1 seconds for animation stops
    And day_tool_tip should contain Smoke Test Day123
    And I click holiday_list
    And I click sorting_holiday_name
    And first_name_holiday_list should contain Corporate Holiday
    And I click sorting_by_date
    And first_date_holiday_list should contain Jan 1
    And I click first_name_holiday_list
    And I wait 1 seconds for animation stops
    And I click first_date_delete_holiday_list
    And I click first_row_confirm_delete
    And I wait 1 seconds for animation stops
    And I click close_panel
    And I click holiday_list
    And I wait 1 seconds for animation stops
    And first_date_holiday_list should contain Apr 1
    And I click first_name_holiday_list
    And I wait 1 seconds for animation stops
    And I click first_date_delete_holiday_list
    And I click first_row_confirm_delete
    And I wait 1 seconds for animation stops
    Then no_holidays_panel should contain There are no holidays in 2020

  @Smoke
  Scenario: Import holidays
    When I click year_selector
    And I click year_2018_in_selector
    And I wait 1 seconds for animation stops
    And import_button should have class with components_button import disabled
    And I click holiday_list
    And I wait 1 seconds for animation stops
    And import_holiday_list should have class with components_button import disabled
    And I click next_year_holiday_list
    And I wait 1 seconds for animation stops
    And I click import_holiday_list
    And I wait 1 seconds for animation stops
    And I click set_usa
    And I wait 1 seconds for animation stops
    And warning_on_import_panel should contain Past holidays are not shown and will not be imported
    And I should not see a text New Year's Day on the page
    And I click import_button_on_panel
    And I wait 1 seconds for animation stops
    And I click year_selector
    And I click year_2019_in_selector
    And I wait 1 seconds for animation stops
    And I click _25th_of_december
    Then day_tool_tip should contain Christmas Day

  @Smoke
  Scenario: Remove all holidays
    When I click holiday_list
    And I wait 1 seconds for animation stops
    And I click remove_all
    And I click confirm_remove_all
    And I wait 1 seconds for animation stops
    And no_holidays_panel should contain There are no holidays in 2019
    And I click close_panel
    And I wait 1 seconds for animation stops
    Then _25th_of_december should have class with components_day monthDay

  @Smoke
  Scenario: Import from iCal
    When I click import_button
    And I wait 1 seconds for animation stops
    And I upload /US_Holidays.ics from resources in import_from_ical
    And I wait 1 seconds for animation stops
    And I click import_button_on_panel
    And I wait 1 seconds for animation stops
    And I click close_panel
    And I wait 1 seconds for animation stops
    And I click _25th_of_december
    Then day_tool_tip should contain Christmas


