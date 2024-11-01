#include "header.h"

// This file contains the implementation of a function that links the previous nodes
// in a doubly linked list, ensuring proper bidirectional traversal.

void linkPrev(DNode *head) {
    if (head == NULL) {
        return;
    }

    head->prev = NULL;
    DNode *current = head->next, *previous = head;
    
    while (current != NULL) {
        current->prev = previous;
        previous = current;
        current = current->next;
    }
}

// function to create a new doubly linked list node from an array
// without linking the previous nodes

DNode *arrayToDLLNoPrev(int *array, int length) {
    if (length == 0) {
        return NULL;
    }

    DNode *head = createDNode(array[0]);
    DNode *temp = head;

    for (int i = 1; i < length; i++) {
        temp->next = createDNode(array[i]);
        temp = temp->next;
    }

    return head;
}

// main function to test

int main() {
    int array[] = {1, 2, 3, 4, 5};
    DNode *head = arrayToDLLNoPrev(array, 5);

    printDLL(head);

    linkPrev(head);

    DNode *temp = head;

    while (temp != NULL) { // we print the previous node of each node and test if the function works
        // if the previous node is NULL we print -1
        // if the next node is NULL we print -1
        printf("Node %d: prev = %d, next = %d\n", temp->val, temp->prev == NULL ? -1 : temp->prev->val, temp->next == NULL ? -1 : temp->next->val);
        temp = temp->next;
    }

    freeDLL(head);

    return 0;
}