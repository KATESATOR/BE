Feature: Licenses by admin

  Background:
    Given I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click licenses_button
    And license_page is visible


  @smoke
  Scenario: Check license information
    When I wait 2 seconds for animation stops
    Then I should see a web element active_license

  @smoke
  Scenario: Open Contact Support Team popup
    When I wait 2 seconds for animation stops
    And I click contact_support_button
    And I wait 2 seconds for animation stops
    And I should see a web element contact_support_popup
    And I click contact_support_popup_close_button
    And I wait 2 seconds for animation stops
    Then I should not see a web element contact_support_popup

    @smoke
    Scenario: Open integration actiPLANS popup
      When I wait 2 seconds for animation stops
      And I click addons_button
      And I click integration_actiplans_button
      And I wait 2 seconds for animation stops
      Then I should see a web element integration_popup
  @smoke
  Scenario: Open integration actiPLANS popup
    When I wait 2 seconds for animation stops
    And I click addons_button
    And I click integration_actiplans_button
    And I wait 2 seconds for animation stops
    Then I should see a web element integration_popup
