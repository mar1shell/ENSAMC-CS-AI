#ifndef HEADER_H_INCLUDED
#define HEADER_H_INCLUDED

// Include libraries

#include <stdio.h>
#include <stdlib.h>

// Define structures

typedef struct node {
    int val;
    struct node *next;
} Node;

typedef struct dnode {
    int val;
    struct dnode *next;
    struct dnode *prev;
} DNode;

typedef struct tll {
    struct node *l1;
    struct node *l2;
} twoLinkedLists;

// Declare functions

// functions.c

// Linked list related functions


Node *createNode(int val);

Node *arrayToLinkedList(int *array, int length);

Node *arrayToCircularLinkedList(int *array, int length);

void printLinkedList(Node *head);

void freeLinkedList(Node *head);

void insert(Node *head, int val, int position);

void push_back(Node *head, int val);

void push_head(Node **headPtr, int val);

void delete(Node **headPtr, int position);

void deleteNode(Node **headPtr, Node *node);

int pop(Node *head);

// Doubly linked list related functions

DNode *createDNode(int val);

DNode *arrayToDLL(int *array, int length);

void printDLL(DNode *head);

void freeDLL(DNode *head);

//

int max(int a, int b);

void merge(int arr[], int left, int mid, int right);

void mergeSort(int arr[], int left, int right);

// exo1.c

int max_iter(Node *head);

int max_rec(Node *head);

// exo2.c

void concat(Node **l1Ptr, Node *l2);

// exo3.c

twoLinkedLists *twoLists(Node *head);

void twoLists2(Node *head, Node **pos, Node **neg);

// exo4.c

// exo5.c


// exo6.c

Node *reverse_iter(Node * head);

// exo7.c

void linkedListToCircular(Node *head);

#endif //HEADER_H_INCLUDED