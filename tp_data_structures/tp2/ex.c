#include <stdio.h>
#include <stdlib.h>

//EX1

typedef struct element element;
struct element
{
    int value;
    element* suivant; 
};

typedef struct pile pile;
struct pile
{
    element* tete;
};


void empiler(pile* p1, int v)
{
    element* nouv = malloc(sizeof(element)); //allocating memory for the new element
    if (nouv == NULL) exit(EXIT_FAILURE);

    nouv->value = v;
    nouv->suivant = p1->tete;

    p1->tete = nouv;
}

int depiler(pile* p1)
{
    // if the stack is has no elements
    if (p1->tete == NULL) // Don't do p1 == NULL, we are checking if the head is NULL not the pile struct
    {
        printf("The stack is empty, no elements to pop, End the program\n");
        exit(EXIT_FAILURE);
    }

    int v = p1->tete->value;  // store the value you are going to pop;
    element* tmp = p1->tete;  // store the address of the old head
    
    p1->tete = p1->tete->suivant; // make the next element in the stack be the new head
    free(tmp);  // free the old head
    return v; // return the value in the old head
}


void afficher_pile(pile* p1)
{
    if (p1->tete == NULL)
    {
        printf("The list is empty nothing to show.\n");
    }
    else
    {
        element* ptr = p1->tete;

        while(ptr != NULL)
        {
            printf("%d--> ", ptr->value);
            ptr = ptr->suivant;
        }
        printf("NULL\n");
    }
}

//EX2


typedef struct 
{
    element* tete;
} file;


void enfiler(file* f1, int v)
{
    element* nouv = malloc(sizeof(element));
    if (nouv ==  NULL) exit(EXIT_FAILURE);

    nouv->value = v;
    nouv->suivant = NULL;

    if (f1->tete == NULL)
    {
        f1->tete = nouv;
    }
    else
    {
        element* ptr = f1->tete;

        while(ptr->suivant != NULL)
        {
            ptr = ptr->suivant;
        }
        ptr->suivant = nouv;
    }
}

int defilier(file* f1)
{

    if (f1->tete == NULL)
    {
        printf("The queue is empty, nothing to dequeue, exiting the program.\n");
        exit(EXIT_FAILURE);
    }
    

    int v = f1->tete->value; // save the value you want to dequeue
    element* tmp = f1->tete; // save the old head

    f1->tete = f1->tete->suivant; // make the next element be the new head
    free(tmp); // free the old head
    return v;
}


void afficher_file(file* f1)
{
    if (f1->tete == NULL)
    {
        printf("The queue is empty, nothing to show.\n");
        return;
    }

    element* ptr  = f1->tete;
    while (ptr != NULL)
    {
        printf("%d--> ", ptr->value);
        ptr = ptr->suivant;
    }
    printf("NULL\n");
}

//EX3

void inverser_file(file* f1)
{
    if (f1->tete == NULL) return; // if queue is empty

    pile* p1 = malloc(sizeof(pile)); // creating a temp stack
    if (p1 == NULL) exit(EXIT_FAILURE);
    p1->tete = NULL;

    element* ptr = f1->tete;

    while(ptr != NULL)
    {
        empiler(p1, defilier(f1));
        ptr = ptr->suivant;
    }

    element* ptr2 = p1->tete;

    while(ptr2 != NULL)
    {
        enfiler(f1, depiler(p1));    
        ptr2 = ptr2->suivant;
    }
}

int main(void)
{
    /*EX1
    pile* p1 = malloc(sizeof(pile));
    if(p1 == NULL) exit(EXIT_FAILURE);
    p1->tete = NULL;

    afficher(p1);
    empiler(p1, 1);
    empiler(p1, 2);
    empiler(p1, 3);
    empiler(p1, 4);
    afficher(p1);
    depiler(p1);
    afficher(p1);
    */
   
    /* EX2
    file* f1 = malloc(sizeof(file));
    if (f1  == NULL) exit(EXIT_FAILURE);
    f1->tete = NULL;

    afficher(f1);
    enfiler(f1, 1);
    enfiler(f1, 2);
    enfiler(f1, 3);
    enfiler(f1, 4);
    afficher(f1);
    defilier(f1);
    afficher(f1);
    */

    //EX3
    file* f2 = malloc(sizeof(pile));
    if(f2 == NULL) exit(EXIT_FAILURE);
    f2->tete = NULL;

    enfiler(f2, 10);
    enfiler(f2, 20);
    enfiler(f2, 30);
    enfiler(f2, 40);

    afficher_file(f2);
    inverser_file(f2);
    afficher_file(f2);

}

