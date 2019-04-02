from features.utility.element import *


class ApGeneralSettingsPage:
    def __init__(self):
        self.save_button_bottom = Button("saveSettingsButton", "id", "Save Button on bottom")
        self.save_button_top = Button("FormModifiedDivButton", "id", "Save Button on top")
        self.save_message_success_text = Element("SuccessMessages", "id", "Save message success")

        # User Groups
        self.user_groups_header_block = Element("userGroupsSettingsHeaderBlock", "id", "User Groups header block")
        self.user_groups_settings_block = Element("userGroupsSettingsBlock", "id", "User Groups settings block")
        self.user_group_switcher = Button("//*[@id='userGroupsSwitcher']/img", "xpath", "User Group switcher")
        self.user_group_switcher_value = Element("//*[@id='userGroupsSwitcher']/../input", "xpath",
                                                 "User Group switcher value")
        self.user_group_naming_selector = Selector("userGroupNamingCodeSelect", "id", "Name user groups as")

        # Time Zone & Calendar Settings
        self.tz_groups_settings_block = Element("dateTimeSettingsBlock", "id", "Time Zone Groups settings block")
        self.tz_group_switcher = Button("//*[@id='tzGroupSwitcher']/img", "xpath", "Time Zone Group switcher")
        self.tz_group_switcher_value = Element("//*[@id='tzGroupSwitcher']/../input", "xpath",
                                               "Time Zone Group switcher value")
        self.tz_group_selector_textfield = TextField("//*[@id='tzSelector']/input", "xpath", "Time Zone Group selector")
        self.tz_group_search_container = Element("citiesSearchContainerElementId", "id",
                                                 "Time Zone Groups Search Result Container")
        self.tz_group_search_first_cell = Button("//*[@id='citiesSearchContainerElementId']//div[1]",
                                                 "xpath", "First Cell")
        self.tz_group_name_field = TextField("defaultTZGroupNameId", "id", "Time Zone Group name field")
        self.tz_group_week_start_day_selector = Selector("weekStartDaySelect", "id", "Week start day")

        # PTO & Sick Days Balances
        self.pto_and_sick_settings_block = Element("ptoAndSickBlockSection", "id", "PTO & Sick Days Balances block")
        self.pto_switcher = Button("//*[@id='ptoSwitcher']/img", "xpath", "PTO Switcher")
        self.pto_switcher_value = Element("//*[@id='ptoSwitcher']/../input", "xpath", "PTO Switcher value")
        self.pto_show_in_days_radiobutton = Button("ptoShowInDays", "id", "Show PTO in Days")
        self.pto_show_in_hours_radiobutton = Button("ptoShowInHours", "id", "Show PTO in Hours")
        self.pto_round_balance_checkbox = Button("ptoRoundBalanceOnUserlistId", "id", "Round PTO Balance checkbox")
        # Rules for PTO
        self.pto_rule_reset_balance_checkbox = Button("pto_resetRuleCheckbox", "id", "Reset PTO rule checkbox")
        self.pto_rule_reset_balance_textfield = TextField("pto_resetBalanceField", "id", "Reset PTO rule textfield")
        self.pto_rule_accrue_balance_checkbox = Button("pto_accrueRuleCheckbox", "id", "Accrue PTO rule checkbox")
        self.pto_rule_accrue_balance_textfield = TextField("pto_accrueBalanceField", "id", "Accrue Pto rule textfield")
        self.pto_rule_cap_balance_checkbox = Button("pto_capRuleCheckbox", "id", "Limit maximum PTO rule checkbox")
        self.pto_rule_cap_balance_textfield = TextField("pto_capBalanceField", "id", "Limit maximum PTO rule textfield")
        self.pto_default_control_mode_checkbox = Button("ptoUserEnabledId", "id",
                                                        "Automatically turn on PTO "
                                                        "balance control for the new users checkbox")

        self.sick_switcher = Button("//*[@id='sickSwitcher']/img", "xpath", "Sick Balance Switcher")
        self.sick_switcher_value = Button("//*[@id='sickSwitcher']/../input", "xpath", "Sick Balance Switcher value")

        self.sick_show_in_days_radiobutton = Button("sickShowInDays", "id", "Show Sick Balance in Days")
        self.sick_show_in_hours_radiobutton = Button("sickShowInHours", "id", "Show Sick Balance in Hours")
        self.sick_round_balance_checkbox = Button("sickRoundBalanceOnUserlistId", "id", "Round Sick Balance checkbox")
        # Rules for Sick Balance
        self.sick_rule_reset_balance_checkbox = Button("sick_resetRuleCheckbox", "id",
                                                       "Reset Sick Balance rule checkbox")
        self.sick_rule_reset_balance_textfield = TextField("sick_resetBalanceField", "id",
                                                           "Reset Sick Balance rule textfield")
        self.sick_rule_accrue_balance_checkbox = Button("sick_accrueRuleCheckbox", "id",
                                                        "Accrue Sick Balance rule checkbox")
        self.sick_rule_accrue_balance_textfield = TextField("sick_accrueBalanceField", "id",
                                                            "Accrue Sick Balance rule textfield")
        self.sick_rule_cap_balance_checkbox = Button("sick_capRuleCheckbox", "id",
                                                     "Limit maximum Sick Balance rule checkbox")
        self.sick_rule_cap_balance_textfield = TextField("sick_capBalanceField", "id",
                                                         "Limit maximum Sick Balance rule textfield")
        self.sick_default_control_mode_checkbox = Button("sickUserEnabledId", "id",
                                                         "Automatically turn on Sick Days balance"
                                                         " control for the new users checkbox")

        # Corporate Work Schedule
        self.work_schedule_settings_block = Element("scheduleBlock", "id", "Corporate work Schedule settings block")
        self.default_workday_duration_textfield = TextField("workdayDurationId", "id",
                                                            "Default workday duration textfield")

        # Access To personal work schedules for regular users
        self.schedule_visibility_settings_block = Element("personalSchedulesVisibilityBlock", "id",
                                                          "Access To personal work schedules block")
        self.schedule_visibility_all_user_radiobutton = Button("myScheduleVisibility_all", "id",
                                                               "Show schedules of all actiPLANS users radiobutton")
        self.schedule_visibility_user_group_radiobutton = Button("myScheduleVisibility_userGroup", "id",
                                                                 "Show schedules of users "
                                                                 "from the same department radiobutton")
        self.schedule_visibility_tz_group_radiobutton = Button("myScheduleVisibility_timeZoneGroup", "id",
                                                               "Show schedules of users "
                                                               "from the same time zone group radiobutton")

        # Access option for leave time management
        self.ltm_access_settings_block = Element("ltmAccessBlock", "id", "Access option block")
        self.ltm_show_auto_approved_checkbox = Button("showAutoApprovedId", "id",
                                                      "View leave requests from users who are configured "
                                                      "for automatic approval and run related reports")
        self.ltm_edit_auto_approved_checkbox = Button("ltmCanManageAutoApprovedId", "id",
                                                      "Edit and manage leave requests of users configured "
                                                      "for automatic approval and run related reports")
        self.ltm_show_other_assigned_checkbox = Button("showUsersAssignedToAnotherLTMId", "id",
                                                       "View leave requests from users assigned "
                                                       "to another Leave Request Manager and run related reports")
        self.ltm_auto_approve_requests_radiobutton = Button("autoApprovePastLeaves", "id",
                                                            "Automatically approve unapproved requests "
                                                            "upon their starting date")
        self.ltm_auto_reject_requests_radiobutton = Button("autoRejectPastLeaves", "id",
                                                           "Automatically reject unapproved requests "
                                                           "upon their starting date")

        # Number Formats
        self.format_settings_block = Element("formatsSettingsBlock", "id", "Number Formats block")
        self.decimal_separator_selector = Selector("decimalSeparatorFieldPredefined", "id", "Decimal separator")
        self.decimal_separator_textfield = TextField("decimalSeparatorFieldCustom", "id",
                                                     "Decimal separatator textfield")
        self.digit_grouping_symbol_selector = Selector("digitGroupingSymbolFieldPredefined", "id",
                                                       "Digit grouping symbol")
        self.digit_grouping_symbol_textfield = TextField("digitGroupingSymbolFieldCustom", "id", "Digit grouping textfield")
        self.format_preview_text = Element("numbersFormatPreviewField", "id", "Number Formats Preview")
