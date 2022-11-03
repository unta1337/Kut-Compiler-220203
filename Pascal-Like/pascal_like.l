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
if    TOKEN(iif)
then  TOKEN(then)
else  TOKEN(eelse)
while TOKEN(whiile)
do    TOKEN(doo)

[ \t]  { }
.     printf("Unrecognizable character: \"%s\"\n", yytext);
%%
