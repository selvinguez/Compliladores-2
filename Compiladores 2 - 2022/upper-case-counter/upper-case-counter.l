%{
    int counter= 0;   
    void print(char * text); 
%}

%%

[A-Z] {  print(yytext); counter++;}

. { printf("%s no es una letra mayuscula\n",yytext); }

\n {return 0;}

%%

int main(){
    yylex();
    printf("%d letras mayusculas\n",counter);
    return 0;
}

int yywrap(){
    return 1;
}

void print(char * text){
printf("letra mayuscula: %s\n",yytext);
}