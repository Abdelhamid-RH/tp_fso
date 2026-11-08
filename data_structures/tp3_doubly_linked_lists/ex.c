#include <stdio.h>
#include <stdlib.h>

//EX1

typedef struct Livre Livre;
struct Livre
{
    int id;
    char* titre;
    char* auteur;
    int annee;
    int nombre_exemplaire;
};

typedef struct Cellule Cellule;
struct Cellule 
{
    Livre info;
    Cellule* prec;
    Cellule* suiv;

};

typedef struct Liste Liste;
struct Liste
{
    Cellule* tete;
};


Cellule* creerCellule(Livre* liv1)
{
    Cellule* cel1 = malloc(sizeof(Cellule));
    if (cel1 == NULL) exit(EXIT_FAILURE);
    
    cel1->info = *liv1;
    return cel1;
}


Livre* creerLivre(int id1 , char* titre1, char* auteur1, int annee1, int nombre_exemplaire1)
{                                                                                   
    Livre* liv1 = malloc(sizeof(Livre));
    if (liv1 == NULL) exit(EXIT_FAILURE);


    liv1->id = id1;
    liv1->titre = titre1;
    liv1->auteur = auteur1;
    liv1->annee = annee1;
    liv1->nombre_exemplaire = nombre_exemplaire1;

    return liv1;
}


//EX2
void insererDebut(Liste* lis1, Livre* liv1)
{
    Cellule* cel1 = creerCellule(liv1);

    cel1->prec = NULL;
    cel1->suiv = lis1->tete;

    if (lis1->tete != NULL)
    {
        lis1->tete->prec = cel1;
    }

    lis1->tete = cel1;  
}


void insererFin(Liste* lis1, Livre* liv1)
{
    Cellule* cel1 = creerCellule(liv1);
    cel1->suiv = NULL;

    if (lis1->tete == NULL)
    {
        lis1->tete = cel1;
        cel1->prec = NULL;
        return;
    }

    Cellule* ptr = lis1->tete;

    while (ptr->suiv != NULL)
    {
        ptr = ptr->suiv;
    }

    cel1->prec = ptr;
    ptr->suiv = cel1;
}


void insererApres(Liste* lis1, Livre* liv1, int id1)
{
    Cellule* cel1 = creerCellule(liv1);

    if (lis1->tete == NULL) // if the list is empty
    {
        insererFin(lis1, liv1);
        return;
    }


    Cellule* ptr = lis1->tete; //  ptr is the cell with the given id

    while (ptr->info.id != id1)
    {
        ptr = ptr->suiv;
        if(ptr == NULL) // if you reach the end without finding the id
        {
            printf("the book of id: %d was not found!", id1);
            return; 
        }
    }

    if (ptr->suiv == NULL) // if ptr is the last cell
    {
        insererFin(lis1, liv1);
        return;
    }

    cel1->suiv = ptr->suiv;
    cel1->prec = ptr;


    ptr->suiv->prec = cel1;
    ptr->suiv = cel1;
}

int main(void)
{
    
}

