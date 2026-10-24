#include<stdio.h>
#include<stdlib.h>

typedef struct Element Element;

struct Element
{
    int val;
    Element* p_suivant;
};

typedef struct Pile Pile;

struct Pile
{
    Element* sommet;
};


void emplier(Pile* pile1, int valeur )
{

    Element* nouveau_element = malloc(sizeof(Element*));
    nouveau_element->val = valeur;

    if (pile1->sommet == NULL)
    {
        pile1->sommet = nouveau_element;
        nouveau_element->p_suivant = NULL;
        return;
    }
    
    nouveau_element->p_suivant = pile1->sommet;
    pile1->sommet = nouveau_element;
}

void depiler(Pile* pile1)
{

    if(pile1->sommet == NULL)
    {
        printf("the stack is empty\n");
        return;
    }

    Element* tmp = pile1->sommet;
    pile1->sommet = pile1->sommet->p_suivant;
    free(tmp); 
}


void afficher(Pile* pile1)
{
    Element* ptr = pile1->sommet;

    if (ptr == NULL)
    {
        printf("the satck is empty\n");
        return;
    }

    while (ptr != NULL)
    {
        printf("%d --> ", ptr->val);
        ptr = ptr->p_suivant;
    }
    printf("NULL\n");

}

int main(void)
{

    Pile* pile1 = malloc(sizeof(Pile));
    pile1->sommet = NULL;

    emplier(pile1, 9);
    emplier(pile1, 6);
    emplier(pile1, 10);
    emplier(pile1, 11);
    depiler(pile1);
    afficher(pile1);
}