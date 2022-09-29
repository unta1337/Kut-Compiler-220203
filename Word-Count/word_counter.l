/* Declaration and option settings */

%{
    #include <stdio.h>

    void add_word(char*);
    void add_new_line(void);
    void add_char(void);

    int chars = 0;
    int words = 0;
    int lines = 0;
%}

%%

[a-zA-Z]+ add_word(yytext);
\n        add_new_line();
.         add_char();

%%

void add_word(char* text)
{
    words++;
    chars += strlen(text);
}

void add_new_line(void)
{
    chars++;
    lines++;
}

void add_char(void)
{
    chars++;
}

int main(void)
{
    yylex();

    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Chars: %d\n", chars);

    return 0;
}

int yywrap(void) { }