class Text(object):
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
        return f'{self.id},{self.type},{self.rating},{self.repeated_words},{self.average_sentence_length},{self.odd_word_ratio},{self.word_distribution}'
