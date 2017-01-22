#include <unistd.h>
#define printf(...) dprintf(STDOUT_FILENO, __VA_ARGS__)
