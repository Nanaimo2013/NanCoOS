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

    jmp kernel_start

    times 510-($-$$) db 0
    dw 0xAA55

kernel_start:
    ; Print message
    mov si, message        ; Load address of message into SI
print_loop:
    lodsb                  ; Load byte from SI into AL and increment SI
    test al, al            ; Check if AL is zero (end of string)
    jz end_print           ; If zero, end of string
    mov ah, 0x0E           ; BIOS teletype function
    int 0x10               ; Call BIOS interrupt
    jmp print_loop         ; Repeat until end of string
end_print:

    ; Infinite loop
    jmp $
    
message:
    db 'Welcome to NansStudioOS!', 0   ; Null-terminated message
