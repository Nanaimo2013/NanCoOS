; bootloader.asm

[BITS 16]
[ORG 0x7C00]

start:
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    mov ax, 0x07C0
    mov ds, ax

    ; Your bootloader code here

    jmp $

    times 510-($-$$) db 0
    dw 0xAA55
