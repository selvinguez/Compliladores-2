#include <stdio.h>

using namespace std;

extern FILE *yyin;

extern int yylineno;

int yyparse();
int main(int argc, char * argv[]){

    if(argc != 2){
        fprintf(stderr, "Missing input file %s \n",argv[0]);
        return 1;
    }

    FILE * f = fopen(argv[1],"r");

    if(f==NULL){
        fprintf(stderr, "Couldn't open file %s \n",argv[0]);
        return 1;
    }

    yyin = f;
   /* int token;
    while(token = yylex()){
        printf("Line: %d, Token Type %d ",yylineno,token);
        if(token == 261){
            printf(" =%d\n",yylval);
        }else{
            printf("\n");
        }
    }*/
    yyparse();

    return 0;
}