#include <stdio.h>
#include <stdlib.h>

typedef struct element element;
struct element
{
    int value;
    element* suivant; 
};

typedef struct file file;
struct file
{
    element* tete;
};




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

void reverse(file* f1)
{
    element* ptr1 = NULL;
    element* ptr2 = NULL;
    element* ptr3 = NULL;

    if (f1->tete == NULL || f1->tete->suivant == NULL)
    {
        return;
    }
    if (f1->tete->suivant->suivant == NULL)
    {
        f1->tete->suivant->suivant = f1->tete;
        f1->tete = f1->tete->suivant;
        f1->tete->suivant->suivant = NULL;
        return;
    }

    ptr1 = f1->tete;
    ptr2 = ptr1->suivant;
    ptr3 = ptr2->suivant;
    f1->tete->suivant = NULL;
    
    while(1==1)
    {
        if (ptr3->suivant == NULL)
        {
            f1->tete = ptr3;
            ptr3->suivant = ptr2;
            ptr2->suivant = ptr1;
            break;
        }
        else if (ptr3->suivant->suivant == NULL)
        {
            f1->tete = ptr3->suivant;
            ptr3->suivant->suivant = ptr3;
            ptr3->suivant = ptr2;
            ptr2->suivant = ptr1;
            break;
        }
        else if (ptr3->suivant->suivant->suivant == NULL)
        {
            f1->tete = ptr3->suivant->suivant;
            ptr3->suivant->suivant->suivant = ptr3->suivant;
            ptr3->suivant->suivant = ptr3; 
            ptr3->suivant = ptr2;
            ptr2->suivant = ptr1;
            break;
        }

        ptr2->suivant = ptr1;
        ptr1 = ptr3->suivant;
        ptr3->suivant = ptr2;
        ptr2 = ptr1->suivant;
        ptr1->suivant = ptr3;
        ptr3 = ptr2->suivant;
    }
 
}

int main(void)
{
    file* f1 = malloc(sizeof(file));
    if(f1 == NULL) exit(EXIT_FAILURE);
    f1->tete = NULL;

    enfiler(f1, 1);
    enfiler(f1, 2);
    

    afficher_file(f1);
    reverse(f1);
    afficher_file(f1);
}