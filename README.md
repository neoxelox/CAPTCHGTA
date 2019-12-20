# CAPTCHGTA
Completely Automated Private Turing Test To Tell Human and Computer Generated Text Apart

B7 Project for FIB PE subject

## REQUIREMENTS
`Python 3`

`pip install -r requirements.txt`

```python
nltk.download('averaged_perceptron_tagger')
nltk.download('wordnet')
nltk.download('stopwords')
nltk.download('punkt')
```

## USAGE
##### Download, Sample and Generate data:
`python main.py`

##### Predict Text author from Dataset:
`python dataset_to_predictor.py`

##### Predict Text author from Input:
`python input_to_predictor.py`

**Note!** Use this program with special care! No error handling was programmed!