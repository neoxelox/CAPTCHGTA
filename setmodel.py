class Text(object):
    # type 'human' = 0, 'gpt2' = 1
    def __init__(self, id, type, text):
        self.id = id
        self.type = type
        self.text = text
        self.rating = None
        self.repeated_words = None
        self.average_sentence_length = None
        self.odd_word_ratio = None
        self.word_distribution = None

    def __str__(self):
        return f'<Text data object> Id: {self.id} | Type: {self.type} | Rating: {self.rating} | RepeatedWords: {self.repeated_words} | AverageSentenceLength: {self.average_sentence_length} | OddWordRatio: {self.odd_word_ratio} | WordDistribution: {self.word_distribution}'

    def csvify(self):
        if self.id is None or self.type is None \
                or self.text is None or self.rating is None \
                or self.repeated_words is None or self.average_sentence_length is None \
                or self.odd_word_ratio is None or self.word_distribution is None:
            raise Exception(f"Corrupted data in {self.__str__()}")
        return f'{self.id},{self.type},{self.rating},{self.repeated_words},{self.average_sentence_length},{self.odd_word_ratio},{self.word_distribution}\n'

    def generate(self):
        # Add your functions here!
        self.example()

    def example(self):
        if self.type == 0:
            self.rating = 5
        elif self.type == 1:
            self.rating = 3
        self.repeated_words = self.id
        if '!' in self.text:
            self.average_sentence_length = 1
        else:
            self.average_sentence_length = 2
        self.odd_word_ratio = 100
        self.word_distribution = 89