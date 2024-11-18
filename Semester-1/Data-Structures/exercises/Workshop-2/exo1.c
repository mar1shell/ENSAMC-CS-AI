#include "header.h"

// Function to confirm that expression has valid combination of closing and opening parantheses

int isBalanced(char *expression) {
    char *currentChar = expression;
    stackArray stack; // Stack to store order of opening parantheses

    initStack(&stack);

    while (*currentChar != '\0') {
        switch (*currentChar) {
            case '(':
            case '[':
            case '{':
                push(&stack, *currentChar); // if we have opening ones we push them to stack
                
                break;
            case ')': // else we pop the matching colsing ones and return false if stack is empty or no match
                if (top(&stack) == '(') {
                    pop(&stack);
                } else {
                    return FALSE;
                }

                break;
            case ']':
                if (top(&stack) == '[') {
                    pop(&stack);
                } else {
                    return FALSE;
                }

                break;
            case '}':
                if (top(&stack) == '{') {
                    pop(&stack);
                } else {
                    return FALSE;
                }

                break;
            default:
                break;
        }

        currentChar++;
    }

    return (isEmpty(&stack)) ? TRUE : FALSE; // Confirm if stack is empty then it's TRUE
}

// Main function to test

int main(void) {
    printf("[[a] (5 + 2)] {} : ## %d ##\n", isBalanced("[[a] (5 + 2)] {}")); // Expected: 1
    printf("as sa () : ## %d ##\n", isBalanced("as sa ()"));                 // Expected: 1
    printf("{(}) : ## %d ##\n", isBalanced("{(})"));                        // Expected: 0
    printf("(( : ## %d ##\n", isBalanced("(("));                            // Expected: 0
    printf(")) : ## %d ##\n", isBalanced("))"));                            // Expected: 0
    printf("()[]{} : ## %d ##\n", isBalanced("()[]{}"));                    // Expected: 1
}