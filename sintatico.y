%{

	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

  extern int yylex();
  extern char* yytext;
  extern int lines;
  extern int columns;
	extern int end_file;
	extern int line_comment;
	extern int first;
	char *string;

	void printTerminal();
	void printInfo();
	char *getString(FILE *stdin);
  int yyerror(char *s);

%}
 
/* declare tokens */
%token SHOW
%token SETTINGS
%token RESET
%token QUIT
%token SET
%token H_VIEW
%token V_VIEW
%token AXIS
%token ON
%token OFF
%token PLOT
%token INTEGRAL_STEPS
%token INTEGRATE
%token MATRIX
%token SOLVE
%token DETERMINANT
%token LINEAR_SYSTEMS
%token ABOUT
%token SEMICOLON
%token COMMA
%token COLON
%token PLUS
%token MINUS
%token MULTIPLY
%token DIV
%token POWER
%token REMAINDER
%token SIN
%token COS
%token TAN
%token ABS
%token L_PAREN
%token R_PAREN
%token L_SQUARE_BRACKET
%token R_SQUARE_BRACKET
%token REAL
%token INTEGER
%token ERROR
%token EOL

%start start 

%%

start: programa
;

programa: 
	| QUIT {exit(0);}
	|	ERROR {printf("Simbolo Invalido -> %s\n\n", yytext);}
	| ABOUT {printInfo();}
	| EOL {printTerminal();}
;	

%%

int main(int argc, char **argv){
	// string = getString(stdin);
	while (1) {
  	printTerminal();
		yyparse();
	}

  return 0;
}

int yyerror(char *s) {

}

void printTerminal() {
	printf(">");
}

void printInfo() {
	int i, j;

	printf("\n\n");

	printf("+");
	for (i=0; i<55; i++) {
		printf("-");
	}
	printf("+");

	printf("\n|");
	for (i=0; i<55; i++) {
		printf(" ");
	}
	printf("|");

	printf("\n|");
	for (i=0; i<8; i++) {
		printf(" ");
	}
	printf("201600560375 - Renan Yuji Koga Ferreira");
	for (i=0; i<8; i++) {
		printf(" ");
	}
	printf("|");

	printf("\n|");
	for (i=0; i<55; i++) {
		printf(" ");
	}
	printf("|\n");

	printf("+");
	for (i=0; i<55; i++) {
		printf("-");
	}
	printf("+");

	printf("\n\n");
}