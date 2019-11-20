from renderer import Render
from downloader import DownloadDatasets
from sampler import Sampler
from generator import Generator


def downloadDatasets(datasets_selected):
    if not datasets_selected:
        print('No selected datasets!\n')
        return

    DownloadDatasets(datasets_selected)

    print('\n')


def generateData(datasets_selected, export_format):
    if not datasets_selected:
        print('No selected datasets!\n')
        return
    if not export_format:
        print('No export format selected!\n')
        return

    number_of_sets = int(input('Number of sets: '))

    Sampler(datasets_selected, NUMBER_OF_SETS=number_of_sets)
    Generator(export_format)

    print('\n')


render = Render(downloadDatasets, generateData)
render.init()
while(True):
    render.menu()
