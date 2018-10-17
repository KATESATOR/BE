from features.utility.element import *


class TypesOfWork:

    def __init__(self):
        self.type_of_work_create = Button("div#ext-gen7 span", "CSS", "Create Type of Work")
        self.type_of_work_add_new_name = TextField("input#name", "CSS", "Add new type of work name")
        self.type_of_work_add_new_name_check = Button("//a[contains(text(),'test_type')]", "xpath", "name_check")
        self.type_of_work_create_popup = Button('td#ButtonPane > input[type="submit"]:nth-child(1)', "CSS",
                                                "Create Type of work popup")
        self.type_of_work_delete = Button("table#billingTypesTable td.listtblcell.lastInRow > a", "CSS",
                                          "Delete Leave Type")
        self.type_of_work_edit_status_to_archived = Button(
            "table#billingTypesTable tr:nth-child(11) > td.listtblcellenabled", "CSS", "Edit status")
        self.type_of_work_edit_status_to_active = Button("table#billingTypesTable td.listtblcelldisabled",
                                                         "CSS", "Edit status")
        self.type_of_work_edit_category = Button(
            "table#billingTypesTable tr:nth-child(11) > td.listtblcell.billableStatusCell", "CSS")
        self.type_of_work_edit_default = Button("table#billingTypesTable tr:nth-child(11)>td:nth-of-type(6)", "CSS",
                                                "Set by default")
        self.type_of_work_edit_order_up = Button(
            "table#billingTypesTable > tbody > tr:nth-child(11)> td:nth-child(6) > table > tbody > tr >td > a > img",
            "CSS",
            "Move up")
        self.type_of_work_edit_order_down = Button(
            "table#billingTypesTable > tbody > tr:nth-child(10) > td:nth-child(6) > table > tbody > tr> td > a",
            "CSS", "Move down")
        self.type_of_work_edit_popup = Button(
            "table#billingTypesTable tr:nth-child(11) > td.listtblcell.billingTypeCell > a",
            "CSS", "Edit type popup")
        self.type_of_work_edit_popup_status = Button("form#billingTypeEditForm select", "CSS",
                                                     "Edit popup status")
        self.type_of_work_popup_save_changes = Button("div#FormModifiedDivButton", "CSS", "Save Changes")
        self.type_of_work_popup_status_archived = Button("//option[@value='false']", "xpath", "Status archived")
        self.type_of_work_popup_billable = Button("input#billingType_setBillable", "CSS", "Set biliable")
        self.type_of_work_popup_billing_input = TextField("input#billingRate_input", "CSS", "Billing input")
        self.type_of_work_filter_archived_only = Button("//input[@id='filterStatusCriterion_Archived']", "xpath",
                                                        "Filter archived only")
        self.type_of_work_filter_active_only = Button("//input[@id='filterBillableCriterion_Billable']", "xpath",
                                                      "Filter active only")
        self.type_of_work_filter_billable_only = Button("//input[@id='filterBillableCriterion_Billable']", "xpath",
                                                        "Filter billable only")
        self.type_of_work_filter_nonbillable_only = Button("//input[@id='filterBillableCriterion_NonBillable']",
                                                           "xpath",
                                                           "Filter nonbillable only")
        self.type_of_work_show_types_of_work = Button("form#typesListForm input[type='button']", "CSS",
                                                      "Show Types of Work")
