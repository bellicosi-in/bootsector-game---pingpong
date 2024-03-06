    mov ah, 0x0e ;function number = 0Eh: Display character

    mov al, 'H' ; code of character to display
    int 0x10 ; BIOS video interrupt
    mov al, 'e'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'i'
    int 0x10
    mov al, 'o'
    int 0x10


    jmp $ ; jmp loop

    times 510-($-$$) db 0 ;$ - current address $$-start address.

    dw 0xaa55