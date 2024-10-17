#ifndef LIBRARY_H_included
#define LIBRARY_H_included

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int k; // k est une variable globale


// Déclaration des structures

typedef struct dt
{
    int jj, mm, aaaa;
} date;

struct etudiant 
{
    char id[3];
    char nom[20];
    char prenom[20];
    int age;
    float note;

};

typedef struct etudiant ETD;

int factorial(int );

#endif // LIBRARY_H_included