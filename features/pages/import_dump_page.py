from features.utility.element import *


class ImportDumpPage:

    def __init__(self):
        self.import_field = TextField('input-1', 'id', 'import file')
        self.upload_button = Button('//*[@class="input-group-btn"]/button[3]', 'xpath',
                                    'upload button')
