import nltk

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
            stop_words = set(nltk.corpus.stopwords.words('english')).union("\n","\t","\n\n","\t\t","\n\n\n","\t\t\t")
            
            tokens = nltk.word_tokenize(self.text)
            n_palabras = len(tokens)
            
            n_frases = len(nltk.sent_tokenize(self.text))
            if n_frases == 0:
                n_frases = 1
            self.average_sentence_length = n_palabras/n_frases

            fuera_vocab = 0
            repeticiones = 0
            vistos = set()
            
            for token in tokens:
                if(token not in stop_words and len(token)>1):
                    raiz = stemmer.stem(token).lower()
                    if raiz in vistos:
                        repeticiones += 1
                    else:
                        vistos.add(raiz)
                    
                    if(token.lower() not in english_words):
                        fuera_vocab += 1
            
            if n_palabras == 0:
                n_palabras = 1
            self.odd_word_ratio = fuera_vocab/n_palabras
            self.repeated_words_ratio = repeticiones/n_palabras 
        except Exception as ex:
            print(self.__str__())
            print(self.text)
            raise ex
        