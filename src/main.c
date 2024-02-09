#include <stdio.h>
#include <stdlib.h>
#include "trie.h"


void print_trie(trie* t){
    printf("%d",t->lettre);
    return;
}

int main(void){
    trie* t = create_trie((uint_8)'t');
    t->children[1]=(trie*)4;
    printf("is child %d\n",is_child(t,(uint_8)'a'));
    open_file();
    print_trie(t);
    return 0;
}