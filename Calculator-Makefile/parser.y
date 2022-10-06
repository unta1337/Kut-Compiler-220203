/* simplest version of calculator */
%{
    #include <stdio.h>

    void yyerror(char*);
    int yylex(void);
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS OP CP
%token EOL

%%
    calclist:
        exp EOL { printf("= %d\n", $1); }
        | calclist exp EOL { printf("= %d\n", $2); };

    exp:
        factor { $$ = $1; }
        | exp ADD factor { $$ = $1 + $3; }
        | exp SUB factor { $$ = $1 - $3; };

    factor:
        term { $$ = $1; }
        | factor MUL term { $$ = $1 * $3; }
        | factor DIV term { $$ = $1 / $3; };

    term:
        NUMBER { $$ = $1; }
        | ABS term { $$ = $2 >= 0? $2 : - $2; };
        | OP exp CP { $$ = $2; };
%%

int main(int argc, char* argv[])
{
    yyparse();
}

void yyerror(char* str)
{
    fprintf(stderr, "error: %s\n", str);
}