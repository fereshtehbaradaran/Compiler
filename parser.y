%{
    #include <stdio.h>
    #include <string.h>

    int tempCounter = 1;

    char Buffer[16];
    char sign[50];


    extern int yylex();
    extern FILE *yyin;
    extern FILE *yyout;

    void yyerror(char *msg);

%}

%start expr

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

%type <nonTerminal>  expr add term factor 

%right '='
%right ADD
%right SUB
%right MUL
%right DIV
%right UMINUS 

%%

expr    : ID '=' expr               { strcpy($$, $3); printf("%s = %s;\n", $1, $3); }
        | add                       { strcpy($$, $1); }
        ;

add     : term ADD add              { sprintf($$, "t%d", tempCounter++); printf("%s = %s + %s;\n", $$, $3, $1); }
        | term SUB add              { sprintf($$, "t%d", tempCounter++); printf("%s = %s - %s;\n", $$, $3, $1); }
        | term                      { strcpy($$, $1);}
        ;

term    : factor MUL term           { sprintf($$, "t%d", tempCounter++); printf("%s = %s * %s;\n", $$, $3, $1); }
        | factor DIV term           { sprintf($$, "t%d", tempCounter++); printf("%s = %s / %s;\n", $$, $3, $1); }
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

