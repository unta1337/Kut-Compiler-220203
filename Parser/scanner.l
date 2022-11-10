%{
    #include <stdio.h>

    #include "parser.tab.h"
%}

%%
-?[0-9]+ { yylval.num = atoi(yytext); return NUMBER; }
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
"(" { return OP; }
")" { return CP; }
\n { return EOL; }
[ \t] { }
. { printf("Unrecognizable character: '%c' (%u)\n", *yytext, (unsigned int)*yytext); }
%%

int yywrap() { }