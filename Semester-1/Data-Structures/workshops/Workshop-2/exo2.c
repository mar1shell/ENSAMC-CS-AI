#include "header.h"

int visitPage(stackPage *backStack, stackPage *forwardStack, int page) {
    // Push the current page to the back stack
    push2(backStack, page);
    
    // Empty the forward stack as visiting a new page clears forward history
    emptyStack(forwardStack);
    
    return page;  // Return the visited page
}

int backPage(stackPage *backStack, stackPage *forwardStack) {
    int currentPage = top2(backStack);

    if (currentPage == -1) {  // If no page to go back to
        printf("No more pages to go back to\n");
        return -1;
    }

    // Push the current page to the forward stack
    push2(forwardStack, currentPage);
    
    // Pop the current page from the back stack
    pop2(backStack);

    // Return the new top of the back stack (previous page)
    return top2(backStack);
}

int forwardPage(stackPage *backStack, stackPage *forwardStack) {
    int currentPage = top2(forwardStack);

    if (currentPage == -1) {  // If no page to go forward to
        printf("No more pages to go forward to\n");
        return -1;
    }

    // Push the current page to the back stack
    push2(backStack, currentPage);
    
    // Pop the current page from the forward stack
    pop2(forwardStack);

    // Return the new current page after going forward
    return currentPage;
}

// Main function to test

int main(void) {
    stackPage backStack, forwardStack;

    // Initialize the stacks
    initStack2(&backStack);
    initStack2(&forwardStack);

    // Start visiting pages
    printf("Visiting Page: %d\n", visitPage(&backStack, &forwardStack, 1)); // Visit page 1
    printf("Visiting Page: %d\n", visitPage(&backStack, &forwardStack, 2)); // Visit page 2
    printf("Visiting Page: %d\n", visitPage(&backStack, &forwardStack, 3)); // Visit page 3
    printf("Visiting Page: %d\n", visitPage(&backStack, &forwardStack, 4)); // Visit page 4

    // Go back
    printf("Back to Page: %d\n", backPage(&backStack, &forwardStack)); // Back to page 3
    printf("Back to Page: %d\n", backPage(&backStack, &forwardStack)); // Back to page 2
    printf("Back to Page: %d\n", backPage(&backStack, &forwardStack)); // Back to page 1

    // Go forward
    printf("Forward to Page: %d\n", forwardPage(&backStack, &forwardStack)); // Forward to page 2
    printf("Forward to Page: %d\n", forwardPage(&backStack, &forwardStack)); // Forward to page 3

    // Visit a new page and verify forward stack is cleared
    printf("Visiting Page: %d\n", visitPage(&backStack, &forwardStack, 5)); // Visit page 5
    printf("Forward after visiting new page: %d\n", top2(&forwardStack));   // Should be -1 (empty stack)

    // Go back again
    printf("Back to Page: %d\n", backPage(&backStack, &forwardStack)); // Back to page 4

    return 0;
}