from features.utility.element import *


class NotificationPage:
    def __init__(self):
        # Notifications
        self.send_notifications_button = Button("ext-comp-1002", "id", "send notifications now")
        self.success_send_notification_text = Element("//*[@class='successmsg']", "xpath",
                                                      "success send notification text")
