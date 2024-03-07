    org 0x7C00
%define ROW 10
%define WIDTH 320
%define HEIGHT 200    

%define BALL_WIDTH 20
%define BALL_HEIGHT 10

    mov ah, 0x00 ; the value in ah specifies the function number for setting the video mode.
    ;VGA mode 0x13
    ;320x200 256 colors

    mov al,0x13 ;this is the video mode number, where 0x13 stands for 320*200 resolution within 256 colors(a standard 256 graphics model)
    int 0x10  ;triggers the BIOS interrupt fro video services, since AH is 0 and AL is 0x13, this interrupt sets the VGA graphics mode
    
    mov ax, 0xA000 ; this value is the segment address frot he VGA graphics memory.
    mov es, ax

    mov ax,50
    mov bx, 50
    call draw_ball

    jmp $
; loop:
;     mov BYTE [es:bx], 0x0E
;     inc bx
;     cmp bx,  WIDTH * ROW + WIDTH
;     jb loop


   


;     jmp $ ; jmp loop


draw_ball:
    ;ax - row (y) cx
    ;bx - column (x) dx
    mov [i0], ax
    mov [j0], bx 

    mov word[i], 0 

draw_ball_i    ;row
    mov word [j], 0

draw_ball_j:
    mov ax, WIDTH
    mov bx, [i]
    add bx, [i0]
    mul bx
    mov bx, ax
    add bx, [j]
    add bx, [j0]
    mov BYTE [es: bx], 0x0B

    inc word [j]
    cmp word [j], BALL_WIDTH
    jb draw_ball_j

    inc word[i]
    cmp word[i], BALL_HEIGHT
    jb draw_ball_i

    ret


i: dw 0
j: dw 0
i0:dw 0
j0: dw 0
;hello : db "Hello, World",0

    times 510-($-$$) db 0 ;$ - current address $$-start address.

    dw 0xaa55