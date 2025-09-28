#include "header.h"

/**
 * Linked list related functions
 * this first part contains all functions needed for linked list operations
 * creation, deletion, freeing, inserting..
 */

// function to create a new node

Node *createNode(int val) {
   Node *nodePointer = (Node *) malloc(sizeof(Node));
   nodePointer->val = val;
   nodePointer->next = NULL;
   return nodePointer;
}

// function to convert an array to a linked list

Node *arrayToLinkedList(int *array, int length) {
    if (length == 0) {
        return NULL;
    }

    Node *head = createNode(array[0]);

    Node *temp = head;

    for (int i = 1; i < length; i++) {
        temp->next = createNode(array[i]);
        temp = temp->next;
    }

    return head;
}

// function to convert array to circular linked list

Node* arrayToCircularLinkedList(int *array, int length) {
    if (array == NULL || length == 0) { // Check for NULL array or zero length
        return NULL;
    }

    // Initialize head node
    Node *head = createNode(array[0]);
    Node *temp = head;

    // Create subsequent nodes and link them
    for (int i = 1; i < length; i++) {
        temp->next = createNode(array[i]);
        temp = temp->next;
    }

    // Complete the circle by pointing the last node to head
    temp->next = head;

    return head;
}

// function to print a linked list

void printLinkedList(Node *head) {
    Node *temp = head;
    int flag = 0; // flag to check if we are at the head node a second time
    
    while (temp != NULL) {
        if (temp == head && flag == 1) { // we check if we are at the head node a second time to detect a cycle
            printf("CYCLE\n");
            return;
        }

        printf("%d -> ", temp->val);
        temp = temp->next;
        flag = 1; // we set the flag to 1 after we pass the head node for the first time
    }

    printf("NULL\n");
}

// function to free a linked list

void freeLinkedList(Node *head) {
    Node *temp1 = head, *temp2 = head;
    int flag = 0; // flag to check if we are at the head node a second time

    while (temp1 != NULL) {
        if (temp1 == head && flag == 1) { // we check if we are at the head node a second time to detect a cycle
            return; // if we detect a cycle we do not free the list to avoid double free
        }

        temp2 = temp2->next;
        free(temp1);
        temp1 = temp2;
        flag = 1; // we set the flag to 1 after we pass the head node for the first time
    }
}

// function to insert a node at a specific position in a linked list
// we can insert at the head, at the end, or at any position even before the head

void insert(Node *head, int val, int position) {
    if (head == NULL || position < 0) { // if the position is negative or zero or the list is empty we do nothing 
        return;
    }

    if (position == 0) { // if the position is zero we insert before the head
        Node *insertedNode = createNode(head->val);
        insertedNode->next = head->next;
        // we change the value of the head node
        // and we change the next pointer of the head node
        // so the previous head node is now the second node in the list
        // and the new node is the head node
        head->val = val;
        head->next = insertedNode;
    }

    Node *temp = head;

    for (int i = 0; i < position - 1; i++) {
        if (temp->next != NULL) {
            temp = temp->next;
        } else { // if the position is out of bounds we insert at the end of the list
            break;
        }
    }

    Node *insertedNode = createNode(val);
    insertedNode->next = temp->next;
    temp->next = insertedNode;

    return;
}

// function to insert a node at the end of a linked list

void push_back(Node *head, int val) { // insert at the end
    if (head == NULL) { // if the list is empty we do nothing
        return;
    }

    Node *temp = head;

    while (temp->next != NULL) {
        temp = temp->next;
    }

    Node *insertedNode = createNode(val);
    temp->next = insertedNode;

    return;
}

// function to insert a node before the head of a linked list
// we use a double pointer to change the value of the head pointer

void push_head(Node **headPtr, int val) { // insert at head
    Node *insertedNode = createNode(val);

    if (*headPtr == NULL) { // if the list is empty we return the inserted node as the head
        *headPtr = insertedNode;
    }

    insertedNode->next = *headPtr;

    *headPtr = insertedNode;
}

// function to delete a node at a specific position in a linked list
// we can delete the head, the last node, or any node in the list
// we use a double pointer to change the value of the head pointer if we delete the head node

void delete(Node **headPtr, int position) {
    Node *head = *headPtr;
    if (head == NULL || position < 0) { // if the position is negative or zero or the list is empty we do nothing
        return;
    }

    if (position == 0) { // if the position is zero we delete the head 
        Node *temp = head->next;
        free(head);
        *headPtr = temp;
        return;
    }

    Node *temp = head;

    for (int i = 0; i < position - 1; i++) {
        if (temp->next != NULL) {
            temp = temp->next;
        } else { // if the position is out of bounds we delete the last node
            break;
        }
    }

    Node *newNextNode = temp->next->next;
    free(temp->next);
    temp->next = newNextNode;
}

// delete given node from the linked list

void deleteNode(Node **headPtr, Node *node) {
    Node *head = *headPtr;

    if (head == NULL || node == NULL) { // If the list is empty or node is NULL, do nothing
        return;
    }

    if (node == head && head->next == head) { // If there's only one node
        free(head);
        *headPtr = NULL;  // Update head to NULL after deletion
        return;
    }

    if (node == head) { // If the node to delete is the head, update head pointer
        Node *temp = head;
        
        // Find the last node in the circle to update its next pointer
        while (temp->next != head) {
            temp = temp->next;
        }
        
        // Link the last node to the new head and free the old head
        temp->next = head->next;
        *headPtr = head->next;
        free(head);
        return;
    }

    // Traverse to find the node's previous node
    Node *temp = head;
    while (temp->next != node) {
        if (temp->next == head) { // If we've looped back to head, node isn't in the list
            return;
        }
        temp = temp->next;
    }

    // Update the link to skip over the node to be deleted
    temp->next = node->next;
    free(node);
}

// function to delete the last node in a linked list
// and return its value

int pop(Node *head) {
    if (head == NULL) { // if the list is empty we return -1;
        printf("The list is empty\n");
        return -1;
    }

    if (head->next == NULL) { // if the list has only one node we delete it
        int val = head->val;
        free(head);
        return val;
    }

    Node *temp = head;

    while (temp->next != NULL) {
        temp = temp->next;
    }

    int val = temp->next->val;
    free(temp->next);
    
    return val;
}

/**
 * Doubly linked list related functions
 * this second part contains all functions needed for doubly linked list operations
 */

// function to create a new doubly linked list node

DNode *createDNode(int val) {
    DNode *nodePointer = (DNode *) malloc(sizeof(DNode));
    nodePointer->val = val;
    nodePointer->next = NULL;
    nodePointer->prev = NULL;
    return nodePointer;
}

// function to convert an array to a doubly linked list

DNode *arrayToDLL(int *array, int length) {
    if (length == 0) {
        return NULL;
    }

    DNode *head = createDNode(array[0]);

    DNode *temp = head;

    for (int i = 1; i < length; i++) {
        temp->next = createDNode(array[i]);
        temp->next->prev = temp;
        temp = temp->next;
    }

    return head;
}

// function to print a doubly linked list

void printDLL(DNode *head) {
    DNode *temp = head;
    int flag = 0; // flag to check if we are at the head node a second time

    while (temp != NULL) {
        if (temp == head && flag == 1) { // we check if we are at the head node a second time to detect a cycle
            printf("CYCLE\n");
            return;
        }

        printf("%d <-> ", temp->val);
        temp = temp->next;
        flag = 1; // we set the flag to 1 after we pass the head node for the first time
    }

    printf("NULL\n");
}

// function to free a doubly linked list

void freeDLL(DNode *head) {
    DNode *temp1 = head, *temp2 = head;
    int flag = 0; // flag to check if we are at the head node a second time

    while (temp1 != NULL) {
        if (temp1 == head && flag == 1) { // we check if we are at the head node a second time to detect a cycle
            return; // if we detect a cycle we do not free the list to avoid double free
        }

        temp2 = temp2->next;
        free(temp1);
        temp1 = temp2;
        flag = 1; // we set the flag to 1 after we pass the head node for the first time
    }
}

/**
 * Other helping functions
 * this part contains functions that help us throughout the workshop
 * and are not directly related to the linked list opertaions
 */

// function to compute the max of two integers

int max(int a, int b) {
    return (a >= b) ? a : b;
}

// function to sort using merge sort

void merge(int arr[], int left, int mid, int right) {
    int n1 = mid - left + 1; // Size of the first subarray
    int n2 = right - mid;    // Size of the second subarray

    // Create temporary arrays
    int* L = (int*)malloc(n1 * sizeof(int));
    int* R = (int*)malloc(n2 * sizeof(int));

    // Copy data to temporary arrays L[] and R[]
    for (int i = 0; i < n1; i++)
        L[i] = arr[left + i];
    for (int j = 0; j < n2; j++)
        R[j] = arr[mid + 1 + j];

    // Merge the temporary arrays back into arr[left..right]
    int i = 0, j = 0, k = left;
    
    // Initial index of first subarray is i
    // Initial index of second subarray is j
    // Initial index of merged subarray is k
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k] = L[i];
            i++;
        } else {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    // Copy the remaining elements of L[], if any
    while (i < n1) {
        arr[k] = L[i];
        i++;
        k++;
    }

    // Copy the remaining elements of R[], if any
    while (j < n2) {
        arr[k] = R[j];
        j++;
        k++;
    }

    // Free the memory allocated for temporary arrays
    free(L);
    free(R);
}

void mergeSort(int arr[], int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2; // Find the middle point

        // Recursively sort the first and second halves
        mergeSort(arr, left, mid);
        mergeSort(arr, mid + 1, right);

        // Merge the sorted halves
        merge(arr, left, mid, right);
    }
}