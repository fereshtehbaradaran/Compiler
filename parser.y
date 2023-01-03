%{

%}

%start Program

%union{
    char id[500];
    char num[500];
    char nonTerminal[500];
}


%token <num> NUM
%token <id> ID
%token ADD
%token SUB
%token MUL
%token DIV

%type <nonTerminal>  block stmts stmt  optexpr IDs expr rel add term power factor 

%right '='
%right ADD
%rigth SUB
%right MUL
%right DIV
%left  UMINUS 

%%

expr    : ID '=' expr               { strcpy($$, $3); printf("%s = %s;\n", $1, $3); }
        | add                       { strcpy($$, $1); }
        ;

add     : term ADD add              { sprintf($$, "t%d", create_Var++); printf("%s = %s + %s;\n", $$, $3, $1); }
        | term SUB add              { sprintf($$, "t%d", create_Var++); printf("%s = %s - %s;\n", $$, $3, $1); }
        | term                      { strcpy($$, $1);}
        ;

term    : factor MUL term           { sprintf($$, "t%d", create_Var++); printf("%s = %s * %s;\n", $$, $3, $1); }
        | factor DIV term           { sprintf($$, "t%d", create_Var++); printf("%s = %s / %s;\n", $$, $3, $1); }
        | factor                    { strcpy($$, $1); }
        ;

factor  : '(' expr ')'              { strcpy($$, $2); }
        | '-' factor                { strcpy(sign,"-"); strcat(sign,$2); strcpy($$, sign); }
        | NUM                       { strcpy($$, $1); }
        | ID                        { strcpy($$, $1); }
        ;

%%

void yyerror(char *msg) {
    fprintf(stderr,"%s\n",msg);
    exit(1);
}


int yywrap() {
    return 1;
}

int main() {
   yyparse();
}

