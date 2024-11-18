#ifndef HEADER_H
#define HEADER_H

// Include libraries

#include <stdio.h>

#include <stdlib.h>

// Define macros

#define MAX 20

#define TRUE 1

#define FALSE 0

// Define structures

typedef struct list {
    char items[MAX];
    int top;
} stackArray;

typedef struct list2 {
    int items[MAX];
    int top;
} stackPage;

// Stack functions

void initStack(stackArray *stack);

void initStack2(stackPage *stack);

int isEmpty(stackArray *stack);

int isEmpty2(stackPage *stack);

int isFull(stackArray *stack);

int isFull2(stackPage *stack);

int push(stackArray *stack, char val);

int push2(stackPage *stack, int val);

int pop(stackArray *stack);

int pop2(stackPage *stack);

char top(stackArray *stack);

int top2(stackPage *stack);

void emptyStack(stackPage *stack);

#endif // HEADER_H