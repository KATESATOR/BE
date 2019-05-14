from features.utility.element import *


class Users:

    def __init__(self):
        # Create/edit user
        self.users = Button("//a[@class='content employees']", "XPATH", "Users Tab")
        self.user_list_title = Element("//div[@id='title']", "XPATH", "User List Title")
        self.add_users = Button("div#tabsPanel span.buttonIcon", "CSS", "Add Users")
        self.new_user_profile = Button("//div[contains(text(),'Configure new user profile')]", "XPATH",
                                       "Configure new user profile")
        self.first_name = TextField("//input[@id='userDataLightBox_firstNameField']", "XPATH", "First Name")
        self.last_name = TextField("input#userDataLightBox_lastNameField", "CSS", "Last Name")
        self.mid_name = TextField("input#userDataLightBox_middleNameField", "CSS", "Mid Name")
        self.email = TextField("input#userDataLightBox_emailField", "CSS", "Email")
        self.save_send_invitation = Button("div#userDataLightBox_commitBtn span", "CSS", "Save and send invitation")
        self.close_add_user_panel = Button("//div[@id='closeUserDataLightBoxBtn']", "XPATH", "Close add user panel")
        self.first_name_several = TextField(
            "div#inviteSeveralUsersLightBox_content tr.firstRow > td:nth-child(2) > input", "CSS", "First Name")
        self.first_name_several_2 = TextField(
            "div#inviteSeveralUsersLightBox_content tr:nth-child(2) > td:nth-child(2) > input", "CSS", "First name 2")
        self.last_name_several = TextField(
            "div#inviteSeveralUsersLightBox_content tr.firstRow > td:nth-child(3) > input", "CSS", "Last Name")
        self.last_name_several_2 = TextField(
            "div#inviteSeveralUsersLightBox_content tr:nth-child(2) > td:nth-child(3) > input", "CSS", "Last Name 2")
        self.email_several = TextField("div#inviteSeveralUsersLightBox_content tr.firstRow > td:nth-child(4) > input",
                                       "CSS", "Email")
        self.email_several_2 = TextField(
            "div#inviteSeveralUsersLightBox_content tr:nth-child(2) > td:nth-child(4) > input", "CSS", "Email 2")
        self.invite_several_users = Button("div.item.inviteSeveralUsersIcon > div", "CSS", "Invite several users")
        self.save_send_invitation_several = Button("//span[contains(text(),'Send Invitations')]", "XPATH",
                                                   "Save and send invitation")
        self.close_invite_several_users_panel = Button("//div[@id='closeInviteSeveralUsersLightBoxBtn']", "XPATH",
                                                       "Close add user panel")
        self.edit_user_panel = Button("table#userListTable tr:nth-child(1) > td.accountTab-user-td.firstCell >"
                                      " div.accountTab-userNameText-div > span.accountTab-userNameText-span", "CSS",
                                      "Edit 1st user")
        self.edit_user_panel_save_changes = Button("div#userDataLightBox_commitBtn", "CSS", "Save changes")
        self.edit_user_permission_leave_balance = Button("//tbody[contains(@class,'actualContent')]//tr[3]//td[19]",
                                                         "XPATH", "Leave perm")
        self.edit_user_permission_system = Button("//tbody[contains(@class,'actualContent')]//tr[3]//td[20]//div[1]",
                                                  "XPATH", "System perm")
        self.edit_user_permission_requests = Button("//tbody[contains(@class,'actualContent')]//tr[3]//td[21]//div[1]",
                                                    "XPATH")
        self.leave_balance_check = Button("//td[@class='accountTabCell tableButtonCell accountTab-manageBalance-td "
                                          "activeButton canManage']", "XPATH",
                                          "Balance check")
        self.system_check = Button("//td[contains(@class,'accountTabCell tableButtonCell accountTab-manageAccounts-td "
                                   "activeButton canManage')]", "XPATH", "System check")
        self.requests_check = Button("//td[contains(@class,'accountTabCell tableButtonCell "
                                     "accountTab-manageRequests-td activeButton canManage')]", "XPATH",
                                     "Requests check")
        self.delete_user = Button("button#userDataLightBox_deleteBtn", "CSS", "Delete user button")
        self.disable_wooster = Button("//tr[@class='userRow userIsLTM automaticallyApprovedUser enabledUser "
                                      "linkedNotNull even userWithDefaultWorkSchedule "
                                      "approverWithoutAssignedUsers']//td[@class='accountTabCell "
                                      "accountTab-accountState-td lastCell activeButton']",
                                      "XPATH", "Disable user wooster")
        self.enable_wooster = Button("*//span[@class='accountTab-accountStateText-span'][contains(text(),'Disabled')]",
                                     "XPATH", "Enable user wooster")

        # Filter
        self.filter = Button("span#ext-gen11", "CSS", "Filter on user list")
        self.filter_show_selected = Button("img#ext-gen190", "CSS", "Show Selected Users")
        self.filter_show_selected_departments = Button("label#ext-gen753", "CSS", "Show selected department")
        self.filter_show_selected_wo_departments = CheckBox("*//label[text()='Users Without Department']", "XPATH",
                                                            "Show users without departments")
        self.filter_apply = Button("//div[contains(@class,'x-btn')]//span[contains(text(), 'Apply')]", "XPATH", "Apply")
        self.filter_all_users = Button("//b[contains(text(),'Show All Users')]", "XPATH", "All users")
        self.shown_by = Selector("//select[@id='recordsPerPageSelector']", "XPATH", "Shown by")

        self.sort_by_user = Button("//span[contains(@class,'sortButton')][contains(text(),'User')]", "XPATH",
                                   "Sort by User")
        self.sort_by_group = Button("//span[contains(text(),'Group')]", "XPATH", "Sort by Group")
        self.sort_by_working_week = Button("//span[contains(text(),'Working Week')]", "XPATH", "Sort by Working Week")
        self.sort_by_account = Button("*//span[text()='Account']", "XPATH", "Sort by Account")
        self.show_disabled_accounts = CheckBox("//input[@id='userList_accountEnabledFilter']", "XPATH", "Show disabled")
        self.show_managers_only = CheckBox("//input[@id='userList_onlyManagersFilter']", "XPATH", "Show managers only")
        self.kloss_barbara_check = Button("//span[contains(text(),'Kloss, Barbara')]", "XPATH", "Womack Ashley check")

        # Departments
        self.departments = Button("//a[@class='editDepartmentsLink']", "XPATH", "Departments button")
        self.new_department = TextField("//input[@id='groupManagementLightBox_newGroupInput']", "XPATH",
                                        "New department")
        self.new_department_add = Button("//button[@id='groupManagementLightBox_addGroupButton']", "XPATH", "Add")
        self.created_department = Button("//div[contains(@title,'Active_department')]", "XPATH", "Created department")
        self.created_department_field = TextField("//td[contains(@class,'editGroupInput')]//input]", "XPATH",
                                                  "Created department field")
        self.delete_department = Button("//*[contains(@title, 'Active_department')]/following::td["
                                        "@class='deleteGroupCell']", "XPATH", "Delete department")
        self.confirm_delete = Button(".userGroupDiv.deleteConfirm button", "CSS",
                                     "Confirm delete dialog")

        # TZG
        self.tzg = Button("//a[@class='editTimeZoneGroupsLink']", "XPATH", "TZG button")
        self.tzg_field = Button("//div[contains(@class,'emptySelection')]", "XPATH", "New TZG")
        self.tzg_search_field = TextField("//div[@id='timeZoneGroupManagementLightBox_addGroupSelectorId']//input["
                                          "contains(@type,'text')]", "XPATH", "Search field")
        self.tzg_first_city_in_selector = Button("span.highlighted", "CSS", "First city in the selector")
        self.add_tzg = Button("//button[@id='timeZoneGroupManagementLightBox_addGroupButton']", "XPATH", "Add TZG")
        self.tzg_delete = Button("//*[@title='Atlanta']/following::td[@class='deleteGroupCell']", "XPATH", "Delete tzg")
        self.confirm_delete_tzg = Button("//*[@class='userGroupDiv deleteConfirm']//*/button", "XPATH", "Confirm "
                                                                                                        "delete tzg")
        self.city_check = TextField("//div[contains(@title,'Atlanta')]", "XPATH", "Checks Atlanta visible")

        # Pager
        self.pager_next = Button("//a[contains(@class,'next')]", "XPATH", "Right Arrow")
        self.pager_back = Button("//a[contains(@class,'prev')]", "XPATH", "Left Arrow")
        self.pager_records_selector = Selector("//select[@id='recordsPerPageSelector']", "XPATH", "Records selector")
        
        # PTO Settings
        self.pto_settings = Button("//span[contains(text(),'PTO Settings')]", "XPATH", "PTO settings button")
        self.pto_change_balance = Button("//tbody[contains(@class,'actualContent')]//tr[2]//td[2]", "XPATH", "Balance "
                                                                                                             "button")
        self.pto_balance_field = TextField("//span[contains(@class,'inHardValueMode')]//input[contains(@type,'text')]",
                                           "XPATH", "PTO balance field")
        self.pto_balance_apply = Button("//span[contains(@class,'defaultText')][contains(text(),'Apply')]", "XPATH",
                                        "Apply pto")
        self.pto_accrue_rules = Button("//td[contains(text(),'1.5d monthly')]", "XPATH", "Accrue rules")
        self.pto_max_limit = TextField("//input[@id='pto_capBalanceField']", "XPATH", "Max limit balance")
        self.pto_save_changes = Button("//div[24]//div[3]//div[1]//span[1]", "XPATH", "Save changes")
        self.pto_limit_check = TextField("//td[contains(text(),'811d')]", "XPATH", "Limit check")

        # Sick Settings
        self.sick_settings = Button("//span[@class='textTab'][contains(text(),'Sick Days Settings')]", "XPATH",
                                    "Sick settings button")
        self.sick_change_balance = Button("//span[contains(text(),'0.5d')]", "XPATH", "Sick balance button")
        self.sick_balance_field = TextField("//span[@class='inHardValueMode']//input[@type='text']", "XPATH",
                                            "Sick balance field")
        self.sick_balance_apply = Button("//button[@class='applyButton']", "XPATH", "Apply sick")
        self.sick_accrue_rules = Button("//td[contains(text(),'1.1d monthly')]", "XPATH", "Accrue rules")
        self.sick_max_limit = TextField("//input[@id='sick_capBalanceField']", "XPATH", "Max limit balance")
        self.sick_save_changes = Button("//div[25]//div[3]//div[1]//span[1]", "XPATH", "Save changes")
        self.sick_limit_check = TextField("//td[contains(text(),'812d')]", "XPATH", "Limit check")
        self.sick_robert_change_balance = Button("//span[contains(text(),'1.6d')]", "XPATH", "Sick balance button")
