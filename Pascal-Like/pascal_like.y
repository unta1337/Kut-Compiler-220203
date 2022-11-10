%{
    #include <stdio.h>

    extern void yyerror(char*);
    extern int yylex(void);
%}

%token SEMICOLON
%token ASSIGN
%token LESS_THAN
%token GREATER_THAN
%token PLUS
%token MINUS

%token begin
%token end
%token iif
%token then
%token eelse
%token whiile
%token doo

%token NUMBER
%token ID

%%
    program:
        begin statements end
        ;

    statements:
        statement SEMICOLON
        | statement SEMICOLON statements
        ;

    statement:
        if_statement
        | while_statement
        | assign_statement
        | program
        ;

    if_statement:
        iif condition then statement
        ;

    while_statement:
        whiile condition doo
        ;

    assign_statement:
        ID ASSIGN expr
        ;

    condition:
        expr relop expr
        ;

    relop:
        LESS_THAN
        | GREATER_THAN
        ;

    expr:
        value binaryOp expr
        | value
        ;

    binaryOp:
        PLUS
        | MINUS
        ;

    value:
        NUMBER
        | ID
        ;
%%
