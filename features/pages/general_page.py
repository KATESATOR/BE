from features.utility.element import *


class GeneralPage:

    def __init__(self):
        self.start_exploring_button = Button(".startExploringText", "css", "start exploring button")
        self.logout_button = Button("//a[@id='logoutLink']", "xpath", "logout button")
        self.settings_button = Button("//div[@class='popup_menu_button popup_menu_button_settings']", "xpath",
                                      "settings button")
        self.licenses_button = Button("popup_menu_item_8", "id", "licenses button")
        self.my_profile = Button("//a[@class='userProfileLink username']", "xpath", "my profile")
        self.profile_first_name = TextField("userProfilePopup_firstNameField", "id", "my profile first name field")
        self.profile_last_name = TextField("userProfilePopup_lastNameField", "id", "my profile last name field")
        self.save_profile_changes = Button("userProfilePopup_commitBtn", "id", "save profile changes button")
        self.time_track = Button("//a[@class='content tt']", "xpath", "Time-Track menu")
        self.view_tt = Link("View Time-Track", "link", "view tt interface")
        self.my_view_tt = Link("View My Time-Track", "link", "view tt interface")
        self.lock_tt = Link("Lock Time-Track", "link text", "lock tt page")
        self.approve_tt = Link("Approve Time-Track", "link", "approve tt interface")
        self.tasks = Button("//a[@class='content tasks']", "xpath", "Tasks menu")
        self.reports = Button("//a[@class='content reports']", "xpath", "Reports menu")
        self.user_list = Button("//a[@class='content users']", "xpath", "Users menu")
        self.features = Button("li#popup_menu_item_1 div.item_descr", "CSS", "Features")
        self.general_settings = Button("li#popup_menu_item_6 div.item_title", "CSS", "General Settings")
        self.workflow_settings = Button("li#popup_menu_item_9 > a", "CSS", "Workflow Settings")
        self.types_of_work = Button("li#popup_menu_item_2 > a", "CSS", "Type of Work")
        self.help_button = Button("//div[@class='popup_menu_button popup_menu_button_support']", "xpath", "help button")
        self.create_account_for_colleague = Button("popup_menu_support_createAccountColleague", "id",
                                                   "create account for colleague")
        self.colleague_first_name = TextField("popup_menu_support_firstNameInviteMenu", "id",
                                              "Colleague first name field")
        self.colleague_last_name = TextField("popup_menu_support_lastNameInviteMenu", "id",
                                             "Colleague last name field")
        self.colleague_email = TextField("popup_menu_support_emailInviteMenu", "id",
                                         "Colleague first name field")
        self.invite_colleague = Button("popup_menu_support_sendInvitationButton", "id", "Invite colleague button")
        self.introduction_video = Button("//a[@class='item_link' and text()[contains(., 'Introduction Video')]]",
                                         "xpath", "Introduction video")
        self.about_actitime = Button("//a[@class='item_link' and text()[contains(., 'About your actiTIME')]]",
                                         "xpath", "About your actiTIME")
        self.contact_support = Button("//a[@class='item_link' and text()[contains(., 'Contact actiTIME Support')]]",
                                     "xpath", "Contact actiTIME Support")
        self.support_field = TextField("contactSupportPopup_description", "id", "Support field")
        self.submit_support = Button("contactSupportPopup_submitButton", "id", "Send to support button")
        self.phone_number = TextField("phoneInput_support", "id", "Phone number field")
        self.request_a_call = Button("sendPhoneButton_support", "id", "Phone number field")
        self.switch_product = Button("//div[@class='productName']", "xpath", "Product switcher")
