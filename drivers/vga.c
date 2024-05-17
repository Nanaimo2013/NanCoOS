// drivers/vga.c
#include "vga.h"

void vga_clear() {
    unsigned char *video = (unsigned char*)0xB8000;
    for (int i = 0; i < 80 * 25 * 2; i += 2) {
        video[i] = ' ';
        video[i + 1] = 0x07; // White text on black background
    }
}

void vga_puts(const char *str) {
    unsigned char *video = (unsigned char*)0xB8000;
    unsigned int i = 0;
    while (str[i] != '\0') {
        video[i * 2] = str[i];
        video[i * 2 + 1] = 0x07; // White text on black background
        i++;
    }
}
