from features.utility.element import *


class LogoColorSchemePage:
    def __init__(self):
        # Logo & Color Scheme
        # Color selector
        self.default_color = Button("default", "id", "default color")
        self.azureblue_color = Button("azureblue", "id", "azureblue color")
        self.aquamarine_color = Button("aquamarine", "id", "aquamarine color")
        self.ferngreen_color = Button("ferngreen", "id", "ferngreen color")
        self.yellowgreen_color = Button("yellowgreen", "id", "yellowgreen color")
        self.charcoalgrey_color = Button("charcoalgrey", "id", "charcoalgrey color")
        self.orange_color = Button("orange", "id", "orange color")
        self.purple_color = Button("purple", "id", "purple color")
        self.red_color = Button("red", "id", "red color")

        self.selected_purple_color = Element("//*[@id='purple']//*[@id='selectedColorIcon']", "xpath",
                                             "selected purple color")

        # Logo for Interface
        self.default_logo_radiobutton = Button("useDefaultLogoOption", "id", "use default logo radiobutton")
        self.keep_logo_radiobutton = Button("keepCurrentCustomLogoOption", "id", "keep current logo radiobutton")
        self.custom_logo_radiobutton = Button("uploadNewLogoOption", "id", "upload new logo radiobutton")
        self.choose_logo_file = TextField("//*[@id='uploadNewLogoOption']//../..//*[@class='inputChooseFile']", "xpath",
                                          "choose logo file")

        # Logo for Reports
        self.no_report_logo_radiobutton = Button("noReportLogo", "id", "don't show logo on report radiobutton")
        self.default_report_logo_radiobutton = Button("useDefaultReportLogoOption", "id",
                                                      "use default logo in report radiobutton")
        self.keep_report_logo_radiobutton = Button("keepCurrentReportCustomLogoOption", "id",
                                                   "keep current report logo radiobutton")
        self.custom_report_logo_radiobutton = Button("uploadNewReportLogoOption", "id",
                                                     "upload new report logo radiobutton")
        self.choose_report_logo_file = TextField(
            "//*[@id='uploadNewReportLogoOption']//../..//*[@class='inputChooseFile']", "xpath", "choose logo file")

        self.save_settings_button = Button("ButtonPane", "id", "save settings")
