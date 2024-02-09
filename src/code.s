.equ TRIE_STRUCT_SIZE, 106
.equ ASCII_A, 97
.extern calloc
.section .note.GNU-stack

.section .data
file : .asciz "/home/kali/Desktop/test_struct/src/file.txt"
flag : .asciz "r"
buffer : .byte 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
.section .text

.macro push_caller_regs
    push %eax
    push %ecx
    push %edx
.endm

.macro pop_caller_regs
    pop %edx
    pop %ecx
    pop %eax
.endm

.macro push_callee_regs
    push %ebx
    push %esi
    push %edi
.endm

.macro pop_callee_regs
    pop %edi
    pop %esi
    pop %ebx
.endm



.global open_file
open_file:
    push %ebp
    mov %esp,%ebp

    sub $4,%esp
    push $flag
    push $file
    call fopen
    add $8,%esp
    mov %eax,-4(%ebp)
loop__:
    push -4(%ebp)
    push $16
    push $buffer
    call fgets
    //the word address is in %eax
    //add it to the trie
    //exit the loop when we are at the end of the dictionary
    jmp loop__
    mov %ebp,%esp
    pop %ebp
    ret

.global create_trie
create_trie:
    push %ebp
    mov %esp,%ebp

    push $TRIE_STRUCT_SIZE
    push $1
    call calloc
    sub $8,%esp
    mov 8(%ebp),%ecx
    mov %ecx,(%eax)

    mov %ebp,%esp
    pop %ebp
    ret

//params:
//      -trie* root
//      -char* word
.global add_word
add_word:
    ret




// params:
//     trie* trie
//     char lettre
//     bool final
.global add_child
add_child:
    push %ebp
    mov %esp,%ebp
    push 8(%ebp)

    

    mov %ebp,%esp
    pop %ebp
    ret

// params:
//     char lettre
//     trie* ptrie
.global get_child
get_child:
    push %ebp
    mov %esp,%ebp

    mov 8(%ebp),%eax
    add $2,%eax
    mov 12(%ebp),%ecx
    sub $ASCII_A,%ecx
    add %ecx,%eax
    mov (%eax),%eax

    mov %ebp,%esp
    pop %ebp
    ret




