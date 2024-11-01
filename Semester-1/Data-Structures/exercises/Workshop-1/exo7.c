#include "header.h"

// function to create a cycle in a linked list

void linkedListToCircular(Node *head) {
    if (head == NULL) {
        return;
    }

    Node *tail = head;
    
    while (tail->next != NULL) {
        tail = tail->next;
    }

    tail->next = head;
}

// main function to test

int main() {
    int array[] = {1, 2, 3, 4, 5};
    Node *head = arrayToLinkedList(array, 5);
 
    printLinkedList(head);
 
    linkedListToCircular(head);
 
    printLinkedList(head);
 
    freeLinkedList(head);
 
    return 0;
}