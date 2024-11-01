#include "header.h"

// function to concatenate two linked lists

void concat(Node **l1Ptr, Node *l2) {
    Node *l1 = *l1Ptr;
    if (l2 == NULL) { // if l2 is empty, nothing to do
        return;
    }

    if (l1 == NULL) { // if l1 is empty, l1 becomes l2
        *l1Ptr = l2;
    }
    
    Node *temp = l1;
    
    while (temp->next != NULL) {
        temp = temp->next;
    }

    temp->next = l2;
}

// main function to test

int main(void) {
    int A[] = {1, 0, -2, 10, 14, 5, 2};
    Node *l1 = arrayToLinkedList(A, 7);
    printLinkedList(l1);

    int B[] = {2, 5, 10, 6};
    Node *l2 = arrayToLinkedList(B, 4);
    printLinkedList(l2);

    concat(&l1, l2);
    printLinkedList(l1);

    freeLinkedList(l1);
    freeLinkedList(l2);
}