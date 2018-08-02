from features.utility.element import *


class EnterTTPage:

    def __init__(self):
        self.tt_field = TextField("//*[@id='spent_59_0']", "xpath", "tt_field")
        self.save_button = Button("SubmitTTButton", "id", "save_changes")
