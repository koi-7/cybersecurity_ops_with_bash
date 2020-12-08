#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char combined[50] = "";
    strcat(combined, argv[1]);
    strcat(combined, " ");
    strcat(combined, argv[2]);
    printf("The two arguments combined is: %s\n", combined);

    return 0;
}
