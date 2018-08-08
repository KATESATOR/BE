from features.utility.element import *


class GeneralPage:

    def __init__(self):
        self.start_exploring_at_button = Button("//span[text()='Start exploring actiTIME']", "xpath",
                                                "start exploring at button")
        self.logout_button = Button("//a[@id='logoutLink']", "xpath", "logout button")
        self.settings_button = Button('//div[@class="popup_menu_button popup_menu_button_settings"]', "xpath",
                                      "settings button")
        self.licenses_button = Button('popup_menu_item_8', "id", "licenses button")
        self.my_profile = Button("//a[@class='userProfileLink username']", "xpath", "my profile")
        self.first_name_field = TextField("userProfilePopup_firstNameField", "id", "first name field")
        self.last_name_field = TextField("userProfilePopup_lastNameField", "id", "last name field")
        self.save_profile_changes = Button("userProfilePopup_commitBtn", "id", "save profile changes button")