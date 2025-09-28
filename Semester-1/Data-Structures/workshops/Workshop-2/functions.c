#include "header.h"

// Stack functions for stackArray

void initStack(stackArray *stack) {
    stack->top = -1;
}

int isEmpty(stackArray *stack) {
    return stack->top == -1;
}

int isFull(stackArray *stack) {
    return stack->top == MAX - 1;
}

int push(stackArray *stack, char val) {
    if (isFull(stack)) {
        return -1;  // Stack is full
    }

    stack->top++;
    stack->items[stack->top] = val;

    return 0;  // Successful push
}

int pop(stackArray *stack) {
    if (isEmpty(stack)) {
        return -1;  // Stack is empty
    }

    stack->top--;  // Remove the top element

    return 0;  // Successful pop
}

char top(stackArray *stack) {
    if (isEmpty(stack)) {
        return '\0';  // Empty stack
    }

    return stack->items[stack->top];  // Return the top element
}

// Stack functions for stackPage

void initStack2(stackPage *stack) {
    stack->top = -1;
}

int isEmpty2(stackPage *stack) {
    return stack->top == -1;
}

int isFull2(stackPage *stack) {
    return stack->top == MAX - 1;
}

int push2(stackPage *stack, int val) {
    if (isFull2(stack)) {
        return -1;  // Stack is full
    }

    stack->top++;
    stack->items[stack->top] = val;

    return 0;  // Successful push
}

int pop2(stackPage *stack) {
    if (isEmpty2(stack)) {
        return -1;  // Stack is empty
    }

    stack->top--;  // Remove the top element

    return 0;  // Successful pop
}

int top2(stackPage *stack) {
    if (isEmpty2(stack)) {
        return -1;  // Empty stack
    }

    return stack->items[stack->top];  // Return the top element
}

void emptyStack(stackPage *stack) {
    stack->top = -1;  // Empty the stack
}