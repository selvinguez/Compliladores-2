%option noyywrap
%option yylineno
%option caseless
%{
    #define YYSTYPE char*
    #include "tokens.h"
    extern char* yylval;
   
    
%}

%%
"+" { return TK_PLUS;}
"-" { return TK_MINUS;}
"/" { return TK_DIV;}
"*" { return TK_MULT;}
[0-9]+ { yylval = strdup(yytext);return TK_NUMBER;}
\n { return TK_EOL;}
[ \t] {/*ignore*/ }
. {printf("Invalid character %c\n",*yytext);}


%%
