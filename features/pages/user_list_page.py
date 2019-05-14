from features.utility.element import *


class UserListPage:

    def __init__(self):
        # General
        self.new_user_button = Button("//*[@class='components_button  withPlusIcon' and text()='  New User']", "xpath",
                                      "'+new user' button")
        self.manage_groups_selector = Button(
            "//*[@class='userList_manageButtons_component_manageGroupsButton bothGroups']", "xpath",
            "manage groups button")
        self.time_zone_groups_in_selector = Button(
            "//*[@class='userList_manageButtons_component_groupItem timeZoneGroup option']", "xpath",
            "Time Zone Groups")
        self.departments_in_selector = Button(
            "//*[@class='userList_manageButtons_component_groupItem department option']", "xpath",
            "departments in selector")
        self.bulk_invitations_button = Button("//*[@class='components_button addSeveralUsersButton']", "xpath",
                                              "bulk invitation button")
        self.work_assignments_tab = Button("//*[@class='components_tabButton' and text()='Work Assignments']", "xpath",
                                           "work assignments tab")
        self.pto_tab = Button("//*[text()='PTO Settings']", "xpath", "pto settings tab")
        self.next_page = Button("#pager .next", "css", "next page button")
        self.previous_page = Button("#pager .prev", "css", "previous page button")
        self.sick_days_tab = Button("//*[text()='Sick Days Settings']", "xpath", "aick days settings tab")

        # Accounts & Permissions
        self.new_test_user = Button("//*[@class='userNameSpan' and text()='TestLastName, TestName']", "xpath",
                                    "test user")
        self.user_cruz_gordman = Button("//*[@class='userNameSpan' and text()='Cruz, Gordman']", "xpath",
                                        "user Cruz Gordman")
        self.stivers_melanie = Button("//*[@class='userNameSpan' and contains(text(), 'Stivers, Melanie')]", "xpath",
                                      "Stivers Melanie")
        self.sorting_by_users = Button(".userList_mainTableContainer .sortLinks>div:first-of-type", "css",
                                       "sorting by users button")
        self.sorting_by_group = Button(".userList_mainTableContainer .sortLinks>div:nth-of-type(2)", "css",
                                       "sorting by group button")
        self.sorting_by_tzg = Button(".userList_mainTableContainer .sortLinks>div:nth-of-type(3)", "css",
                                     "sorting by tzg button")
        self.management_filter = Button("//*[@class='userlist_managementFilter']", "xpath", "management filter button")
        self.users_wo_permissions_filter = Button("//*[text()=('Users without permissions')]", "xpath",
                                                  "users without permissions in filter")
        self.all_staff_filter = Button("//*[text()=('All staff')]", "xpath", "all staff in filter")
        self.first_username_in_list = Button(".userListRow:first-of-type span.userNameSpan", "css",
                                             "first username in user list")
        self.first_group_in_list = Button("tbody>tr:first-of-type .userNameCell.first .groupName", "css",
                                          "first department in list")
        self.first_tzg_in_list = Button("tbody>tr:first-of-type .userNameCell.first .timeZoneGroupName", "css",
                                        "first time zone group in list")
        self.user_filter_button = Button("td.userList_mainTableContainer .ellipsis", "css", "user filter button")
        self.selected_users_in_selector = Button(
            "#usersManagementBodyTagId>div:last-of-type .x-table-layout-cell.custom div.x-form-radio-wrap-inner", "css",
            "selected users in user selector")
        self.all_users_in_selector = Button(
            "#usersManagementBodyTagId>div:last-of-type .x-table-layout-cell.generic>div>div>div", "css",
            "all users in users selector")
        self.cruz_in_selector = CheckBox("//*[@class='ellipsisLabel' and text()='Cruz, Gordman']", "xpath",
                                         "Stivers in user selector")
        self.apply_button_user_filter = Button(
            "#usersManagementBodyTagId>:last-of-type .x-btn.greyButton.close-button:not(.cancel-button)", "css",
            "apply button in user filter")
        self.search_button = Button("#userListTableHeader .userList_wordsFilter", "css", "search button")
        self.search_field = TextField("#userListTableHeader .userList_wordsFilter input", "css", "search field")
        self.close_search_button = Button("#userListTableHeader .userList_wordsFilter .close", "css", "close search")
        self.first_search_result = Button("tbody>tr:first-of-type .userNameCell.first span.userNameSpan span", "css",
                                          "first search result username in user list")
        self.last_username_in_list = Button(".userListRow:last-of-type span.userNameSpan", "css",
                                            "last username in list")
        self.inactive_user = Element("//*[@class='userListRow disabled linkedNotNull']", "xpath",
                                     "first user is inactive")

        # Create User
        self.first_name_field = TextField("createUserPanel_firstNameField", "id", "first name field")
        self.last_name_field = TextField("createUserPanel_lastNameField", "id", "last name field")
        self.middle_name_field = TextField("createUserPanel_middleNameField", "id", "middle name field")
        self.email_field = TextField("createUserPanel_emailField", "id", "email field")
        self.save_send_invitation_button = Button("//*[text()='  Save & Send Invitation']", "xpath",
                                                  "save & send invitation button")
        self.close_add_user_panel = Button("//*[@class='closeLink']/span", "xpath", "close button")

        # Edit User
        self.edit_first_name_field = TextField("editUserPanel_firstNameField", "id", "edit first name field")
        self.edit_middle_name_field = TextField("editUserPanel_middleNameField", "id", "edit middle name field")
        self.edit_last_name_field = TextField("editUserPanel_lastNameField", "id", "edit last name field")
        self.edit_username_field = TextField("editUserPanel_usernameField", "id", "user name field")
        self.close_panel_button = Button("//*[@class='hideButton_panelContainer']", "xpath", "close panel button")
        self.delete_user_button = Button("//*[@class='action' and text()='DELETE']", "xpath", "delete user button")
        self.modifications_warning = Button("//*[@class='content_modalAlert']/div[3]/div", "xpath",
                                            "submit modifications warning")
        self.access_to_actitime = Button("editUserPanel_accessSelectorPlaceholder", "id", "Access switcher")
        self.permissions_tab = Button(".permissionsTab", "css", "permissions tab")
        self.access_to_users = Button(".teamScopeCellContainer .label", "css", "access to users")
        self.access_to_scope = Button("#editUserPanel .manageScopeCellContainer", "css", "access to scope of work box")
        self.access_to_scope_label = Button("#editUserPanel .manageScopeCellContainer .label", "css",
                                            "access to scope of work label")
        self.settingsat_user = Button("//span[contains(text(),'Manage System Settings aT, Role')]", "xpath",
                                      "setttingsat user panel")
        self.ma_permission = Button("//div[@class='blockContent']//div[@class='userPanel_permissionRow "
                                    "inactive']//div[@class='name'][contains(text(),'Manage Accounts & "
                                    "Permissions')]", "xpath", "MA permission")

        # Access to Users
        self.access_to_all_users = Button("//*[text()='Has Access to All Users']", "xpath", "has access to all users")
        self.custom_access_to_users = Button("//*[text()='Has Access to Selected Users']", "xpath",
                                             "custom access to users")
        self.access_to_users_back_button = Button(".content .teamAssignmentsPanel .backButton", "css",
                                                  "access to users back button")

        # Access to Scope of Work
        self.revoke_access_to_scope = Button("div.managementAssignmentsPanel div.revokeButton", "css",
                                             "revoke all access to scope")
        self.no_access_to_scope = Button("//*[text()='No Access to Scope of Work']", "css",
                                         "no access to scope of work")
        self.custom_access_to_scope = Button("//*[text()='Has Access to Selected:']", "css",
                                             "custom access to scope of work")
        self.access_to_scope_back_button = Button(
            "#usersManagementBodyTagId div.managementAssignmentsPanel div:contains('Back to Permissions')",
            "css",
            "access to scope back button")
        self.tasks_counter_scope = Button("#editUserPanel .components_cptCounter.hierarchyClass_task>div", "css",
                                          "tasks counter in access to scope of work")

        # TimeZoneGroups pop-up
        self.time_zone_search_field = TextField("//*[@class='bottomRow']//*[@class='timeZonesSearchField']", "xpath",
                                                "time zone search field")
        self.add_time_zone_button = Button("timeZoneGroupManagementLightBox_addGroupButton", "id",
                                           "add time zone button")
        self.first_city_in_selector = Button("span.highlighted", "css", "first city in city selector")
        self.Washington_time_zone_group = TextField("//*[@title='Washington']", "xpath", "Washington time zone")
        self.delete_Washington_button = Button("//*[@title='Washington']/following::td[@class='deleteGroupCell']",
                                               "xpath", "delete Washington time zone button")
        self.London_time_zone_group = Button("//*[@id='timeZoneGroupManagementLightBox_userGroupNameCell_2']/div/div",
                                             "xpath", "London time zone group")
        self.London_time_zone_name_field = TextField("timeZoneGroupManagementLightBox_editUserGroupInput_2", "id",
                                                     "London time zone name field")
        self.accept_edit_London_tzg_button = Button("timeZoneGroupManagementLightBox_editUserGroupAcceptButton_2", "id",
                                                    "accept button for editing London time zone name")
        self.select_all_button_tzg = Button("timeZoneGroupManagementLightBox_selectAllButtonImg", "id",
                                            "select all users in time zone")
        self.move_to_button = Button("//*[@class='x-btn-text' and text()='Move To']", "xpath",
                                     "move to selector button")
        self.default_tzg_in_selector = Button("//*[@class='x-menu-item' and contains (text(), '(default group)')]",
                                              "xpath", "default time zone in 'move to' selector")
        self.sydney_tzg_in_selector = Button("//*[@class='x-menu-item' and contains (text(), 'Sydney Office')]",
                                             "xpath", "Sydney office in selector")
        self.Sydney_office_group = Button("timeZoneGroupManagementLightBox_userGroupNameCell_3", "id",
                                          "Sydney office group")
        self.first_tzg_in_group_list = Button(
            "#timeZoneGroupManagementLightBox_groupContainer>div:first-of-type .secondRow", "css",
            "first tzg in manage pop-up")
        self.confirm_delete_group_button = Button("//*[@class='userGroupDiv deleteConfirm']//*/button",
                                                  "xpath", "confirm delete group button")

        # Departments pop-up
        self.new_dept_textfield = TextField("groupManagementLightBox_newGroupInput", "id", "new department textfield")
        self.add_new_dept_button = Button("groupManagementLightBox_addGroupButton", "id", "add new department button")
        self.test_dept = Button("//*[contains(@title, 'Test Dept')]", "xpath", "test dept department")
        self.administration_dept = Button("div[title^='Administration']", "css", "administration department")
        self.users_wo_dept = Button("div[title^='Users Without Department']", "css", "users without department")
        self.select_all_button_depts = Button("#groupManagementLightBox .toolbar_selectAll", "css",
                                              "select all users in department")
        self.first_in_depts_move_to_selector = Button("ul.x-menu-list>li:first-of-type", "css",
                                                      "first element in 'move to' department selector")
        self.delete_test_dept_button = Button(
            "//*[contains(@title, 'Test Dept')]/following::td[@class='deleteGroupCell']", "xpath",
            "delete test dept button")

        # Bulk Invitations pop-up
        self.bulk_first_name_field1 = TextField("tr.firstRow>td:nth-of-type(2) input", "css", "first name field1 bulk")
        self.bulk_last_name_field1 = TextField("tr.firstRow>td:nth-of-type(3) input", "css", "last name field1 bulk")
        self.bulk_email_field1 = TextField("tr.firstRow>td:nth-of-type(4) input", "css", "email field1 bulk")
        self.bulk_first_name_field2 = TextField("div.tableContainer tr:nth-of-type(2)>td:nth-of-type(2) input", "css",
                                                "first name field1 bulk")
        self.bulk_last_name_field2 = TextField("div.tableContainer tr:nth-of-type(2)>td:nth-of-type(3) input", "css",
                                               "last name field1 bulk")
        self.bulk_email_field2 = TextField("div.tableContainer tr:nth-of-type(2)>td:nth-of-type(4) input", "css",
                                           "email field1 bulk")
        self.send_invitations_button = Button("//*[@class='buttonTitle' and contains(text(), 'Send Invitations')]",
                                              "xpath", "send invitations button")
        self.user1 = Button("//*[@class='userNameSpan' and contains(text(), 'user1, user1')]", "xpath", "user1")
        self.user2 = Button("//*[@class='userNameSpan' and contains(text(), 'user2, user2')]", "xpath", "user2")
        self.close_bulk_button = Button("div.accountCreatedContainer div.closeLink span", "css",
                                        "close bulk pop-up button")

        # Work Assignments
        self.first_username_in_wa_tab = Button(
            ".userList_workAssignmentsTableContainer tbody>tr:first-of-type .userNameCell.first span.userNameSpan",
            "css", "first username in work assigments tab")
        self.first_row_in_wa_tab_projects_counter = Button(".userListRow:first-of-type .projects .counterText", "css",
                                                           "projects counter work assignments tab first row")
        self.edit_assignments_button = Button("//*[text()='Edit Assignments']", "xpath", "edit assignments button")
        self.our_company_in_wa_panel = Button(
            "//div[@class='entitiesList']//div[@class='name' and text()='Our Company']",
            "xpath", "our company customer in WA panel")
        self.first_project_in_wa_panel = Button(
            "//div[@class='entityListItem hierarchyClass_project']//div[@class='checkboxPlaceholder']",
            "xpath", "first project in customer in wa panel")
        self.close_edit_wa_button = Button(
            ".userManagement_slidingPanel.userManagement_workAssignmentsEditorPanel .hideButton_panelContainer", "css",
            "close edit wa panel button")
        self.close_wa_button = Button(".workAssignment_panel .hideButton_panelContainer", "css",
                                      "close wa panel button")
        self.administration_proj_del = Button("//*[@class='title' and text()='Administration']//../div[3]", "xpath",
                                              "administration project delete button")
        self.search_in_wa = Button("th.controlsPlaceholder.userName.secondLayer div.wordsFilter", "css",
                                   "search in WA button")
        self.search_wa_field = TextField("div.inputPlaceholder.animShowWordsField.active > input", "css",
                                         "search WA field")

        # PTO Settings
        self.kloss_pto_control_switcher = Button(
            "//*[text()='Kloss, Barbara']/following::div[contains(@class,'components_switcher')][1]", "xpath",
            "Barbara Kloss pto control switcher")

        self.kloss_pto_balance_cell = Button(
            "//*[text()='Kloss, Barbara']/following::td[contains(@class,'currentBalance')][1]", "xpath",
            "Barbara Kloss PTO balance cell")
        self.balance_field = TextField("input.hardValueField", "css", "balance hard value field")
        self.balance_edit_apply_button = Button(".applyButton>span.defaultText", "css", "balance edit apply button")
        self.kloss_pto_rules_cell = Button("//*[text()='Kloss, Barbara']/following::td[@class='ptoRulesCell resetRule'"
                                           " or @class='ptoRulesCell defaultRules defaultRule'][1]", "xpath",
                                           "Barbara Kloss pto rules cell")
        self.kloss_pto_rules_reset = Button(
            "//*[text()='Kloss, Barbara']/following::td[@class='ptoRulesCell resetRule'][1]", "xpath",
            "Barbara Kloss pto rules reset cell")
        self.kloss_pto_rules_accrue = Button(
            "//*[text()='Kloss, Barbara']/following::td[@class='ptoRulesCell accrualRule'][1]", "xpath",
            "Barbara Kloss pto rules accrue cell")
        self.kloss_pto_rules_limit = Button(
            "//*[text()='Kloss, Barbara']/following::td[@class='ptoRulesCell capRule'][1]", "xpath",
            "Barbara Kloss pto rules limit cell")
        self.default_pto_switcher = Button("#pto_balanceRulesEditorDialog #defaultSwitcher", "css",
                                           "default pto switcher")
        self.save_pto_rules_button = Button(
            "//*[@id='pto_balanceRulesEditorDialog']/following::div[@class='greyButton saveButton']/span[1]", "xpath",
            "pto rules save button")
        self.kloss_default_pto_rules = Button(
            "//*[text()='Kloss, Barbara']/following::td[text()='Default PTO Rules'][1]", "xpath",
            "Barbara Kloss default pto rules cell")
        self.custom_pto_switcher = Button("#pto_balanceRulesEditorDialog #customSwitcher", "css",
                                          "custom pto switcher")
        self.reset_pto_checkbox = Button("pto_resetRuleLabel", "id", "reset pto rule checkbox")
        self.reset_pto_field = TextField("pto_resetBalanceField", "id", "reset pto field")
        self.accrue_pto_field = TextField("pto_accrueBalanceField", "id", "accrue pto field")
        self.limit_pto_field = TextField("pto_capBalanceField", "id", "limit pto field")

        # Sick Days Settings
        self.kloss_sd_control_switcher = Button(
            "//*[text()='Kloss, Barbara']/following::div[contains(@class,'components_switcher')][2]", "xpath",
            "Barbara Kloss sick days control switcher")
        self.kloss_sd_balance_cell = Button(
            "//*[text()='Kloss, Barbara']/following::td[contains(@class,'currentBalance')][2]", "xpath",
            "Barbara Kloss sick days balance cell")
        self.reset_sd_checkbox = Button("sick_resetRuleLabel", "id", "reset sick days rule checkbox")
        self.reset_sd_field = TextField("sick_resetBalanceField", "id", "reset sick days field")
        self.accrue_sd_field = TextField("sick_accrueBalanceField", "id", "accrue sick days field")
        self.limit_sd_field = TextField("sick_capBalanceField", "id", "limit sick days field")
        self.kloss_sd_rules_cell = Button(
            "//*[text()='Kloss, Barbara']/following::td[@class='sickDaysRulesCell resetRule' "
            "or @class='sickDaysRulesCell defaultRules defaultRule'][1]", "xpath", "Barbara Kloss sick days rules cell")
        self.custom_sd_switcher = Button("#sick_balanceRulesEditorDialog #customSwitcher", "css",
                                         "custom sick days switcher")
        self.default_sd_switcher = Button("#sick_balanceRulesEditorDialog #defaultSwitcher", "css",
                                          "default sick days switcher")
        self.save_sd_rules_button = Button(
            "//*[@id='sick_balanceRulesEditorDialog']/following::div[@class='greyButton saveButton']/span[1]", "xpath",
            "sick days rules save button")
        self.kloss_sd_rules_reset = Button(
            "//*[text()='Kloss, Barbara']/following::td[@class='sickDaysRulesCell resetRule'][1]", "xpath",
            "Barbara Kloss sick days rules reset cell")
        self.kloss_sd_rules_accrue = Button(
            "//*[text()='Kloss, Barbara']/following::td[@class='sickDaysRulesCell accrualRule'][1]", "xpath",
            "Barbara Kloss sick days rules accrue cell")
        self.kloss_sd_rules_limit = Button(
            "//*[text()='Kloss, Barbara']/following::td[@class='sickDaysRulesCell capRule'][1]", "xpath",
            "Barbara Kloss sick days rules limit cell")
        self.kloss_default_sd_rules = Button(
            "//*[text()='Kloss, Barbara']/following::td[text()='Default Sick Days Rules'][1]", "xpath",
            "Barbara Kloss default sick days rules cell")
        self.sorting_by_current_pto = Button("#sortByPTOLink .sortLink", "css", "sorting by current pto")
        self.sorting_by_reported_pto = Button("#sortByApprovedPTO .sortLink", "css", "sorting by reported pto")
        self.first_current_pto_cell = Button("tbody>tr:first-of-type .currentBalanceCell.ptoCell", "css",
                                             "first current pto cell in list")
        self.first_reported_pto_cell = Button("tbody>tr:first-of-type .ptoCell.plannedLeaveCell", "css",
                                              "first reported pto cell in list")
        self.sorting_by_current_sd = Button("#sortBySickLink .sortLink", "css", "sorting by current sick days")
        self.sorting_by_reported_sd = Button("#sortByApprovedSick .sortLink", "css", "sorting by reported sick days")
        self.first_current_sd_cell = Button("tbody>tr:first-of-type .currentBalanceCell.sickDaysCell", "css",
                                            "first current sick days cell in list")
        self.first_reported_sd_cell = Button("tbody>tr:first-of-type .sickDaysCell.plannedLeaveCell", "css",
                                             "first reported sick days cell in list")