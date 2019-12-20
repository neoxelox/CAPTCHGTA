import nltk
import re
import math

FromDataset = True

with open("words.txt") as word_file:
    english_words = set(word.strip().lower() for word in word_file)

print("LOADED: English Vocabulary")

stemmer = nltk.stem.porter.PorterStemmer()
stop_words = set(nltk.corpus.stopwords.words('english'))

def normal(value, mean, sd):
    return 1/(sd*math.sqrt(2*math.pi))*math.exp(-(value-mean)**2/(2*sd**2))

def Predict(text):
    paragraphs = re.split("\n|\t", text)

    n_words = 0
    n_sentences = 0
    odd_words = 0
    reps = 0
    seen = []

    for paragraph in paragraphs:
        if len(paragraph) > 0:
            tokens = nltk.word_tokenize(paragraph)
            n_words += len(tokens)
            
            n_sentences += len(nltk.sent_tokenize(paragraph))
            
            for token in tokens:
                if (token not in stop_words and len(token) > 1):
                    root = stemmer.stem(token).lower()
                    
                    for i in range(max(0, len(seen) - 19), len(seen)):
                        if seen[i] == root:
                            reps += 1
                            break
                    
                    seen.append(root)
                    
                    if (token.lower() not in english_words):
                        odd_words += 1
                else:
                    seen.append("")

    if not FromDataset:
        print(f'Words: {n_words}')
        print(f'Sentences: {n_sentences}')
        print(f'Average sentence length: {n_words/n_sentences}')

        print(f'Odd words: {odd_words} ({(odd_words/n_words)*100}%)')
        print(f'Repeated words: {reps} ({(reps/n_words)*100}%)')
        print(f'Words: {n_words}')
        print(f'Words: {n_words}')
    
    p_odd = odd_words/n_words
    p_rep = reps/n_words
    
    # Values got from an R analysis on 50k texts
    repMmean = 0.05033079
    repMsd = 0.03753718
    
    repHmean = 0.04539921
    repHsd = 0.04102671

    oddMmean = 0.05243896
    oddMsd = 0.03982363
    
    oddHmean = 0.06825689
    oddHsd = 0.05616775

    machine = normal(p_rep, repMmean, repMsd)*normal(p_odd, oddMmean, oddMsd)
    human = normal(p_rep, repHmean, repHsd)*normal(p_odd, oddHmean, oddHsd)
    
    p_machine = machine/(human+machine)

    if not FromDataset:
        if(p_machine >= 0.5):
            print(f"I'm {p_machine * 100}% that the text was written by a machine")
        else:
            print(f"I'm {(1-p_machine) * 100}% that the text was written by a human")

    return p_machine
   
if not FromDataset: 
    while (True):
        Predict(input())