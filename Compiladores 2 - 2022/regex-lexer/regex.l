%{
    
    
%}

%option noyywrap

WORD [a-zA-Z]+
NUMBER [0-9]+

%%

{WORD} {printf("operand %s\n",yytext);}
{NUMBER} {printf("operand %s\n",yytext);}
\| {printf("or operator\n");}
\* {printf("kleeme star\n");}
. {printf("%c invalid char\n",yytext[0]);}

%%

int main(){
    yylex();
   
    return 0;
}