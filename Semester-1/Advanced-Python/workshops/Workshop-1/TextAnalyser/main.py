import string

def read_file(filepath):
    with open(filepath, 'r') as file:
        content = file.read()
    return content

def lexical_analysis(text):
    word_freq = {}
    words = text.split()

    for word in words:
        word = word.lower().strip(string.punctuation)  # Remove punctuation and make lowercase
        if word:
            word_freq[word] = word_freq.get(word, 0) + 1

    avg_word_length = sum(len(word) for word in words) / len(words)

    most_used = max(word_freq, key=word_freq.get)
    least_used = min(word_freq, key=word_freq.get)

    # Palindrome detection
    palindromes = [word for word in word_freq if word == word[::-1]]

    return word_freq, avg_word_length, most_used, least_used, palindromes

def grammatical_analysis(text):
    sentences = text.split('.')
    phrase_count = len(sentences)

    phrase_lengths = [len(sentence.split()) for sentence in sentences]

    punctuation_used = {p: text.count(p) for p in string.punctuation}

    return phrase_count, phrase_lengths, punctuation_used

def generate_report(word_freq, phrase_lengths, text):
    top_10_words = sorted(word_freq.items(), key=lambda x: x[1], reverse=True)[:10]

    longest_phrases = sorted(phrase_lengths, reverse=True)[:5]

    unique_words = set(word_freq.keys())
    vocabulary_diversity = len(unique_words) / len(word_freq)

    phrases = text.split('.')
    repeated_phrases = {}
    for phrase in phrases:
        cleaned_phrase = ' '.join(phrase.split())
        repeated_phrases[cleaned_phrase] = repeated_phrases.get(cleaned_phrase, 0) + 1
    repeated_phrases = {k: v for k, v in repeated_phrases.items() if v > 1}

    return {
        "Top 10 Words": top_10_words,
        "Longest Phrases": longest_phrases,
        "Vocabulary Diversity": vocabulary_diversity,
        "Repeated Phrases": repeated_phrases
    }


# Main function
def main(filepath):
    text = read_file(filepath)

    word_freq, avg_word_length, most_used, least_used, palindromes = lexical_analysis(text)
    phrase_count, phrase_lengths, punctuation_used = grammatical_analysis(text)
    report = generate_report(word_freq, phrase_lengths, text)

    print(report)


# Test functions

filepath = input("Enter the path to the text file: ")
main(filepath)