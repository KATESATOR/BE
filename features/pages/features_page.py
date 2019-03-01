from features.utility.element import *


class Features:

    def __init__(self):
        self.features_future_days = Button("div#FEATURE_TTF > img", "CSS", "Feature future_days")
        self.features_leave_time = Button("div#FEATURE_LVT > img", "CSS", "Leave Time Tracking")
        self.features_pto_balance = Button("div#FEATURE_PTO > img", "CSS", "PTO Balance Calculations")
        self.features_sick_balance = Button("div#FEATURE_SDB > img", "CSS", "Sick Days Balance Calculations")
        self.features_overtime = Button("div#FEATURE_OVR > img", "CSS", "Overtime Registration")
        self.features_tt_approval = Button("div#FEATURE_TTA > img", "CSS", "Time-Track Approval")
        self.features_departments = Button("div#FEATURE_UGR > img", "CSS", "Departments")
        self.features_tzg = Button("div#FEATURE_TZG > img", "CSS", "Time Zone Groups")
        self.features_task_estimates = Button("div#FEATURE_EST > img", "CSS", "Task Estimates")
        self.features_task_workflow = Button("div#FEATURE_TWS > img", "CSS", "Task Workflow")
        self.features_work_assignments = Button("div#FEATURE_WAS > img", "CSS", "Work Assignments")
        self.features_user_rates_cost = Button("div#FEATURE_URA > img", "CSS", "User Rates & Cost of Work Report")
        self.features_types_of_work = Button("div#FEATURE_BTY > img", "CSS", "Types of Work")
        self.features_hourly_billing = Button("div#FEATURE_BRA > img", "CSS",
                                              "Hourly Billing Rates, Invoices & P/l Report")
        self.features_status_on = Button("//div[contains(@class,'feature on')]", "xpath", "Feature off")
        self.features_status_off = Button("//div[contains(@class,'feature off')]", "xpath", "Feature on")
