Feature: Notifications by admin

  Background:
    Given I am logged in as admin
    And general_page is visible
    And I click settings_button
    And I click notifications_button
    And notification_page is visible

  @smoke
  Scenario: Send notifications
    When I click send_notifications_button
    And I wait 2 seconds for animation stops
    Then I should see a web element success_send_notification_text

  @smoke
  Scenario Outline: Create notification rules pt.1
    Examples: Create <notification> rule
      | rule      | row         | field   | text | text_1 | notification   |
      | addRule_1 | ruleRow_1_1 | ttLimit | 160  | 20     | personal_tt    |
      | addRule_2 | ruleRow_2_2 | ttLimit | 160  | 20     | unsubmitted_tt |

    When I add notification rule <rule>
    And I enter text <text> in second rule field <field> row <row>
    And I enter text <text_1> in rule field <field> row <row>
    And I save row <row> notification <notification> rule
    And I wait 2 seconds for animation stops
    Then I should see a web element rule_row

  @smoke
  Scenario: Create notification of worked out tasks estimate
    When I add notification rule addRule_4
    And I enter text 100 in second rule field estimate row ruleRow_4_3
    And I save row ruleRow_4_3 notification estimate rule
    And I wait 2 seconds for animation stops
    Then I should see a web element rule_row

  @smoke
  Scenario Outline: Create notification rules pt.2
    Examples: Create <notification> rule
      | rule      | row         | field    | days | notification      |
      | addRule_3 | ruleRow_3_3 | deadline | 20   | deadline          |
      | addRule_6 | ruleRow_6_2 | money    | 100  | project_budget    |
      | addRule_7 | ruleRow_7_1 | money    | 100  | personal_earnings |

    When I add notification rule <rule>
    And I enter text <days> in rule field <field> row <row>
    And I save row <row> notification <notification> rule
    And I wait 2 seconds for animation stops
    Then I should see a web element rule_row

  @smoke
  Scenario Outline: Pause/Resume rules
    Examples: Pause/Resume rule
      | row         |
      | ruleRow_1_1 |
      | ruleRow_2_2 |
      | ruleRow_3_3 |
      | ruleRow_4_3 |
      | ruleRow_6_2 |
      | ruleRow_7_1 |

    When I pause/resume row <row> notification rule
    And I wait 1 seconds for animation stops
    And I should see a web element paused_text
    And I pause/resume row <row> notification rule
    And I wait 1 seconds for animation stops
    Then I should not see a web element paused_text

  @smoke
  Scenario Outline: Remove rules
    Examples: Remove rule
      | row         |
      | ruleRow_1_1 |
      | ruleRow_2_1 |
      | ruleRow_3_3 |
      | ruleRow_4_3 |
      | ruleRow_6_2 |
      | ruleRow_7_1 |

    When I remove row <row> notification rule
    And I accept alert menu
    And I wait 2 seconds for animation stops
    Then I should not see a web element rule_row