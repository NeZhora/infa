global main
extern printf


section .data
  arr dd 4, 12, -81, -82, 286, 4, -1, -3, -13, 0, 69, 57, -5
  fmt db "min: %d, max: %d, sum: %d, count: %d", 10, 0

  min dd 0
  max dd 0xffffffff
  sum dd 0
  count dd 0

section .text
  main:
    mov ecx, arr

    main_loop:
      mov eax, [ecx]
      cmp eax, 0

      jz end_main_loop
      jg pos

      add [sum], eax
      inc dword [count]

      cmp dword [min], eax
      jle less
      mov [min], eax
      less:
        
      cmp dword [max], eax
      jge greater
      mov [max], eax
      greater:  

      pos:
        lea ecx, [ecx + 4]

      jmp main_loop
    end_main_loop:

    push dword [count]
    push dword [sum]
    push dword [max]
    push dword [min]
    push fmt
    call printf
    add esp, 0x14
    
    xor eax, eax
    ret
