; boot/boot.asm
BITS 16
ORG 0x7C00

start:
    cli
    cld

    ; Set video mode to 80x25 color text mode
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    ; Set up stack
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    ; Load data segment
    mov ax, 0x07C0
    mov ds, ax

    ; Print welcome message
    mov si, message        ; Load address of message into SI
    mov cx, 0             ; Start color index from 0
print_loop:
    lodsb                  ; Load byte from SI into AL and increment SI
    test al, al            ; Check if AL is zero (end of string)
    jz end_print           ; If zero, end of string
    mov ah, 0x0E           ; BIOS teletype function
    mov bh, 0              ; Video page number
    int 0x10               ; Call BIOS interrupt
    inc cx                 ; Increment color index
    cmp cx, 5              ; Check if color index reached max (5)
    jne not_reset_color    ; If not, continue
    mov cx, 0              ; Reset color index to 0
not_reset_color:
    jmp print_loop         ; Repeat until end of string
end_print:

    ; Load the kernel
    mov ax, 0x1000
    mov es, ax
    mov bx, 0x0000
    mov ah, 0x02
    mov al, 0x01
    mov ch, 0x00
    mov cl, 0x02
    mov dh, 0x00
    mov dl, 0x80
    int 0x13

    jmp 0x1000:0000

times 510-($-$$) db 0
dw 0xAA55

message:
    db '██╗   ██╗██████╗ ██╗     ███████╗', 0   ; Null-terminated message line 1
    db '██║   ██║██╔══██╗██║     ██╔════╝', 0   ; Null-terminated message line 2
    db '██║   ██║██████╔╝██║     █████╗  ', 0   ; Null-terminated message line 3
    db '██║   ██║██╔═══╝ ██║     ██╔══╝  ', 0   ; Null-terminated message line 4
    db '╚██████╔╝██║     ███████╗███████╗', 0   ; Null-terminated message line 5
    db ' ╚═════╝ ╚═╝     ╚══════╝╚══════╝', 0   ; Null-terminated message line 6
    db 'Welcome to NansCoOS!', 0   ; Null-terminated message line 7
