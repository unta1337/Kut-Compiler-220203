%{
    #include "pascal_like.tab.h"

    #ifdef PRINT
    #define TOKEN(t) { printf("Token: " #t "\n"); return (t); }
    #else
    #define TOKEN(t) { return (t); }
    #endif
%}

digit  [0-9]
letter [a-zA-z]

number {digit}+
id     {letter}({letter}|{digit})*

%%
";"  TOKEN(SEMICOLON)
":=" TOKEN(ASSIGN)
"<"  TOKEN(LESS_THAN)
">"  TOKEN(GREATER_THAN)
"+"  TOKEN(PLUS)
"-"  TOKEN(MINUS)

begin TOKEN(begin)
end   TOKEN(end)
if    TOKEN(iif)
then  TOKEN(then)
else  TOKEN(eelse)
while TOKEN(whiile)
do    TOKEN(doo)

{number} TOKEN(NUMBER)
{id}     TOKEN(ID)

(\n|\r\n) { /* LF CRLF */ printf("\n"); }
[ \t]     { /* White spaces */ }
.         printf("Unrecognizable character: \"%s\"\n", yytext);
%%
