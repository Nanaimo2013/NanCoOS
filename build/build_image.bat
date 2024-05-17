@echo off
nasm -f bin boot/boot.asm -o boot.bin
nasm -f elf kernel/kernel.asm -o kernel.o
gcc -ffreestanding -m32 -c kernel/kernel.c -o kernel_c.o
ld -m elf_i386 -T build/linker.ld -o kernel.bin kernel.o kernel_c.o
copy /b boot.bin+kernel.bin disk.img
