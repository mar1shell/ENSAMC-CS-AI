#include "header.h"

// function to fill array with polynome coeeficients
// the first elemnt of the array is filled with the number of coeffcients (highest exponent + 1)

int *fillPolynomArray(void) {
    int n, currentExponent;

    printf("---------------------------------\n\n");
    printf("Insert the highest exponent in the polynom: (x^n) n = ");
    scanf("%d", &n);
    printf("---------------------------------\n\n");

    while (n < 0) {
        printf("the exponent can't be negative, try again\n");
        printf("---------------------------------\n\n");
        printf("Insert the highest exponent in the polynom: (x^n) n = ");
        scanf("%d", &n);
        printf("---------------------------------\n\n");
    }

    int *array = (int *) malloc(sizeof(int) * (n + 2)); // allocation of n+2 array to store the n+1 coefficients  
    array[0] = n + 1; // first element is initialised with coeffecients number

    for (int i = 1; i < n + 2; i++) { // we initialize the other elements to zero so unfilled exponents have a zero coefficient automatically
        array[i] = 0;
    }

    printf("Now you gonna insert the exponents with their designated coeeficient\n");
    printf("Just give the non zero coeeficients and the other ones will be automatically evaluted to zero\n");
    printf("You can update any coefficient each time you want before terminating the input loop; let's begin\n");
    printf("---------------------------------\n\n");
    
    do {
        printf("insert the current exponent that you want to give it's cofficient: (-1 to exit) ");
        scanf("%d", &currentExponent);
        
        if (currentExponent == -1) { // if -1 is inputed with exit the loop
            break;
        }

        if (currentExponent > n) { // if a non valid exponent is given 
            printf("The exponent is higher than the highest exponent in the polynom, try again\n");
            continue;
        }

        printf("insert the cofficient of x^%d: ", currentExponent);
        scanf("%d", &array[currentExponent + 1]); // we insert he coefficients with a 1 offset so we don't loose the information in the first array element 
        printf("---------------------------------\n\n");
    } while (1);

    return array;
}

// function to evaluate P(x); we use horner's method for evaluating polynoms
// check this wikepedia page for more info: https://en.wikipedia.org/wiki/Horner%27s_method

int evaluatePolynom(Node *head, int x) {
    if (head == NULL) { // if the list is empty we terminate the program
        printf("List is empty");
        exit(1);
    }

    head = reverse_iter(head); // we reverse the polynom so it's easy to evalute using Horner method for evaluating polynoms
    
    int result = head->val; // we store the last coefficient firstly
    Node *temp = head->next; // we start from the second to last coefficient

    while (temp != NULL) {
        result = result * x + temp->val; // for more explanation visit Horner's method page in wikipedia
        temp = temp->next;
    }

    return result;
}

// test main function

int main(void) {
    int *array = fillPolynomArray();
    Node *head = arrayToLinkedList(array + 1, array[0]); // we skip the first element in the array which is the size of the array

    printf("The polynom coefficents are (from x^0 to x^n): ");
    printLinkedList(head);

    int x;
    printf("Insert the value of x: ");
    scanf("%d", &x);

    printf("The result of the polynom is: %d\n", evaluatePolynom(head, x));

    freeLinkedList(head);
    free(array);

    return 0;
}