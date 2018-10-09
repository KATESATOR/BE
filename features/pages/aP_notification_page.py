from features.utility.element import *


class ApNotificationPage:
    def __init__(self):
        self.save_button_bottom = Button("saveSettingsButton", "id", "Save Button on bottom")
        self.save_button_top = Button("FormModifiedDivButton", "id", "Save Button on top")
        self.save_message_success_text = Element("SuccessMessages", "id", "Save message success")

        # Notifications for Request Approvers
        self.notify_new_ltr_checkbox = Button("notifyNewLtrId", "id", "Notify new leave time requests checkbox")
        self.notify_modified_ltr_checkbox = Button("notifyModifiedLtrId", "id",
                                                   "Notify modified leave time requests checkbox")
        self.notify_deleted_ltr_checkbox = Button("notifyDeletedLtrId", "id",
                                                  "Notify deleted leave time requests checkbox")
        self.notify_status_changed_ltr_checkbox = Button("notifyStatusChangedLtrId", "id",
                                                         "Notify on leave time requests status changed checkbox")
        self.notify_waiting_ltr_checkbox = Button("notifyWaitingLtrId", "id", "Send reminder checkbox")
        self.reminder_days_textfield = TextField("daysBeforeWaitingLtrToRemindId", "id",
                                                 "Days before the starts reminder textfield")
        self.reminder_at_textfield = TextField("dayTimeToRemindAboutWaitingLtrStrId", "id", "Reminder 'at' textfield")
        self.resend_reminders_now_button = Button("resendRemindersNowDiv", "id", "Resend reminders now button")
        self.resend_message_text = Element("//*[@id='resendRemindersNow_progress_note'][@class='successmsg']", "xpath",
                                           "Resend message text success")

        # Notifications for Regular Users
        self.notify_users_on_ltr_changed_checkbox = Button("notifyConsideredLtrId", "id",
                                                           "Notify users on approved "
                                                           "and rejected leave time requests checkbox")
        self.notify_users_on_ltr_new_or_deleted_checkbox = Button("notifyCreatedOrDeletedLtrId", "id",
                                                                  "Notify users on new "
                                                                  "and deleted leave time requests checkbox")

        # Message Parameters
        self.message_prefix_textfield = TextField("//input[@name='mailSubjectPrefix']", "xpath",
                                                  "Message prefix textfield")
        self.message_footer_textfield = TextField("mailMessageFooterId", "id", "Message footer textfield")
        self.send_test_message_button = Button("sendTestMessage_button", "id", "Send Test Message button")
        self.test_message_text = Element("//*[@id='sendTestMessage_note'][@class='successmsg']", "xpath",
                                         "Send test message text success")

        # Error Processing
        self.admin_mail_address_textfield = TextField("adminMailAddressId", "id", "Admin mail address textfield")
