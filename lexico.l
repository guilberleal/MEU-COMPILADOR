%{
	#include <string.h>
	#include <stdio.h>
	#include "sintatico.tab.h"
	#include "symbolTable.h"
	void yyerror(char *); 
%}

ws [ \t]
letter [A-Za-z]
digit [0-9]



%%

"//".*\n\r  {
	cont_lines++;
}
"//".*\r\n  {
	cont_lines++;
}

"int"	{
	printf("Lexic: int found\n");
	strcpy(yylval.c.str, yytext);
	return INT;
}

"float"	{
	printf("Lexic: float found\n");
	strcpy(yylval.c.str, yytext);
	return FLOAT;
}

"string"	{
	printf("Lexic: string found\n");
	strcpy(yylval.c.str, yytext);
	return STR;
}

"read"	{
	printf("Lexic: read found\n");
	strcpy(yylval.c.str, yytext);
	return READ;
}

"write"	{
	printf("Lexic: write found\n");
	strcpy(yylval.c.str, yytext);
	return WRITE;
}

"if"	{
	printf("Lexic: if found\n");
	strcpy(yylval.c.str, yytext);
	return IF;
}

"else"	{
	printf("Lexic: else found\n");
	strcpy(yylval.c.str, yytext);
	return ELSE;
}

"while"	{
	printf("Lexic: while found\n");
	strcpy(yylval.c.str, yytext);
	return WHILE;
}

"<="	{
	// printf("Lexic: <= found\n");
	strcpy(yylval.c.str, yytext);
	return LE;
}
">="	{
	printf("Lexic: >= found\n");
	strcpy(yylval.c.str, yytext);
	return GE;
}
"=="	{
	printf("Lexic: == found\n");
	strcpy(yylval.c.str, yytext);
	return EQ;
}
"!="	{
	printf("Lexic: != found\n");
	strcpy(yylval.c.str, yytext);
	return NE;
}

{digit}+  {
	printf("Lexic: NUMINT found\n");
	strcpy(yylval.c.str, yytext);
	return NUMINT;
}

{digit}+.{digit}+  {
	printf("Lexic: NUMFLOAT found\n");
	strcpy(yylval.c.str, yytext);
	return NUMFLOAT;
}


{letter}({letter}|{digit}|_)*	{
	printf("Lexic: %s found\n", yytext);
	strcpy(yylval.c.str, yytext);
	return ID;
}

["](.*?)["]	{
	printf("Lexic: %s found\n", yytext);
	strcpy(yylval.c.str, yytext);
	return LITERAL_STR;
}

[-;:={}+*()<>/%] {
	printf("Lexic: %c found\n", *yytext);
	// strcpy(yylval.str, yytext);
	return *yytext;
}


{ws}           { }

\n\r             { cont_lines++; }
\r\n             { cont_lines++; }


. { printf("\n%s\n",yytext);
  yyerror("Invalid character"); }

%%

int yywrap (void)
{
 	return 1;
}
