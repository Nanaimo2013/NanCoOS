; kernel/kernel.asm
BITS 16
ORG 0x1000

start:
    cli
    cld
    mov ax, 0x10
    mov ds, ax
    mov es, ax

    ; Switch to protected mode
    mov eax, cr0
    or eax, 0x1
    mov cr0, eax
    jmp 0x08:protected_mode

BITS 32
protected_mode:
    ; Set up the stack
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov esp, 0x9FFFF

    ; Call the C kernel
    call kmain

    hlt
