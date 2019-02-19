from features.utility.element import *


class GeneralSettings:

    def __init__(self):
        self.gs_save = Button("div#FormModifiedDivButton", "CSS", "Save modifications")
        self.gs_naming_customer = Button("select#firstHierarchyLevelCodeSelect", "CSS", "Naming for Customer")
        self.gs_naming_customer_custom_name = Button("select#firstHierarchyLevelCodeSelect > option:nth-child(1)",
                                                     "CSS", "Customer custom name")
        self.gs_naming_customer_default_name = Button("select#firstHierarchyLevelCodeSelect > option:nth-child(3)",
                                                      "CSS", "Default customer name")
        self.gs_naming_customer_custom_name_singular = TextField("input[name='firstHierarchyLevelSingularForm']", "CSS",
                                                                 "Custom customer name field")
        self.gs_naming_customer_custom_name_plural = TextField("input[name='firstHierarchyLevelPluralForm']", "CSS",
                                                               "Custom customer name field")
        self.gs_naming_project = Button("select#secondHierarchyLevelCodeSelect", "CSS", "Naming for Project")
        self.gs_naming_project_name_job = Button("select#secondHierarchyLevelCodeSelect > option:nth-child(2)", "CSS",
                                                 "Naming: Job")
        self.gs_naming_project_default_name = Button("select#secondHierarchyLevelCodeSelect > option:nth-child(3)",
                                                     "CSS", "Default project name")
        self.gs_naming_task = Button("select#thirdHierarchyLevelCodeSelect", "CSS", "Naming for Task")
        self.gs_naming_task_name_subtask = Button("select#thirdHierarchyLevelCodeSelect > option:nth-child(3)", "CSS",
                                                  "Naming: Subtask")
        self.gs_naming_task_default_name = Button("select#thirdHierarchyLevelCodeSelect > option:nth-child(2)",
                                                  "CSS", "Default task name")
        self.gs_naming_user_groups = Button("select#userGroupNamingCodeSelect", "CSS", "Naming for User Groups")
        self.gs_naming_user_groups_name_location = Button("select#userGroupNamingCodeSelect > option:nth-child(4)",
                                                          "CSS", "Naming: Location")
        self.gs_naming_user_groups_default_name = Button("select#userGroupNamingCodeSelect > option:nth-child(2)",
                                                         "CSS", "Default user group name")
        self.gs_data_settings_calendar = Button("select#weekStartDaySelect", "CSS", "Calendar layout")
        self.gs_data_settings_calendar_sunday = Button("select#weekStartDaySelect > option:nth-child(1)", "CSS",
                                                       "Calendar starts on Sunday")
        self.gs_data_settings_calendar_default_name = Button("select#weekStartDaySelect > option:nth-child(2)", "CSS",
                                                             "Default calendar")
        self.gs_data_settings_tzg = TextField("div#tzSelector > input", "CSS", "Time Zone Group select")
        self.gs_data_settings_tzg_boston = Button(
            "div#citiesSearchContainerElementId div.row.active > div.divisionName > span:nth-child(1)", "CSS",
            "Boston Time Zone")
        self.gs_data_settings_tzg_new_york = Button(
            "div#citiesSearchContainerElementId div.row.active > div.divisionName > span:nth-child(1)", "CSS",
            "New York Time Zone")
        self.gs_work_schedule_hours_per_day_unlimited = Button("input#hoursPerDayLimited_Unlimited", "CSS", "Unlimited")
        self.gs_work_schedule_hours_per_day_limit = Button("input#hoursPerDayLimited_LimitTo", "CSS", "Limit to")
        self.gs_work_schedule_hours_per_day_unlimited_check = Element(
            "//tbody//input[@id='hoursPerDayLimited_Unlimited'][@checked='checked']", "CSS", "Checking limit to")
        self.gs_work_schedule = TextField("td#workdayDurationsEditorPlaceholder td.first > input[type='text']", "CSS",
                                          "Default work schedule")
        self.gs_pto_accrue = TextField("input#pto_accrueBalanceField", "CSS", "Pto accrue field")
        self.gs_sick_accrue = TextField("input#sick_accrueBalanceField", "CSS", "Sick accrue field")
        self.gs_overtime = Button("tr#ext-gen28 em", "CSS", "Ovetime selector")
        self.gs_dar_see_all_tt = CheckBox("div#accessToUserInfoSettingsBlock label:nth-child(1) > input", "CSS",
                                          "Allow selected users to see all tt")
        self.gs_dar_see_all_tt_selector = Button("//td[@class='middle-left-cell contents']", "xpath", "Selecting user")
        self.gs_dar_see_all_tt_selector_white_jane = Button("//span[contains(@title,'White, Jane')]", "xpath",
                                                         "Select White Jane")
        self.gs_dar_see_all_tt_selector_apply = Button("//span[contains(text(),'Apply')]", "xpath",
                                                       "Click on apply button")
        self.gs_dar_hide_tt_lock_tt = CheckBox("//*[@id='accessToUserInfoSettingsBlock']/div/div[3]/div[1]/div[1]/label/input", "xpath",
                                               "Hide tt details in locktt")
        self.gs_dar_hide_tt_from_managers = CheckBox("//*[@id='accessToUserInfoSettingsBlock']/div/div[4]/div[1]/div[1]/label/input",
            "XPATH", "Hide tt from managers")
        self.gs_dar_hide_not_assigned_users = CheckBox("//div[@class='darSetting hideAccountSetting']//input[@type='checkbox']",
                                                       "XPATH",
                                                       "Hide not assigned users in User List")
        self.gs_dar_allow_manager_modify_tt_users = CheckBox(
            "//div[@class='darSetting ttmCanManageAutoApprovedSetting']//input[@type='checkbox']",
            "XPATH", "Allow manager to modify tt of users for auto approval")
        self.gs_message_footer = TextField("textarea#mailMessageFooter", "CSS", "Message footer")
        self.gs_send_test_message = Button("input#sendTestMessage_button", "CSS", "Send Test Message")
        self.gs_page = Button("//form[@id='settingsForm']", "XPATH", "GS page")
