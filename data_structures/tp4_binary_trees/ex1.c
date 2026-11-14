#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    int id;
    char* nom;
    char* prenom;
    float moyenne;
} etudiant;

typedef struct node node;
struct node
{
    etudiant  info;
    node* fils_g;
    node* fils_d;
};

typedef struct arbre arbre;
struct arbre
{
    node* root;
};


node* creer_node(int id1, char* nom1, char* prenom1, float moyenne1)
{
    node* nouv = malloc(sizeof(node));
    if (nouv == NULL) exit(EXIT_FAILURE);

    nouv->info.id = id1;
    nouv->info.nom = nom1;
    nouv->info.prenom = prenom1;
    nouv->info.moyenne = moyenne1;

    return nouv;
}

// EX2

void inserer(arbre* ar1, node* nd1)
{

    if (ar1->root == NULL)
    {
        ar1->root = nd1;
        ar1->root->fils_d = NULL;
        ar1->root->fils_g = NULL;
        return;
    }
    
    if (nd1->info.id > ar1->root)
    {
        inserer(nd1->fils_d, nd1);

    }
    else if (nd1->info.id > ar1->root)
    {
        inserer(nd1->fils_g, nd1);
    }
    else
    {
        printf("already in the tree\n");
    }
}

int main(void)
{
    
}