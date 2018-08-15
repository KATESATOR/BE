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
        self.delete_user_button = Button("//*[@class='action' and text()='DELETE']", "xpath", "delete user button")
        self.manage_groups_selector = Button(
            "//*[@class='userList_manageButtons_component_manageGroupsButton bothGroups']", "xpath",
            "manage groups button")
        self.time_zone_groups_in_selector = Button(
            "//*[@class='userList_manageButtons_component_groupItem timeZoneGroup option']", "xpath",
            "Time Zone Groups")
        self.time_zone_search_field = TextField("//*[@class='bottomRow']//*[@class='timeZonesSearchField']", "xpath",
                                                "time zone search field")
        self.add_time_zone_button = Button("timeZoneGroupManagementLightBox_addGroupButton", "id",
                                           "add time zone button")
        self.first_city_in_selector = Button("span.highlighted", "css", "first city in city selector")
        self.Washington_time_zone_group = TextField("//*[@title='Washington']", "xpath", "Washington time zone")
        self.delete_Washington_button = Button("//*[@title='Washington']/../../..//*[@class='deleteGroupCell']",
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
        self.default_time_zone_in_selector = Button(
            "//*[@class='x-menu-item' and text()[contains(., '(default group)')]]", "xpath",
            "default time zone in 'move to' selector")
        self.Sydney_office_group = Button("timeZoneGroupManagementLightBox_userGroupNameCell_3", "id",
                                          "Sydney office group")
        self.confirm_delete_group_button = Button("//*[@class='userGroupDiv deleteConfirm']//*/button",
                                                  "xpath", "confirm delete group button")
        self.departments_in_selector = Button(
            "//*[@class='userList_manageButtons_component_groupItem department option']", "xpath",
            "departments in selector")
        self.new_dept_textfield = TextField("groupManagementLightBox_newGroupInput", "id", "new department textfield")
        self.add_new_dept_button = Button("groupManagementLightBox_addGroupButton", "id", "add new department button")
        self.test_dept = Button("//*[contains(@title, 'Test Dept')]", "xpath", "test dept department")
        self.administration_dept = Button("div#groupManagementLightBox_groupContainer>div:nth-of-type(2)", "css",
                                          "administration department")
        self.select_all_button_depts = Button("//*[@id='groupManagementLightBox_selectAllButtonImg']", "xpath",
                                              "select all users in department")
        self.first_in_depts_move_to_selector = Button("ul.x-menu-list>li:first-of-type", "css",
                                                      "first element in 'move to' department selector")
        self.delete_test_dept_button = Button(
            "//*[contains(@title, 'Test Dept')]/../../..//*[@class='deleteGroupCell']", "xpath",
            "delete test dept button")
        self.bulk_invitations_button = Button("//*[@class='components_button addSeveralUsersButton']", "xpath",
                                              "bulk invitation button")
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
        self.stivers_melanie = Button("//*[@class='userNameSpan' and contains(text(), 'Stivers, Melanie')]", "xpath",
                                      "Stivers Melanie")
        self.permissions_tab = Button("div.permissionsTab", "css", "permissions tab")
        self.access_to_users = Button("div.teamScopeCellContainer div.label", "css", "access to users")
        self.access_to_all_users = Button("//*[text()='Has Access to All Users']", "xpath", "has access to all users")
        self.access_to_users_back_button = Button("div.content div.teamAssignmentsPanel div.backButton", "css",
                                                  "access to users back button")
        self.tasks_counter_scope = Button(
            "#editUserPanel div.components_cptCounter.hierarchyClass_task.paleCounter>div", "css",
            "tasks counter in access to scope of work")
        self.revoke_access_to_scope = Button("div.editManagementAssignmentsPanel div.revokeButton", "css",
                                             "revoke all access to scope")
        self.access_to_scope_label = Button(
            "#editUserPanel div.userPanelScopeCellContainer:last-of-type>div>div .label", "css",
            "access to scope of work label")
        self.no_access_to_scope = Button("div.editManagementAssignmentsPanel div.noAccessSection.sectionRow", "css",
                                         "no access to scope")
        self.access_to_scope_back_button = Button(
            "div.editManagementAssignmentsPanel div.managementAssignmentsPanel div.backButton", "css",
            "access to scope back button")
        self.first_username_in_list = Button("tbody>tr:first-of-type .userNameCell.first span.userNameSpan", "css",
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
        self.stivers_in_selector = CheckBox("//*[@class='ellipsisLabel' and text()='Stivers, Melanie']", "xpath",
                                            "Stivers in user selector")
        self.apply_button_user_filter = Button(
            "#usersManagementBodyTagId>:last-of-type .x-btn.greyButton.close-button:not(.cancel-button)", "css",
            "apply button in user filter")
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
        self.work__assignments_tab = Button("//*[@class='components_tabButton' and text()='Work Assignments']", "xpath",
                                            "work assignments tab")
        self.first_username_in_wa_tab = Button(
            ".userList_workAssignmentsTableContainer tbody>tr:first-of-type .userNameCell.first span.userNameSpan",
            "css", "first username in work assigments tab")
        self.first_row_in_wa_tab_projects_counter = Button(
            ".tableBody>.userListRow:first-of-type .projects .counterText", "css",
            "projects counter work assignments tab first row")
        self.sorting_by_users_in_wa = Button(
            ".userListTable.userList_workAssignmentsTable .sortLinks>div:first-of-type", "css",
            "sorting by users in wa tab")
        self.edit_assignments_button = Button("//*[text()='Edit Assignments']", "xpath", "edit assignments button")
        self.last_cust_in_wa_panel = Button(
            ".userManagement_slidingPanel .loadingContainer:last-of-type:not(.entitiesListLoadingWrapper)", "css",
            "last customer in wa panel")
        self.first_project_cust_wa_panel = Button(
            ".entitiesList:nth-of-type(2)>div:first-child>div:first-of-type .checkboxPlaceholder label", "css",
            "first project in customer in wa panel")
        self.close_edit_wa_button = Button(
            ".userManagement_slidingPanel.userManagement_workAssignmentsEditorPanel .hideButton_panelContainer", "css",
            "close wa panel button")
        self.close_wa_button = Button(
            ".workAssignment_panel.components_panelContainer .hideButton_panelContainer", "css",
            "close wa panel button")