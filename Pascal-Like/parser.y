%{
    #include <stdio.h>

    void yyerror(char*);
    int yylex(void);
%}

%token begin
%token end
%token iif
%token then
%token eelse
%token whiile
%token doo

%%
    program:
        begin statements end

    statements:
        statement
        | statement ';' statements

    statement:
        if_statement
        | while_statement
        | assign_statement
        | program

    if_statement:
        iif condition then statement
        | iif condition then statement eelse statement

    while_statement:
        whiile condition doo statement

    assign_statement:
        identifier ":=" expr

    condition:
        expr relop expr

    relop:
        '<'
        | '>'

    expr:
        expr binaryOp expr
        | value

    binaryOp:
        '+'
        | '-'

    value:
        number
        | identifier

    identifier:
        letter
        | identifier letter
        | identifier number

    number:
        '1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9'

    letter:
        'a'|'b'|'c'|'d'|'e'|'f'|'g'|'h'|'i'|'j'|'k'|'l'|'m'|'n'|'o'|'p'|'q'|'r'|'s'|'t'|'u'|'v'|'w'|'x'|'y'|'z'|
        'A'|'B'|'C'|'D'|'E'|'F'|'G'|'H'|'I'|'J'|'K'|'L'|'M'|'N'|'O'|'P'|'Q'|'R'|'S'|'T'|'U'|'V'|'W'|'X'|'Y'|'Z'
%%

int main(int argc, char* argv[])
{
    yyparse();
}

void yyerror(char* str)
{
    fprintf(stderr, "error: %s\n", str);
}
