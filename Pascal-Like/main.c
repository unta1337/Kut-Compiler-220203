#include <stdio.h>

extern char* yytext;

extern int yyparse(void);

int main(int argc, char* argv[])
{
#if YYDEBUG
extern int yydebug;
yydebug = 1;
#endif
    yyparse();
}

void yyerror(char* str)
{
    fprintf(stderr, "error: %s\n", str);
    fprintf(stderr, "       \"%s\"\n", yytext);
    fprintf(stderr, "       [%d]\n", *yytext);
}
