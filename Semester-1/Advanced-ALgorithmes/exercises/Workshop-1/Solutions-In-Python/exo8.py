def NPT(text):
    """
    NPT - Calculates the number of sentences in a given text.

    Args:
    text (str): The input text, where sentences are separated by periods.

    Returns:
    int: The number of sentences in the text.
    """
    sentences = text.split('.')
    return len([sentence for sentence in sentences if sentence.strip()])  # Strip spaces

def NMT(text):
    """
    NMT - Calculates the number of words (or nouns) in the given text.

    Args:
    text (str): The input text.

    Returns:
    int: The number of words in the text.
    """
    words = text.split()  # Split text into words by whitespace
    return len(words)

def Txt_Tab(text, TCH):
    """
    Txt_Tab - Splits the text into sentences and stores them in a provided list.

    Args:
    text (str): The input text.
    TCH (list): A list to store the sentences.

    Returns:
    None: This function modifies the passed list in-place.
    """
    TCH.extend(text.split('.'))  # Use extend() to modify the original list

def Inv_Txt(text):
    """
    Inv_Txt - Reverses the order of sentences in the given text.

    Args:
    text (str): The input text where sentences are separated by periods.

    Returns:
    str: The text with the order of sentences reversed.
    """
    sentences = []
    
    # Split the text into sentences using Txt_Tab
    Txt_Tab(text, sentences)

    # Join sentences in reverse order, adding a period back if needed
    reversed_text = '. '.join([sentence.strip() for sentence in sentences[::-1] if sentence.strip()]) + '.'
    return reversed_text

if __name__ == "__main__":
    # Test NPT
    text = "This is a sentence. This is another one."
    assert NPT(text) == 2, "NPT test failed"

    # Test NMT
    text = "The quick brown fox."
    assert NMT(text) == 4, "NMT test failed"

    # Test Txt_Tab
    sentences = []
    text = "This is the first sentence. This is the second sentence."
    Txt_Tab(text, sentences)
    assert sentences == ['This is the first sentence', ' This is the second sentence', ''], "Txt_Tab test failed"

    # Test Inv_Txt
    text = "This is the first sentence. This is the second sentence."
    assert Inv_Txt(text) == "This is the second sentence. This is the first sentence.", "Inv_Txt test failed"

    print("All tests passed successfully!")