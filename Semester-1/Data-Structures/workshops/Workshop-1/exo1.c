#include "header.h"

// function to compute the max elemnt of a linked list iteret

int max_iter(Node *head) {
    if (head == NULL) {
        return -1;
    }

    int max = head->val;

    while (head != NULL) {
        if (head->val > max) {
            max = head->val;
        }

        head = head->next;
    }

    return max;
}

// function to compute the max element of a linked list recursively

int max_rec(Node *head) {
    if (head == NULL) {
        return -1;
    }
    
    if (head->next == NULL) {
        return head->val;
    }

    return max(head->val, max_rec(head->next));
}

// main function to test

int main(void) {
    int A[] = {1, 0, -2, 10, 14, 5, 2, 15};
    Node *head = arrayToLinkedList(A, 8);
    printLinkedList(head);
    printf("max = %d\n", max_rec(head));
    freeLinkedList(head);
}