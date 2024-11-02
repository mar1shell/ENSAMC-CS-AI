#include "header.h"

// funvtion to swap two nodes in a linked list

void swapNodes(Node **headPtr, Node *node1, Node *node2) {
    if (*headPtr == NULL || node1 == NULL || node2 == NULL || node1 == node2) {
        return; // Exit if the list is empty, nodes are NULL, or nodes are the same
    }

    Node *head = *headPtr;
    Node *prevNode1 = NULL, *prevNode2 = NULL;
    Node *temp = head;

    // Locate the predecessors of node1 and node2

    while (temp != NULL && (prevNode1 == NULL || prevNode2 == NULL)) {
        if (temp->next == node1) {
            prevNode1 = temp;
        }

        if (temp->next == node2) {
            prevNode2 = temp;
        }

        temp = temp->next;
    }

    // If node1 or node2 is not found, we return

    if ((node1 != head && prevNode1 == NULL) || (node2 != head && prevNode2 == NULL)) {
        return;
    }

    // Update headPtr if swapping involves the head

    if (node1 == head) {
        *headPtr = node2;
    } else if (node2 == head) {
        *headPtr = node1;
    }

    // Swap previous node pointers

    if (prevNode1 != NULL) {
        prevNode1->next = node2;
    }
    if (prevNode2 != NULL) {
        prevNode2->next = node1;
    }

    // Swap next pointers of node1 and node2

    Node *tempNext = node1->next;
    node1->next = node2->next;
    node2->next = tempNext;
}

// main function to test

int main() {
    int arr[] = {1, 2, 3, 4, 5};
    Node *head = arrayToLinkedList(arr, 5);

    printLinkedList(head);

    Node *node1 = head->next;
    Node *node2 = node1->next->next;

    swapNodes(&head, node1, node2);

    printLinkedList(head);

    freeLinkedList(head);

    return 0;
}