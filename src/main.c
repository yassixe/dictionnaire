#include <stdio.h>
#include <stdlib.h>
#include "trie.h"


void print_trie(trie* t){
    printf("%d",t->lettre);
    return;
}

void print(trie* t){
    printf("lettre : %c\n",(uint_8)t->lettre);
    for(int i=0; i<26; i++){
        printf("%d,",t->children[i]!=NULL);
    }
    printf("\n");
    printf("final : %d\n",t->is_final);
}

int main(void){
    trie* t = create_trie((uint_8)'t',0);
    add_child(t,'a',0);
    print(t);
    // open_file();
    
    return 0;
}