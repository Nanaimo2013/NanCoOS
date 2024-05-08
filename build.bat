@echo off

rem Assemble bootloader
nasm -f bin bootloader.asm -o bootloader.bin

rem Compile kernel
gcc -ffreestanding -c kernel.c -o kernel.o

rem Link kernel
ld -o kernel.bin -T linker.ld kernel.o --oformat binary

rem Combine bootloader and kernel into bootable image
copy /B bootloader.bin+kernel.bin os.img
