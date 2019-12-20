import json
import os
from random import randrange
from tqdm import tqdm

from setmodel import Text

def Generator(export_format):
    if not export_format in ['CSV']:
        print('No valid export format!\n')
        return

    subdir = 'samples'
    outputdir = 'data'
    outputfile = f'data.{export_format.lower()}'
    gpt2file = 'gpt2.jsonl'
    humanfile = 'human.jsonl'
    samples =  [gpt2file, humanfile]

    if not os.path.exists(outputdir):
        os.makedirs(outputdir)
    outputdir = outputdir.replace('\\', '/')  # Needed for Windows

    with open(f'./{outputdir}/{outputfile}', 'w') as o:
        if export_format == 'CSV':
            o.writelines(f'ID,TYPE,REP_RATIO,AVG_LENGTH,ODD_RATIO\n')
        for sa in samples:
            with open(f'./{subdir}/{sa}', 'r') as f:
                sample = list(f)
                NUMBER_OF_SETS = len(sample)
                with tqdm(ncols=100, desc=f"Generating {outputfile} for {sa}", total=NUMBER_OF_SETS, unit_scale=True) as pbar:
                    for i in range(NUMBER_OF_SETS):
                        set = json.loads(sample[i])
                        text_type = 0 if sa == 'human.jsonl' else 1
                        t = Text(set['id'], text_type, set['text'])
                        t.generate()
                        if export_format == 'CSV':
                            o.writelines(t.csvify())
                        pbar.update((i/NUMBER_OF_SETS) * 2)
