%option noyywrap
%option yylineno
%option caseless
%{
    #define YYSTYPE char*
    #include "tokens.h"
    extern char* yylval;
   
    
%}
/*Este lo pense para los nombres de tablas como SElECT TABLE1 ect*/
NAME [A-Za-z][A-Za-z0-9]*

%%
"select" { return TK_SELECT;}
"update" { return TK_UPDATE;}
"delete" { return TK_DELETE;}
"insert" { return TK_INSERT;}
"group by" { return TK_GROUPBY;}
"in" { return TK_IN;}
"order by" { return TK_ORDERBY;}
"int" { return TK_INT;}
"varchar" { return TK_VARCHAR;}
"from" {return TK_FROM;}
"where" { return TK_WHERE;}


"values"  {return TK_VALUES;}
"set" { return TK_SET;}
[0-9]+ { yylval = strdup(yytext); return TK_NUMBER;}
{NAME} { yylval = yytext; return TK_ID;}

\* { return TK_ASTERISCO;}
";" { return TK_PUNTOCOMA;}
"="     { return TK_IGUAL; }
">="   {  return TK_MAYORIGUAL; }
">"     {  return TK_MAYOR; }
"<="    {  return TK_MENORIGUAL; }
"<"     {  return TK_MENOR; }
"," {return TK_COMIA;}
"(" {return TK_ABREP;}
")" {return TK_CIERRAP;}
"." {return TK_PUNTO;}
[ \t\n] {/*ignore*/ }
. {printf("Invalid character %c\n",*yytext);}


%%
/*
char **fileList;
unsigned nFiles;

int yywrap () {
  FILE *file;

  if (currentFile < nFiles) {
     printf ("%8lu %8lu %8lu %s\n", lineCount, wordCount,
       charCount, fileList[currentFile - 1]);
     totalCC += charCount; totalWC += wordCount; totalLC += lineCount;
     charCount = wordCount = lineCount = 0;
     fclose (yyin);

     while (fileList[currentFile] != (char *) 0) {
       file = fopen (fileList[currentFile++], "r");
       if (file != NULL) { yyrestart(file); break; }
	  fprintf (stderr, "could not open %s\n", fileList[currentFile - 1]);
     }
     return (file ? 0 : 1);
    }
    return 1;
}
*/