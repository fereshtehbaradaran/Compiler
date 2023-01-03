%{

%}


delim       [ \t\n]
ws          {delim}+  
letter      [A-Za-z] 
digit       [0-9]	
id          {letter}({letter}|{digit})*
number      {digit}+(\.{digit}+)?([eE][+\-]?{digit}+)?

%%

{ws}        {  }
{id}        {yylval = install_id(); return ID;}
{number}  	{yylval = install_num(); return NUM;}

:A:         {return ADD;}
:S:         {return SUB;}
:M:         {return MUL;}
:D:         {return DIV;}

[=()]       {return yytext[0];}

%%