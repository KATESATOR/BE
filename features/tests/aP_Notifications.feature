Feature: aP Notifications settings

  Background:
    When I am logged in actiPLANS as admin
    And general_page is visible
    And I click settings_button
    And I click ap_notifications_button
    And ap_notification_page is visible

  @smoke
  Scenario: Resend reminders
    When I click resend_reminders_now_button
    And I wait 2 seconds for animation stops
    Then I should see a web element resend_message_text

  @smoke
  Scenario: Send test message
    When I click send_test_message_button
    And I wait 2 seconds for animation stops
    Then I should see a web element test_message_text

  @smoke
  Scenario: Change Settings
    And I enter 3 in the reminder_days_textfield
    And I enter 12:00 PM in the reminder_at_textfield
    And I enter aP Prefix in the message_prefix_textfield
    And I enter aP Footer in the message_footer_textfield
    And I enter anton.provotorov@actimind.com in the admin_mail_address_textfield
    And I click save_button_bottom
    And I wait 2 seconds for animation stops
    And notify_new_ltr_checkbox should have checked with true
    And notify_modified_ltr_checkbox should have checked with true
    And notify_deleted_ltr_checkbox should have checked with true
    And notify_status_changed_ltr_checkbox should have checked with true
    And notify_waiting_ltr_checkbox should have checked with true
    And reminder_days_textfield should have value with 3
    And reminder_at_textfield should have value with 12:00 PM
    And notify_users_on_ltr_changed_checkbox should have checked with true
    And notify_users_on_ltr_new_or_deleted_checkbox should have checked with true
    And message_prefix_textfield should have value with aP Prefix
    And message_footer_textfield should have value with aP Footer
    And admin_mail_address_textfield should have value with anton.provotorov@actimind.com
    And I wait 2 seconds for animation stops
    And I click notify_new_ltr_checkbox
    And I click notify_modified_ltr_checkbox
    And I click notify_deleted_ltr_checkbox
    And I click notify_status_changed_ltr_checkbox
    And I click notify_waiting_ltr_checkbox
    And I click notify_users_on_ltr_changed_checkbox
    And I click notify_users_on_ltr_new_or_deleted_checkbox
    And I click save_button_bottom
    Then I wait 2 seconds for animation stops