%{
    #define YYSTYPE char*
    #include <cstdio>
    using namespace std;
    int yylex();
    extern int yylineno;
    void yyerror(const char * err){
        fprintf(stderr, "Line: %d, error: %s",yylineno,err);
    } 

%}

%token TK_PLUS TK_MINUS TK_MULT TK_DIV
%token TK_EOL
%token TK_NUMBER


%%
exprlist: /* E */
    | exprlist expression TK_EOL
    ;
expression: expression TK_PLUS factor
    | expression TK_MINUS factor
    | factor
    ;
factor: factor TK_MULT term
    | factor TK_DIV term
    | term
    ;
term: TK_NUMBER
    ;


%%