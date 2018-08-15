from features.utility.element import *


class UserListPage:

    def __init__(self):
        self.users_button = Button("//*[@class='content users']", "xpath", "users page button")
        self.new_user_button = Button("//*[@class='components_button  withPlusIcon' and text()='  New User']", "xpath",
                                      "'+new user' button")
        self.first_name_field = TextField("createUserPanel_firstNameField", "id", "first name field")
        self.last_name_field = TextField("createUserPanel_lastNameField", "id", "last name field")
        self.email_field = TextField("createUserPanel_emailField", "id", "email field")
        self.save_send_invitation_button = Button(
            "//*[@class='components_button submitBtn' and text()='  Save & Send Invitation']", "xpath",
            "save & send invitation button")
        self.close_add_user_panel = Button("//*[@class='closeLink']/span", "xpath", "close button")
        self.new_test_user = Button("//*[@class='userNameSpan' and text()='TestLastName, TestName']", "xpath",
                                    "test user")
        self.user_cruz_gordman = Button("//*[@class='userNameSpan' and text()='Cruz, Gordman']", "xpath",
                                        "user Cruz Gordman")
        self.edit_first_name_field = TextField("editUserPanel_firstNameField", "id", "edit first name field")
        self.edit_last_name_field = TextField("editUserPanel_lastNameField", "id", "edit last name field")
        self.edit_username_field = TextField("editUserPanel_usernameField", "id", "user name field")
        self.close_panel_button = Button("//*[@class='hideButton_panelContainer']", "xpath", "close panel button")
        self.edited_cruz_gordman = Button("//*[@class='userNameSpan' and text()='Cruz123, Gordman123']", "xpath",
                                          "user Cruz123 Gordman123")
        self.user_test_delete = Button("//*[@class='userNameSpan' and text()='TestDelLastName, TestDelName']", "xpath",
                                       "user TestDelLastName, TestDelName")
        self.delete_user_button = Button("//*[@class='action' and text()='DELETE']", "xpath", "delete user button")
        self.manage_groups_selector = Button(
            "//*[@class='userList_manageButtons_component_manageGroupsButton bothGroups']", "xpath",
            "manage groups selector")
        self.time_zone_groups_in_selector = Button(
            "//*[@class='userList_manageButtons_component_groupItem timeZoneGroup option']", "xpath",
            "Time Zone Groups")
        self.time_zone_search_field = TextField(
            "//*[@id='timeZoneGroupManagementLightBox_addGroupSelectorId']//input[@class='timeZonesSearchField']",
            "xpath", "time zone search field")
        self.add_time_zone_button = Button("timeZoneGroupManagementLightBox_addGroupButton", "id",
                                           "add time zone button")
        self.Washington = Button("//*[@class='highlighted' and text()='Washington']", "xpath",
                                 "Washington in city selector")
        self.Dallas = Button("//*[@class='highlighted' and text()='Dallas']", "xpath", "Dallas in city selector")
        self.Washington_time_zone_group = TextField("//*[@class='cityName' and text()='Washington']", "xpath",
                                                    "Washington time zone")
        self.Dallas_time_zone_group = TextField("//*[@class='cityName' and text()='Dallas']", "xpath",
                                                "Dallas time zone")
        self.delete_Dallas_button = Button(
            "//*[@class='cityName' and text()='Dallas']/../../../..//*[@class='deleteGroupCell']", "xpath",
            "delete Dallas time zone button")
        self.London_time_zone_group = Button("//*[@id='timeZoneGroupManagementLightBox_userGroupNameCell_2']/div/div",
                                             "xpath", "London time zone group")
        self.London_time_zone_name_field = TextField("timeZoneGroupManagementLightBox_editUserGroupInput_2", "id",
                                                     "London time zone name field")
        self.accept_edit_London_tzg_button = Button("timeZoneGroupManagementLightBox_editUserGroupAcceptButton_2", "id",
                                                    "accept button for editing London time zone name")
        self.select_all_button = Button("timeZoneGroupManagementLightBox_selectAllButtonImg", "id", "select all button")
        self.move_to_button = Button("//*[@class='x-btn-text' and text()='Move To']", "xpath", "move to selector button")
        self.default_time_zone_in_selector = Button(
            "//*[@class='x-menu-item' and text()[contains(., '(default group)')]]", "xpath",
            "default time zone in 'move to' selector")
        self.Sydney_office_group = Button("timeZoneGroupManagementLightBox_userGroupNameCell_3", "id",
                                          "Sydney office group")
        self.confirm_delete_group_button = Button("//*[@class='userGroupDiv deleteConfirm']//*/button",
                                                  "xpath", "confirm delete group button")
