#include <stdio.h>
#include <stdlib.h>
#include "trie.h"


void print_trie(trie* t){
    printf("%d",t->lettre);
    return;
}

int main(void){
    trie* t = create_trie(65);
    print_trie(t);
    return 0;
}