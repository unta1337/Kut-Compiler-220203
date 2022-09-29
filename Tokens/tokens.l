/* recognize tokens for the calculator and print them out */
%{
    enum yytokentype
    {
        NUMBER = 258,
        ADD = 259,
        SUB = 260,
        MUL = 261,
        DIV = 262,
        ABS = 263,
        EOL = 264
    };
    
    char* value_of(enum yytokentype tokenType);

    int yylval;
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n { return EOL; }
[ \t] { /* ignore whitespace */ }
. { printf("Mystery character %c\n", *yytext); }
%%

int main(int argc, char* argv[])
{
    int tok;
    while(tok = yylex())
    {
        printf("Token Type: %s", value_of(tok));
        if (tok == NUMBER)
            printf(" = %d\n", yylval);
        else
            printf("\n");
    }
}

char* value_of(enum yytokentype tokenType)
{
    switch (tokenType)
    {
        case NUMBER:
            return "Num";
        case ADD:
            return "Add";
        case SUB:
            return "Sub";
        case MUL:
            return "Mul";
        case DIV:
            return "Div";
        case ABS:
            return "Abs";
        case EOL:
            return "EOL";
    }

    printf("Unreachable.\n");
    exit(1);
}

int yywrap(void) { }