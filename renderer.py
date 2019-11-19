from inquirer import List as question, Checkbox as choice, prompt
from pyfiglet import figlet_format as bformat

title = 'CAPTCHGTA'
main = {
    'menu':             question('menu',
                                 message="Select option",
                                 choices=['Select datasets',
                                          'Download datasets', 'Generate data'],
                                 carousel=True
                                 ),
    'select_datasets':   choice('select_datasets',
                                message="Select datasets",
                                choices=['webtext', 'small-117M',
                                         'small-117M-k40', 'medium-345M',
                                         'medium-345M-k40', 'large-762M',
                                         'large-762M-k40', 'xl-1542M', 'xl-1542M-k40']
                                ),
    'generate_data':    question('generate_data',
                                 message="Select export format",
                                 choices=['CSV'],
                                 carousel=True
                                 )
}


class Render(object):
    datasets_selected = None
    export_format = None

    def __init__(self, downloadDatasets, generateData):
        self.downloadDatasets = downloadDatasets
        self.generateData = generateData

    def init(self):
        print(bformat(title))
        self.menu()

    def menu(self):
        answers = prompt([main['menu']])

        if answers['menu'] == 'Select datasets':
            answers = prompt([main['select_datasets']])
            self.datasets_selected = answers['select_datasets']
            self.menu()
        elif answers['menu'] == 'Download datasets':
            self.downloadDatasets(self.datasets_selected)
        else:
            answers = prompt([main['generate_data']])
            self.export_format = answers['generate_data']
            self.generateData(self.datasets_selected, self.export_format)
