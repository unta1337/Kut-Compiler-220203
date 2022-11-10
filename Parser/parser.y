%{
    #include <stdio.h>

    void yyerror(char*);
    int yylex(void);
%}

%union
{
    int num;
    char sym;
}

%token<num> NUMBER
%token ADD SUB MUL DIV
%token ABS
%token OP CP
%token EOL

%type<num> exp
%type<num> factor
%type<num> term

%%
    input:
        line
        | line input;

    line:
        exp EOL { printf("= %d\n", $1); }
        | EOL;

    exp:
        factor
        | exp ADD factor { $$ = $1 + $3; }
        | exp SUB factor { $$ = $1 - $3; };

    factor:
        term
        | factor MUL term { $$ = $1 * $3; }
        | factor DIV term { $$ = $1 / $3; };

    term:
        NUMBER;
        | ABS exp ABS { $$ = $2 > 0 ? $2 : -$2; }
        | OP exp CP { $$ = $2; };
%%

int main(int argc, char* argv[])
{
    yyparse();

    return 0;
}

void yyerror(char* s)
{
    printf("Error: %s\n", s);
}