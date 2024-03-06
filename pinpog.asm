loop:
    jmp loop

    times 510-($-$$) db 0 ;$ - current address $$-start address.

    dw 0xaa55