#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    char nom[100];
    char prenom[100];
    int num_inscription;
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


node* creer_node(char* nom1, char* prenom1, int num_inscription1, float moyenne_generale1)
{
    node* nouv = malloc(sizeof(node));
    if (nouv == NULL) exit(EXIT_FAILURE);

    nouv->info.num_inscription = num_inscription1;
    nouv->info.moyenne_generale = moyenne_generale1;
    strcpy(nouv->info.nom, nom1);
    strcpy(nouv->info.prenom, prenom1);

    nouv->fils_g = NULL;
    nouv->fils_d = NULL;

    return nouv;
}


void inserer(node** rac1, node* nouv)
{
    if (*rac1 == NULL)
    {
        *rac1 = nouv;
    }
    else if (nouv->info.num_inscription > (*rac1)->info.num_inscription)
    {
        inserer(&(*rac1)->fils_d, nouv);
    }
    else if (nouv->info.num_inscription < (*rac1)->info.num_inscription)
    {
        inserer(&(*rac1)->fils_g, nouv);
    }
    else
    {
        printf("Error, the student already exists!");
    }
}


// print the root then show the left subtree then show the right subtree
void prefixe(node* ptr) // used to cpy
{
    if (ptr == NULL) return;

    printf("%d--> ", ptr->info.num_inscription);
    prefixe(ptr->fils_g);
    prefixe(ptr->fils_d);
}


// show the left subtree untill you're done then print the root then show the right subtree
void infixe(node* ptr) // used to show in order
{
    if (ptr == NULL)
    {
        return;
    }

    infixe(ptr->fils_g);
    printf("%d--> ", ptr->info.num_inscription); 
    infixe(ptr->fils_d);
}


// show the left subtree then the right subtree then print the root
void postefixe(node* ptr) // used to delete
{
    if (ptr == NULL) return;

    postefixe(ptr->fils_g);
    postefixe(ptr->fils_d);
    printf("%d--> ", ptr->info.num_inscription);
}


node* rechercher(node* race1, int num1)
{
    if (race1 == NULL)
    {
        return NULL;
    }
    
    if (num1 == race1->info.num_inscription)
    {
        return race1;
    }
    else if (num1 > race1->info.num_inscription)
    {
        return rechercher(race1->fils_d, num1);
    }
    else // if (race1->info.num_inscription < num1)
    {
        return rechercher(race1->fils_g, num1);
    }
}
    

void afficher_etudiant(node* etud1)
{
    printf("ID: %d, nom: %s, prenom: %s, note: %.2f\n", etud1->info.num_inscription, etud1->info.nom, etud1->info.prenom, etud1->info.moyenne_generale);
}


int hauteur(node* race1)
{
    if (race1 == NULL)
    {
        return 0;
    }

    int a = hauteur(race1->fils_g);
    int b = hauteur(race1->fils_d);

    if (a >= b) 
    {
        return a + 1;
        
    }
    else
    {
        return b + 1;
    }
}

int nombre_node(node* race1)
{
    if (race1 == NULL)
    {
        return 0;
    }

    return 1 + nombre_node(race1->fils_g) + nombre_node(race1->fils_d);
}


int nombre_feu(node* race1)
{
    if (race1 == NULL)
    {
        return 0;
    }
    else if (race1->fils_g == NULL && race1->fils_d == NULL)
    {
        return 1;
    }

    return nombre_feu(race1->fils_g) + nombre_feu(race1->fils_d);
}


int nombre_inter(node* race1)
{
    if (race1 == NULL || (race1->fils_g == NULL && race1->fils_d == NULL))
    {
        return 0;
    }
     return 1 + nombre_inter(race1->fils_g) + nombre_inter(race1->fils_d);
}


 // I stopped at exercise 6 ,,,,, look for lafr9 bin binary tree and binary search tree


int main(void)
{
    arbre* arb1 = malloc(sizeof(arbre));
    if (arb1 == NULL) exit(EXIT_FAILURE);
    
    arb1->racine = NULL;

    inserer(&arb1->racine, creer_node("Amrani",   "Salma",   50, 15.5));
    inserer(&arb1->racine, creer_node("Bennis",   "Youssef", 30, 13.5));
    inserer(&arb1->racine, creer_node("Idrissi",  "Sara",    70, 17));
    inserer(&arb1->racine, creer_node("Alaoui",   "Adam",    20, 12));
    inserer(&arb1->racine, creer_node("Mansouri", "Lina",    40, 16));
    inserer(&arb1->racine, creer_node("Karim",    "Omar",    60, 14.5));
    inserer(&arb1->racine, creer_node("Tazi",     "Aya",     80, 18));

    prefixe(arb1->racine);
    printf("NULL\n");

    infixe(arb1->racine);
    printf("NULL\n");

    postefixe(arb1->racine);
    printf("NULL\n");

    afficher_etudiant(rechercher(arb1->racine, 30));

    printf("the height of the tree is %d\n", hauteur(arb1->racine));

    printf("the number of students is %d\n", nombre_node(arb1->racine));

    printf("the number of leaves is %d\n", nombre_feu(arb1->racine));

    printf("the number of leaves with at least one child %d\n", nombre_inter(arb1->racine));

    supprimer(rechercher(arb1->racine, 30));

    infixe(arb1->racine);
    printf("NULL\n");
}