import os
import sys
import requests
from tqdm import tqdm


def DownloadDatasets(datasets):
    subdir = 'datasets'

    if not os.path.exists(subdir):
        os.makedirs(subdir)
    subdir = subdir.replace('\\', '/')  # Needed for Windows

    for ds in datasets:
        for split in ['train', 'valid', 'test']:
            filename = ds + "." + split + '.jsonl'
            r = requests.get(
                "https://storage.googleapis.com/gpt-2/output-dataset/v1/" + filename, stream=True)

            with open(os.path.join(subdir, filename), 'wb') as f:
                file_size = int(r.headers["content-length"])
                chunk_size = 1000
                with tqdm(ncols=100, desc="Downloading " + filename, total=file_size, unit_scale=True) as pbar:
                    # 1k for chunk_size, since Ethernet packet size is around 1500 bytes
                    for chunk in r.iter_content(chunk_size=chunk_size):
                        f.write(chunk)
                        pbar.update(chunk_size)
