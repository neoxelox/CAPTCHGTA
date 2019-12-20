import nltk
import re

class Text(object):
    # type 'human' = 0, 'gpt2' = 1
    def __init__(self, id, type, text):
        self.id = id
        self.type = type
        self.text = text
        self.repeated_words_ratio = None
        self.average_sentence_length = None
        self.odd_word_ratio = None

    def __str__(self):
        return f'<Text data object> Id: {self.id} | Type: {self.type} | RepeatedWordsRatio: {self.repeated_words_ratio} | AverageSentenceLength: {self.average_sentence_length} | OddWordRatio: {self.odd_word_ratio}'

    def csvify(self):
        if self.id is None or self.type is None \
                or self.text is None or self.repeated_words_ratio is None or self.average_sentence_length is None \
                or self.odd_word_ratio is None:
            raise Exception(f"Corrupted data in {self.__str__()}")
        return f'{self.id},{self.type},{self.repeated_words_ratio},{self.average_sentence_length},{self.odd_word_ratio}\n'

    def generate(self):
        # Add your functions here!
        self.analyze()

    def analyze(self):
        try:
            with open("words.txt") as word_file:
                english_words = set(word.strip().lower() for word in word_file)

            stemmer = nltk.stem.porter.PorterStemmer()
            stop_words = set(nltk.corpus.stopwords.words('english'))
            paragraphs = re.split("\n|\t", self.text)
    
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
            
            self.average_sentence_length = n_words/n_sentences
            self.odd_word_ratio = odd_words/n_words
            self.repeated_words_ratio = reps/n_words
        except Exception as ex:
            print(self.__str__())
            print(self.text)
            raise ex
        