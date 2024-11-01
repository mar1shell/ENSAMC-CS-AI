#include "header.h"

// function to make a circular linked list from an array
// we sort the array first and then create a linked list from it
// finaly we make it a circular list
Node *arrayToCircularLinkedList(int *array, int length) {
    mergeSort(array, 0, length - 1); // sort the array (implemented in functions.c)

    Node *head = arrayToLinkedList(array, length); // create a linked list from the array (implemented in functions.c)

    linkedListToCircular(head); // make the linked list circular (implemented in exo7.c)

    return head;
}

// main function to test

int main() {
    int array[] = {5, 4, 3, 2, 1};
    Node *head = arrayToCircularLinkedList(array, 5);

    printLinkedList(head);

    freeLinkedList(head);

    return 0;
}