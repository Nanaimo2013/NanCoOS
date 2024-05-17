// kernel/kernel.c
void kmain(void) {
    const char *str = "Welcome to ROBCO Industries (TM) Termlink\nClearance: VAULT-TEC SECURITY";
    unsigned char *video = (unsigned char*)0xB8000;
    unsigned int i = 0;
    while (str[i] != '\0') {
        video[i * 2] = str[i];
        video[i * 2 + 1] = 0x07; // White text on black background
        i++;
    }

    while (1) {
        // Halt the CPU
        asm volatile ("hlt");
    }
}
