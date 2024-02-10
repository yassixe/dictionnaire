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
    push %ecx
    push %edx
.endm

.macro pop_caller_regs
    pop %edx
    pop %ecx
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
    push_caller_regs
    push $flag
    push $file
    call fopen
    add $8,%esp
    pop_caller_regs
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

    push_caller_regs
    push $TRIE_STRUCT_SIZE
    push $1
    call calloc
    add $8,%esp
    pop_caller_regs

    mov 8(%ebp),%ecx
    movb %cl,(%eax) 
    mov 12(%ebp),%ecx
    movb %cl,1(%eax) 

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
//     trie* trie   ebp+8
//     char lettre  ebp+12
//     bool final   ebp+16
.global add_child
add_child:
    push %ebp
    mov %esp,%ebp

    push_caller_regs
    push 12(%ebp)
    push 8(%ebp)
    call get_child
    add $8,%esp
    pop_caller_regs
    mov (%eax),%edx
    or %edx,%edx
    jz not_child 
    mov %edx,%eax
    mov %ebp,%esp
    pop %ebp
    ret
not_child:
    mov %eax,%edx
    push_caller_regs
    push 16(%ebp)
    push 12(%ebp)
    call create_trie
    add $8,%esp
    pop_caller_regs
    mov %eax,(%edx) 
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
    shl $2,%ecx
    add %ecx,%eax

    mov %ebp,%esp
    pop %ebp
    ret




