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

%token TK_SELECT TK_UPDATE TK_DELETE TK_INSERT TK_GROUPBY  TK_ORDERBY TK_FROM TK_SET
%token TK_INT TK_VARCHAR TK_NUMBER 
%token TK_ID TK_PUNTO
%token TK_ASTERISCO  TK_PUNTOCOMA TK_IN TK_ABREP TK_CIERRAP
%token  TK_WHERE TK_VALUES TK_IGUAL TK_MAYORIGUAL TK_MAYOR TK_MENORIGUAL TK_MENOR TK_COMIA
 


%%

stmt_list: stmt TK_PUNTOCOMA
  | stmt_list stmt TK_PUNTOCOMA
  ;

expr: TK_ID | expr compa expr | expr TK_IN  TK_ABREP select_stmt TK_CIERRAP
   ;     

compa: TK_IGUAL |  TK_MAYORIGUAL |  TK_MAYOR | TK_MENORIGUAL | TK_MENOR
;

stmt: select_stmt | delete_stmt | update_stmt | insert_stmt
   ;


select_stmt: TK_SELECT select_expr_list 
   | TK_SELECT  select_expr_list TK_FROM table_references
     opt_where opt_groupby opt_orderby
   ;
opt_groupby: /* EPSILON */ 
   | TK_GROUPBY groupby_list 
;

opt_orderby: /* EPSILON */ 
   | TK_ORDERBY groupby_list 
   ;
groupby_list: expr                         
   | groupby_list TK_COMIA expr                            
   ;

opt_where: /* EPSILON */ 
   | TK_WHERE expr ;

select_expr_list: select_expr 
    | select_expr_list TK_COMIA select_expr 
    | TK_ASTERISCO 
    ;
select_expr: expr;

table_references:   TK_ID
    ;

update_stmt: TK_UPDATE  table_references
    TK_SET update_asgn_list
    opt_where
    opt_orderby
;

delete_stmt: TK_DELETE TK_FROM TK_ID
    opt_where opt_orderby 
;

update_asgn_list:
     TK_ID compa expr 
    
   | TK_ID TK_PUNTO TK_ID compa expr 
    
	 
   | update_asgn_list TK_COMIA TK_ID compa expr
   
	
   | update_asgn_list TK_COMIA TK_ID TK_PUNTO TK_ID compa expr
      
   ;

insert_stmt: TK_INSERT  TK_ID
     opt_col_names
     TK_VALUES insert_vals_list
    
   ;

insert_vals_list: TK_ABREP insert_vals TK_CIERRAP
   | insert_vals_list TK_COMIA  TK_ABREP insert_vals TK_CIERRAP
   ;

insert_vals:
     expr 
  
   | insert_vals TK_COMIA expr 
  
   ;

opt_col_names: /* EPSILON */
   | TK_ABREP column_list TK_CIERRAP 
   ;

column_list: TK_ID 
  | column_list TK_COMIA TK_ID
  ;         
%%