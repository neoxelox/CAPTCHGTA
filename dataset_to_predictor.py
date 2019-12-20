import json
import os
from random import randrange
from tqdm import tqdm

import predictor

predictor.FromDataset = True

subdir = 'samples'
outputdir = 'data'
outputfile = 'predictions.csv'
gpt2file = 'gpt2.jsonl'
humanfile = 'human.jsonl'
samples =  [gpt2file, humanfile]

if not os.path.exists(outputdir):
    os.makedirs(outputdir)
outputdir = outputdir.replace('\\', '/')  # Needed for Windows

N_TEXTS_HUMAN = 500
N_TEXTS_GPT2 = 500

with open(f'./{outputdir}/{outputfile}', 'w') as o:
    o.writelines(f'ID,TYPE,GPT2_PREDICTION_RATIO\n')
    for sa in samples:
        with open(f'./{subdir}/{sa}', 'r') as f:
            sample = list(f)
            sample = sample[:N_TEXTS_HUMAN] if sa == humanfile else sample[:N_TEXTS_GPT2]
            NUMBER_OF_SETS = len(sample)
            with tqdm(ncols=100, desc=f"Generating {outputfile} for {sa}", total=NUMBER_OF_SETS, unit_scale=True) as pbar:
                for i in range(NUMBER_OF_SETS):
                    set = json.loads(sample[i])
                    text_type = 0 if sa == 'human.jsonl' else 1

                    predictionResult = predictor.Predict(set['text'])
                    
                    o.writelines(f"{set['id']},{text_type},{predictionResult}\n")

                    pbar.update((i/NUMBER_OF_SETS) * 2)