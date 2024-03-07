    mov ah, 0x00
    ;VGA mode 0x13
    ;320x200 256 colors

    mov al,0x13
    int 0x10
    
    mov ax, 0xA000
    mov es, ax
    mov bx,0

loop:
    mov BYTE [es:bx], 0x0F
    inc ax
    cmp ax, 64000
    jb loop


    ;mov ah, 0x0e ;function number = 0Eh: Display character

    ;mov al, 'H' ; code of character to display
    ;int 0x10 ; BIOS video interrupt
    ;mov al, 'e'
    ;int 0x10
    ;mov al, 'l'
    ;int 0x10
    ;mov al, 'i'
    ;int 0x10
    ;mov al, 'o'
    ;int 0x10


    ;jmp $ ; jmp loop

    times 510-($-$$) db 0 ;$ - current address $$-start address.

    dw 0xaa55