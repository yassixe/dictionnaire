.equ TRIE_STRUCT_SIZE, 106
.extern calloc
.section .note.GNU-stack

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
