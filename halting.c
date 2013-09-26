/* The Halting Solution */

extern int does_it_halt(void* program);

int main(int argc, char* argv) {
    while does_it_halt(main);
    return 0;
}
