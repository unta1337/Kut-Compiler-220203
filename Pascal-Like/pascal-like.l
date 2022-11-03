%{
#define PRINT

#ifdef PRINT
#define TOKEN(t) printf("Token: " #t "\n");
#else
#define TOKEN(t) return(t);
#endif
%}

%%
";"   TOKEN(SEMICOLON)
":="  TOKEN(ASSIGN)
"<"   TOKEN(LESS_THAN)
">"   TOKEN(GREATER_THAN)
"+"   TOKEN(PLUS)
"-"   TOKEN(MINUS)

begin TOKEN(begin)
end   TOKEN(end)
if    TOKEN(if)
then  TOKEN(then)
else  TOKEN(else)
while TOKEN(while)
do    TOKEN(do)

.     printf("Unrecognizable character. %s\n", yytext);
%%