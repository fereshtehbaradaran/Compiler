%{
    #include <stdio.h>
    #include <string.h>

    #include "parser.tab.h"
%}


delim       [ \t\n]
ws          {delim}+  
letter      [A-Za-z] 
digit       [0-9]	
id          {letter}({letter}|{digit})*
number      {digit}+(\.{digit}+)?([eE][+\-]?{digit}+)?

%%

{ws}        { ; }
{id}        {strcpy(yylval.id , yytext); return ID;}
{number}  	{strcpy(yylval.num , yytext); return NUM;}

":A:"       {return ADD;}
":S:"       {return SUB;}
":M:"       {return MUL;}
":D:"       {return DIV;}

[=()]       {return yytext[0];}

.           printf("Unexpected Character!\n");

%%