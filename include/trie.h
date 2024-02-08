#ifndef __TRIE__
#define __TRIE__



typedef unsigned char uint_8;
typedef struct trie{
    uint_8 lettre;
    uint_8 is_final;
    struct trie* children[26];
}__attribute__((packed)) trie;

trie* create_trie(uint_8 lettre);


//function to be removed
void print_trie(trie* trie);

#endif