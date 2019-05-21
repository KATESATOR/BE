Feature: aP Logo & Color Scheme settings

  Background:
    When I am logged in actiPLANS as admin
    And general_page is visible
    And I click settings_button
    And I click logo_color_scheme_button
    And logo_color_scheme_page is visible

  @smoke
  Scenario: Change color scheme in actiPLANS
    When I click purple_color
    And  I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element selected_purple_color
    And I click default_color
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element selected_purple_color

  @smoke
  Scenario: Change logo in actiPLANS
    When I click custom_logo_radiobutton
    And I upload /gif.gif from resources in choose_logo_file
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    And I should see a web element keep_logo_radiobutton
    And I click default_logo_radiobutton
    And I click save_settings_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element keep_logo_radiobutton