#include "header.h"

// function to solve a variation of the josephus problem
// n is the number of people in the circle
// k is the number of people to skip before removing the next person

int josephus(int n, int k) {
    // we create the circular linked list 
    int *array = (int *) malloc(sizeof(int) * n);
    
    for (int i = 1; i <= n; i++) { // we fill the array with the values from 1 to n
        array[i - 1] = i;
    }

    Node *head = arrayToCircularLinkedList(array, n); // we convert the array to a circular linked list
    Node *temp = head;
    int counter = 1; // we start counting from 1

    while (head->next != head) {
        if (counter % k == 0) { // if we reach the k-th person we delete him
            Node *toDelete = temp;
            temp = temp->next; // we move to the next person
            deleteNode(&head, toDelete); // we delete the node
        } else {
            temp = temp->next; 
        }
        
        counter++;
    }
    
    int result = temp->val;

    free(array);
    free(head);

    return result;
}

// main function to test the josephus function

int main() {
    int n = 7;
    int k = 3;

    printf("The last person standing is: %d\n", josephus(n, k));

    return 0;
}