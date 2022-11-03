#include <stdio.h>

int main()
{
        return(yyparse());
}

void yyerror(char *s)
{
        fprintf(stderr, "Error : Exiting %s\n", s);
}

