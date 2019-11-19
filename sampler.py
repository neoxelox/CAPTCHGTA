import json
import os
from random import randrange
from tqdm import tqdm


def Sampler(datasets):

    subdir = 'datasets'
    outputdir = 'samples'
    gpt2file = 'gpt2.jsonl'
    humanfile = 'human.jsonl'
    NUMBER_OF_SETS = 10000

    if not os.path.exists(outputdir):
        os.makedirs(outputdir)
    outputdir = outputdir.replace('\\', '/')  # Needed for Windows

    for ds in datasets:
        with open(f'./{subdir}/{ds}.train.jsonl', 'r') as f:
            dataset = list(f)
            outputfile = humanfile if ds == 'webtext' else gpt2file
            with tqdm(ncols=100, desc="Sampling " + f'{ds}.train.jsonl', total=NUMBER_OF_SETS, unit_scale=True) as pbar:
                with open(f'{outputdir}/{outputfile}', 'w') as o:
                    for i in range(NUMBER_OF_SETS):
                        set = dataset[randrange(len(dataset))]
                        o.writelines(set)
                        pbar.update((i/NUMBER_OF_SETS) * 2)
