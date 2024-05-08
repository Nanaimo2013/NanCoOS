// kernel.c

void main() {
    // Alternative kernel code
    int i;
    for (i = 0; i < 10; i++) {
        // Print numbers from 0 to 9
        // (Note: this is a very basic example)
        putchar('0' + i);
        putchar(' ');
    }
    // Infinite loop to prevent the kernel from exiting
    while (1) {}
}
