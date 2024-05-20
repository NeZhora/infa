global main
extern printf
extern qsort

section .data
    arr dd 4, 12, 57, 69
    len dd 4
    fmt db "%d, %d, %d, %d", 10, 0


section .text
my_cmp:
    mov eax, [esp+4]
    mov ecx, [esp+8]
    mov ax, [eax]
    mov cx, [ecx]
    
    cmp ax, cx
    jl lesser
    jz equal
    jg greater
    
    lesser:
    mov eax, -1
    ret
    
    equal:
    xor eax, eax
    ret
    
    greater:
    mov eax, 1
    ret
    
main:
    mov ecx, arr
    push my_cmp
    
    push dword [len]
    push dword [len]
    
    push arr
    call qsort
    push arr
    push fmt
    call printf
   
    add esp, 0x14
    xor eax, eax
    ret
    
        
