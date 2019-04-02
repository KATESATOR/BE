Feature: Logo & Color Scheme interface

  Background:
    Given I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click logo_color_scheme_button
    And logo_color_scheme_page is visible

  @smoke
  Scenario: Change color scheme
    When I click purple_color
    And  I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element selected_purple_color
    And I click default_color
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element selected_purple_color

  @smoke
  Scenario: Change logo
    When I click custom_logo_radiobutton
    And I enter C:\gif.gif in the choose_logo_file
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element keep_logo_radiobutton
    And I click default_logo_radiobutton
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then  I should not see a web element keep_logo_radiobutton

  @smoke
  Scenario: Change color scheme
    When I click purple_color
    And  I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element selected_purple_color
    And I click default_color
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element selected_purple_color

  @smoke
  Scenario: Change logo
    When I click custom_logo_radiobutton
    And I upload /gif.gif from resources in choose_logo_file
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element keep_logo_radiobutton
    And I click default_logo_radiobutton
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element keep_logo_radiobutton
