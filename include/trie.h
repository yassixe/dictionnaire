#ifndef __TRIE__
#define __TRIE__



typedef unsigned char uint_8;
typedef struct trie{
    uint_8 lettre;
    uint_8 is_final;
    struct trie* children[26];
}__attribute__((packed)) trie;

trie* create_trie(uint_8 lettre, uint_8 final);
trie** get_child(trie* t, uint_8 lettre);
trie*  add_child(trie* t,uint_8 lettre, uint_8 final);
//function to be removed
void print_trie(trie* trie);
void open_file(void);
#endif