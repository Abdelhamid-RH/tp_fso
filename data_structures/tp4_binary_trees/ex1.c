#include <stdio.h>
#include <stdlib.h>
#include <string.h>



typedef struct
{
    int num_inscription;
    char nom[100];
    char prenom[100];
    float moyenne_generale;
} etudiant;


typedef struct node node;
struct node
{
    etudiant info;
    node* fils_g;
    node* fils_d;
};


typedef struct
{
    node* racine;
} arbre;


node* creer_node(int num_inscription1, char* nom1, char* prenom1, float moyenne_generale1)
{
    node* nouv = malloc(sizeof(node));
    if (nouv == 0) exit(EXIT_FAILURE);

    

    nouv->info.num_inscription = num_inscription1;
    nouv->info.moyenne_generale = moyenne_generale1;
    strcpy(nouv->info.nom, nom1);
    strcpy(nouv->info.prenom, prenom1);

    return nouv;
}



void inserer(node** racp, node* nouv) 
{
    if (*racp == NULL)
    {
        *racp = nouv;
    }
    else if (nouv->info.num_inscription > (*racp)->info.num_inscription)
    {
        inserer(&(*racp)->fils_d, nouv);
    }
    else if (nouv->info.num_inscription < (*racp)->info.num_inscription)
    {
        inserer(&(*racp)->fils_g, nouv);
    }
    else
    {
        printf("this student is already in the tree!\n");
        return;
    }
}


void prefixe(node* rac1)
{
    if (rac1 == NULL)
    {
        return;
    }
    else
    {
        printf("%d: %s %s : %f\n",rac1->info.num_inscription, rac1->info.prenom, rac1->info.nom, rac1->info.moyenne_generale);
    }

    prefixe(rac1->fils_g);
    prefixe(rac1->fils_d);
}


void infixe(node* rac1)
{
    if (rac1 == NULL)
    {
        return;
    }
    
    infixe(rac1->fils_g);
    printf("%d: %s %s : %f\n",rac1->info.num_inscription, rac1->info.prenom, rac1->info.nom, rac1->info.moyenne_generale);
    infixe(rac1->fils_d);

}

void postfixe(node* rac1)
{
    if (rac1 == NULL)
    {
        return;
    }
    
    postfixe(rac1->fils_g);
    postfixe(rac1->fils_d);
    printf("%d: %s %s : %f\n",rac1->info.num_inscription, rac1->info.prenom, rac1->info.nom, rac1->info.moyenne_generale);
    

}


node* rechercher(int id, node* rac1)
{
    if (rac1 == NULL)
    {
        printf("not found\n");
        return NULL;
    }

    if (rac1->info.num_inscription == id)
    {
        return rac1;
    }
    else if (id > rac1->info.num_inscription)
    {
        return rechercher(id, rac1->fils_d);
    }
    else
    {
        return rechercher(id, rac1->fils_g);
    }
}

int main(void)
{
    arbre* arb1 = malloc(sizeof(arbre));
    if (arb1 == NULL) exit(EXIT_FAILURE);

    arb1->racine = NULL;

    inserer(&arb1->racine, creer_node(50, "Amrani", "Salma", 15.5));
    inserer(&arb1->racine, creer_node(30, "Bennis", "Youssef", 13.5));
    inserer(&arb1->racine, creer_node(70, "Idrissi", "Sara", 17));
    inserer(&arb1->racine, creer_node(20, "Alaoui", "Adam", 12));
    inserer(&arb1->racine, creer_node(40, "Mansouri", "Lina", 16));
    inserer(&arb1->racine, creer_node(60, "Karim", "Omar", 14.5));
    inserer(&arb1->racine, creer_node(80, "Tazi", "Aya", 18));
    
    postfixe(arb1->racine);

    node* tmp = rechercher(30, arb1->racine);

    printf("%s\n", tmp->info.nom);
}

