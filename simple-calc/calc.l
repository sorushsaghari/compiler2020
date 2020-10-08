%{
#define YYSTYPE double
#include "calc.tab.h"
%}

white [ \t]+
digit [0-9]
integer {digit}+
real {integer}("."{integer})?

%%

{white} { }
{real} { yylval=atof(yytext); return NUMBER; }

"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIVIDE;
"^" return POWER;
"(" return LEFT;
")" return RIGHT;
"\n" return END;

%%
int yywrap(void) {
return 1;
}
