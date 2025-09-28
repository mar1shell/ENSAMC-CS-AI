# Data Structures Workshop 1 Solutions

This folder contains solutions to Workshop 1 in Data Structures. The problem descriptions are in French, but the solutions are provided in English. The workshop consists of 13 exercises focusing on linked lists, including all operations and manipulations, as well as queues and stacks.

## Folder Structure

- **header.h**: Contains all function prototypes used throughout the exercise files.
- **functions.c**: Contains various helper functions to manipulate linked lists, doubly linked lists, stacks, and queues.
- **exo1.c** to **exo13.c**: Each file contains the solution to a specific exercise, including a main function to test the implementation.

## Compilation Instructions

To compile and run a specific exercise file, you need to include `header.h` and `functions.c` in the compiler parameters. For example, to compile `exo1.c`, use the following command:

## Special Instructions

- **Exercise 9**: Requires a function from `exo7.c`. Before compiling `exo9.c`, comment out the main function in `exo7.c`.
- **Exercise 8**: Requires a function from `exo6.c`. Before compiling `exo8.c`, comment out the main function in `exo6.c`.

## Example Compilation Commands

- To compile `exo9.c`:
  ```sh
  gcc exo9.c exo7.c functions.c -o exo9 -I.
  ```
  Make sure to comment out the main function in exo7.c before compiling.

- To compile exo8.c:
    ```sh
    gcc exo8.c exo6.c functions.c -o exo8 -I.
    ```
    Make sure to comment out the main function in exo6.c before compiling.

## Exercises Overview

- **Exercise 1**: Find max element in a simply linked list.
- **Exercise 2**: Concatenate two simply linked lists.
- **Exercise 3**: Extract two sub-lists from a simply linked list.
- **Exercise 4**: Swap two elements in a simply linked list.
- **Exercise 5**: Remove elements from a simply linked list.
- **Exercise 6**: Reverse a simply linked list.
- **Exercise 7**: Close a simply linked list.
- **Exercise 8**: Work with polynomial expressions.
- **Exercise 9**: Circular simply linked list.
- **Exercise 10**: Doubly linked list.
- **Exercise 11**: Stack and Queue reversal.
- **Exercise 12**: Recursion with queues.
- **Exercise 13**: Josephus problem.

## Notes

- The solutions provided are not the only way to solve the exercises. They are just one of the possible solutions.
- The solutions are tested and should work as expected. If you find any issues, please let me know.
- If you have a better solution or an enhancement, please create a pull request.
- Ensure that you have the necessary permissions to compile and run the files.
- Make sure to follow the special instructions for exercises 8 and 9 to avoid compilation errors.
