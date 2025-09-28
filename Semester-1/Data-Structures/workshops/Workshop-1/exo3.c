#include "header.h"

// function to split a linked list into two linked lists
// we used twoLinkedLists structure to return the two linked lists

twoLinkedLists *twoLists(Node *head) {
    twoLinkedLists *list = (twoLinkedLists *) malloc(sizeof(twoLinkedLists));
    
    Node *temp = head, *p1 = NULL, *p2 = NULL;

    while (temp != NULL) {
        if (temp->val >= 0) {
            if (list->l1 == NULL) { // if l1 is empty, create a new node
                list->l1 = createNode(temp->val);
                p1 = list->l1;
            } else {
                p1->next = createNode(temp->val);
                p1 = p1->next;
            } 
        } else {
            if (list->l2 == NULL) { // if l2 is empty, create a new node
                list->l2 = createNode(temp->val);
                p2 = list->l2;
            } else {
                p2->next = createNode(temp->val);
                p2 = p2->next;
            }
        }

        temp = temp->next;
    }

    return list;
}

// function to split a linked list into two linked lists
// we used two pointers to the two linked lists
// we operate on the same linked list and we split it (O(1) exra space)

void twoLists2(Node *head, Node **pos, Node **neg) {
    Node *temp = head;
    Node *negParser = NULL, *posParser = NULL;

    while (temp!= NULL) {
        if (temp->val >= 0) {
            if (*pos == NULL) {
                *pos = temp;
                posParser = temp;
            } else {
                posParser->next = temp;
                posParser = temp;
            }
        } else {
            if (*neg == NULL) {
                *neg = temp;
                negParser = temp;
            } else {
                negParser->next = temp;
                negParser = temp;
            }
        }

        temp = temp->next;
        
        if (posParser != NULL) {
            posParser->next = NULL;
        }

        if (negParser != NULL) {
            negParser->next = NULL;
        }
    }
}

int main(void) {

    // test de la premiere fonction

    int A[] = {1, 0, -2, 10, 14, 5, -1, -10, 2, -1};
    Node *head = arrayToLinkedList(A, 10);
    printLinkedList(head);

    twoLinkedLists *lists = twoLists(head);
    printLinkedList(lists->l1);
    printLinkedList(lists->l2);

    freeLinkedList(lists->l1);
    freeLinkedList(lists->l2);

    // test de la deuxieme fonction

    int A[] = {1, 0, -2, 10, 14, 5, -1, -10, 2, -1};
    Node *head = arrayToLinkedList(A, 10);
    printLinkedList(head);

    Node *pos = NULL, *neg = NULL;
    twoLists2(head, &pos, &neg);
    printf("Positive list: ");
    printLinkedList(pos);
    printf("Negative list: ");
    printLinkedList(neg);

    freeLinkedList(pos);
    freeLinkedList(neg);
}