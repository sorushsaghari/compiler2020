%{
    #define YYSTYPE double
    void yyerror(char const *s);
    #include "calc.tab.h"
%}

white [ \t]+
digit [0-9]
integer {digit}+
float {integer}("."{integer})?

%%

{white} { }
{float} { yylval=atof(yytext); return NUMBER;}



"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIVIDE;
"^" return POWER;
"(" return LEFT;
")" return RIGHT;
"\n" return END;

. { yyerror("Unrecognized character"); }
%%

int yywrap(void) {
return 1;
}

