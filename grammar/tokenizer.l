%{
#include "calc.tab.h"
%}

%%
"+"			{ return ADD; }
"-"			{ return SUB; }
"*"			{ return MUL; }
"/"			{ return DIV; }
"|" 		{ return ABS; }
"("			{ return OP; }
")"			{ return CP; }
[+-]?[0-9]+	{ yylval = atoi(yytext); return NUMBER; }

\n 			{ return EOL; }
"//".*
[ \t] 	{ /* ignore whitespace */ }
.	{ yyerror("Mystery character %s\n", yytext); }
%%


//main(int argc, char **argv) {
//	int tok;
//
//	while((tok = yylex())) {
//		printf("%d", tok);
//		if (tok == NUMBER) printf(" = %d\n", yylval);
//		else printf("\n");
//	}
//}
