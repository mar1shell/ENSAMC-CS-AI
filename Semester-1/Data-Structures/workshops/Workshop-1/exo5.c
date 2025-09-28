#include "header.h"

// function to delete all occurances of a value in a linked list
// we use a double pointer to change the value of the head pointer if the head node is deleted
// we use a while loop to iterate over the linked list and delete all occurances of the value
// we use the delete function to delete a node at a specific position (declared in functions.c)

void deleteOccurances(Node **headPtr, int x) {
    Node *head = *headPtr;
    Node *temp = head;
    int i = 0;

    while (temp != NULL) {
        if (temp->val == x) {
            temp = temp->next;
            delete(headPtr, i); // delete the node at position i
        } else {
            i++;
            temp = temp->next;
        }
    }
}

// function to keep the first k occurances of a value in a linked list
// and delete the rest of the occurances
// we use a double pointer to change the value of the head pointer if the head node is deleted
// we use a while loop to iterate over the linked list and delete the rest of the occurances
// we use the deleteOccurances function to delete all occurances of the value after the first k occurances

void keepFirstKOccurances(Node **headPtr, int k, int x) {
    Node *head = *headPtr;
    Node *temp = head;
    int flag = k; // flag to keep track of the number of occurances

    while (temp != NULL) {
        if (flag == 0) { // if we reach k occurances, we delete the rest of the occurances
            deleteOccurances(&temp, x);
            return;
        } else if (temp->val == x) {
            flag--;
        }

        temp = temp->next;
    }
}

// main function to test

int main(void) {

    // test first function

    int A[] = {10, 0, -2, 10, 14, 5, 2, 10};
    Node *head = arrayToLinkedList(A, 8);

    printf("First function test\n");
    printLinkedList(head);

    deleteOccurances(&head, 10);

    printf("After deleting all occurances of 10\n");
    printLinkedList(head);
    freeLinkedList(head);

    // test second function

    int B[] = {10, 0, -2, 10, 14, 5, 10, 2, 10};
    head = arrayToLinkedList(B, 9);

    printf("Second function test\n");
    printLinkedList(head);

    keepFirstKOccurances(&head, 2, 10);

    printf("After deleting the first 2 occurances of 10\n");
    printLinkedList(head);
    freeLinkedList(head);
}