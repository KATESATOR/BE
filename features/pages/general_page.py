from features.utility.element import *


class GeneralPage:

    def __init__(self):
        self.start_exploring_button = Button(".startExploringText", "css", "start exploring button")
        self.logout_button = Button("//a[@id='logoutLink']", "xpath", "logout button")
        self.settings_button = Button(".popup_menu_button_settings", "css", "settings button")
        self.general_settings_button = Button(
            "//*[@id='popup_menu_settings']//div[contains(text(), 'General Settings')]", "xpath",
            "general settings button")
        self.licenses_button = Link("Licenses", "link text", "licenses button")
        self.my_profile = Button("//a[@class='userProfileLink username']", "xpath", "my profile")
        self.no_permission_warning = Element('.noPermissionsWarning', 'css', 'no permission warning')
        self.profile_first_name = TextField("userProfilePopup_firstNameField", "id", "my profile first name field")
        self.profile_last_name = TextField("userProfilePopup_lastNameField", "id", "my profile last name field")
        self.save_profile_changes = Button("userProfilePopup_commitBtn", "id", "save profile changes button")
        self.close_profile = Button('closeUserProfilePopupButton', 'id', 'close my profile')
        self.time_track = Button("container_tt", "id", "Time-Track menu")
        self.enter_tt = Link("Enter Time-Track", "link", "enter tt interface")
        self.view_tt = Link("View Time-Track", "link", "view tt interface")
        self.my_view_tt = Link("View My Time-Track", "link", "view tt interface")
        self.lock_tt = Link("Lock Time-Track", "link text", "lock tt page")
        self.approve_tt = Link("Approve Time-Track", "link", "approve tt interface")
        self.tasks = Button("container_tasks", "id", "Tasks menu")
        self.reports = Button("container_reports", "id", "Reports menu")
        self.user_list = Button("container_users", "id", "Users menu")
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
        self.close_contact_support = Button('supportPopupCloseButton', 'id', 'close contact support')
        self.submit_support = Button("contactSupportPopup_submitButton", "id", "Send to support button")
        self.phone_number = TextField("phoneInput_support", "id", "Phone number field")
        self.request_a_call = Button("sendPhoneButton_support", "id", "Phone number field")
        self.switch_product = Button("//div[@class='productName']", "xpath", "Product switcher")

        # actiPlans
        self.ap_leaves_management = Button("container_corporate_schedule", "id", "leaves management tab")
        self.ap_reports = Button("container_reports", "id", "Reports tab")
        self.ap_users = Button("container_employees", "id", "Users Tab")
        self.my_schedule = Button('container_my_schedule', 'id', 'my schedule tab')

        # Settings pt.2
        self.leave_types_button = Link("Leave Types", "link text", "leave types button")
        self.work_schedule_button = Link("Corporate Work Schedule", "link text", "work schedule button")
        self.corp_work_schedule_button = Link("Corporate Work Schedule", "link text", "corporate work schedule button")
        self.notifications_button = Link("Notifications", "link text", "notifications button")
        self.logo_color_scheme_button = Link("Logo & Color Scheme", "link text", "logo & color scheme button")
        self.ap_work_schedule_button = Link("Corporate Work Schedule", "link text", "work schedule button")
        self.ap_notifications_button = Link("Email Notifications", "link text", "notifications button")
