#include "header.h"

// function to reverse a linked list iteratively

Node *reverse_iter(Node * head) {
    if (head == NULL || head->next == NULL) { // if the list is empty or has only one element we return the list as is
        return head;
    }
    
    // we use three pointers to keep track of the nextNode, previous and next nodes

    Node *previous = head, *current = head->next, *nextNode = NULL;

    while (current != NULL) {
        if (previous == head) { // if we are at the first node, we set the next pointer to NULL
            previous->next = NULL;
        }

        nextNode = current->next;
        current->next = previous;
        previous = current;
        current = nextNode;
    }

    return previous; // we return the last node as the new head
}

// function to reverse a linked list recursively

Node *reverse_rec(Node *head, Node *previous) {
    if (head == NULL) {
        return previous;
    }

    Node *nextNode = head->next;
    head->next = previous;
    previous = head;

    return reverse_rec(nextNode, previous);
}

// test main function

int main(void) {

    // test iterative reverse function

    int A[] = {10, 0, -2, 10, 14, 5, 2, 10};
    Node *head = arrayToLinkedList(A, 8);

    printf("Function test\n");
    printLinkedList(head);

    head = reverse_iter(head);

    printLinkedList(head);

    freeLinkedList(head);

    // test recursive reverse function

    int B[] = {10, 0, -2, 10, 14, 5, 2, 10};
    head = arrayToLinkedList(B, 8);

    printf("Function test\n");
    printLinkedList(head);

    head = reverse_rec(head, NULL);

    printLinkedList(head);

    freeLinkedList(head);

    return 0;
}