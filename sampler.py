import json
import os
from random import randrange
from tqdm import tqdm


def Sampler(datasets, NUMBER_OF_SETS=1):

    if NUMBER_OF_SETS > 250000:
        NUMBER_OF_SETS = 1

    subdir = 'datasets'
    outputdir = 'samples'
    gpt2file = 'gpt2.jsonl'
    humanfile = 'human.jsonl'

    if not os.path.exists(outputdir):
        os.makedirs(outputdir)
    outputdir = outputdir.replace('\\', '/')  # Needed for Windows

    with open(f'./{outputdir}/{gpt2file}', 'w') as ogpt2:
        with open(f'./{outputdir}/{humanfile}', 'w') as ohuman:
            for ds in datasets:
                with open(f'./{subdir}/{ds}.train.jsonl', 'r') as f:
                    dataset = list(f)
                    with tqdm(ncols=100, desc="Sampling " + f'{ds}.train.jsonl', total=NUMBER_OF_SETS, unit_scale=True) as pbar:
                        for i in range(NUMBER_OF_SETS):
                            set = dataset[randrange(len(dataset))]
                            ohuman.writelines(set) if ds == 'webtext' else ogpt2.writelines(set)
                            pbar.update((i/NUMBER_OF_SETS) * 2)
