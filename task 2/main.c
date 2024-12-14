#include "Util.h"
#include <stdlib.h>

void infection();
void infector(char *name);

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        write(1, "the number of argument doesn't fit: program -a{file}\n", 24);
        return 1;
    }

    char *name = NULL;
    int i;
    for (i = 1; i < argc; i++)
    {
        if (argv[i][0] == '-' && argv[i][1] == 'a')
        {
            name = argv[i] + 2;
            break;
        }
    }

    if (name)
    {
        write(1, "File: ", 6);
        write(1, name, strlen(name));
        write(1, "\n", 1);
        infection();
        infector(name);
    }
    else
    {
        write(1, "No file specified\n", 19);
    }

    return 0;
}