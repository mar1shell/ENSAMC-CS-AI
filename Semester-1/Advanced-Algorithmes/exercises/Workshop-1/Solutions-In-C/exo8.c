#include "header.h"

int NPT(const char *text) {
    /**
     * @brief Counts the number of sentences in a given text.
     * 
     * A sentence is defined as starting with a letter or digit and ending with a period (`.`).
     * Sentences are separated by spaces.
     * 
     * @param text The input string containing the text.
     * @return int The number of sentences in the text.
     */

    int count = 0;
    int in_sentence = 0;

    for (int i = 0; text[i] != '\0'; i++) {
        if (isalnum(text[i]) && !in_sentence) {
            in_sentence = 1; // Start of a new sentence
        }

        if (text[i] == '.') {
            if (in_sentence) {
                count++; // End of a sentence
                in_sentence = 0;
            }
        }
    }

    return count;
}


int NMT(const char *text) {
    /**
     * @brief Counts the number of words in a given text.
     * 
     * A word is defined as a sequence of non-space characters separated by spaces.
     * 
     * @param text The input string containing the text.
     * @return int The number of words in the text.
     */

    int count = 0;
    int in_word = 0;

    for (int i = 0; text[i] != '\0'; i++) {
        if (!isspace(text[i]) && !in_word) {
            in_word = 1; // Start of a new word
            count++;
        } else if (isspace(text[i])) {
            in_word = 0; // End of a word
        }
    }

    return count;
}

void Txt_Tab(const char *text, char TCH[MAX_SENTENCES][MAX_LENGTH]) {
    /**
     * @brief Splits a text into sentences and stores them in a string array.
     * 
     * Sentences are separated by spaces and end with a period (`.`). 
     * Each sentence is stored in the array `TCH`.
     * 
     * @param text The input string containing the text.
     * @param TCH The output array of strings to store sentences.
     */
    int sentence_index = 0, char_index = 0;

    for (int i = 0; text[i] != '\0'; i++) {
        if (text[i] == '.' && char_index > 0) {
            TCH[sentence_index][char_index++] = '.'; // Add the period
            TCH[sentence_index][char_index] = '\0'; // Null-terminate the sentence
            sentence_index++;
            char_index = 0;
        } else if (!isspace(text[i]) || char_index > 0) {
            TCH[sentence_index][char_index++] = text[i];
        }
    }
}

void Inv_Txt(char *text) {
    /**
     * @brief Reverses the order of sentences in a text.
     * 
     * The original text is split into sentences, their order is reversed, and the 
     * resulting text is reconstructed.
     * 
     * @param text The input string containing the text.
     */

    char TCH[MAX_SENTENCES][MAX_LENGTH];
    char result[MAX_TEXT_LENGTH] = "";

    Txt_Tab(text, TCH); // Split the text into sentences
    int num_sentences = NPT(text);

    for (int i = num_sentences - 1; i >= 0; i--) {
        strcat(result, TCH[i]);
        if (i > 0) {
            strcat(result, " "); // Add space between sentences
        }
    }

    strcpy(text, result); // Copy the reversed text back
}

// Main function to test

int main() {
    char text[MAX_TEXT_LENGTH] = "Aujourd'hui c'est l'examen d'Algorithmique. Bonne chance. Chacun pour soi et Dieu pour tous.";
    char TCH[MAX_SENTENCES][MAX_LENGTH];
    
    // Test NPT
    int num_sentences = NPT(text);
    printf("Number of sentences: %d\n", num_sentences);
    
    // Test NMT
    int num_words = NMT(text);
    printf("Number of words: %d\n", num_words);

    // Test Txt_Tab
    Txt_Tab(text, TCH);
    printf("Sentences in the text:\n");
    for (int i = 0; i < num_sentences; i++) {
        printf("TCH[%d]: %s\n", i, TCH[i]);
    }

    // Test Inv_Txt
    char reversed_text[MAX_TEXT_LENGTH];
    strcpy(reversed_text, text); // Copy the text to preserve original
    Inv_Txt(reversed_text);
    printf("Reversed text: %s\n", reversed_text);

    return 0;
}