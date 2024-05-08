// kernel.c

void main() {
    // Print message
    char* message = "Welcome to NansStudioOS!";
    while (*message != '\0') {
        // Print each character of the message
        // (Note: this is a very basic example)
        putchar(*message);
        message++;
    }
    // Infinite loop to prevent the kernel from exiting
    while (1) {}
}
