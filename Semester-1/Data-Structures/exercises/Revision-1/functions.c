#include <stdio.h>

int factorial(int n) 
{
    int result = 1, i;
    
    for (i = 1; i <= n; i++) 
    {
        result *= i;
    }

    return result;
}