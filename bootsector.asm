loop:                                   ;label
    jmp loop                            ;use a simple cpu instruction that jumps to a new memory address to continue execution. in our case, jump to the 
                                        ;address of the current instruction

times 510 - ($ - $$) db 0               ;when compiled our program must fit into 512 bytes, with the last two bytes being the magic number,
                                        ;so here, tell our assembly compiler to pad out our program with enough zero bytes (db 0) to bring us to the 512 byte


dw 0xaa55                               ;last two bytes (one word) form the magic number, so BIOS knows we are a boot sector.