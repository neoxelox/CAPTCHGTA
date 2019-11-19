from renderer import Render
from downloader import DownloadDatasets
from sampler import Sampler


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

    Sampler(datasets_selected)

    print('\n')


render = Render(downloadDatasets, generateData)
render.init()
while(True):
    render.menu()
