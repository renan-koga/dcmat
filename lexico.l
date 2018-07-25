/* Nao usar a biblioteca do flex*/
%option noyywrap
%x COMMENT

%{
  #include <sintatico.tab.h>

  int chars = 1;
  int lines = 1;
  int columns = 1;
  int line_comment = 0;
  int first = 0;
  int end_file = 0;
%}

%%
"show"                        {return SHOW;}
"settings"                    {return SETTINGS;}
"reset"                       {return RESET;}
"quit"                        {return QUIT;}
"set"                         {return SET;}
"h_view"                      {return H_VIEW;}
"v_view"                      {return V_VIEW;}
"axis"                        {return AXIS;}
"on"                          {return ON;}
"off"		                      {return OFF;}
"plot"                        {return PLOT;}
"integral_steps"							{return INTEGRAL_STEPS;}
"integrate"                   {return INTEGRATE;}
"matrix"                      {return MATRIX;}
"solve"                       {return SOLVE;}
"determinant"                 {return DETERMINANT;}
"linear_systems"							{return LINEAR_SYSTEMS;}
"about"												{return ABOUT;}

";"                           {return SEMICOLON;}
","                           {return COMMA;}
":"                           {return COLON;}
" "                           {}
"+"                           {return PLUS;}
"-"                           {return MINUS;}
"*"                           {return MULTIPLY;}
"/"                           {return DIV;}
"^"                           {return POWER;}
"%"                           {return REMAINDER;}
"sen"                         {return SIN;}
"cos"                         {return COS;}
"tan"                         {return TAN;}
"abs"                         {return ABS;}
"("                           {return L_PAREN;}
")"                           {return R_PAREN;}
"["                           {return L_SQUARE_BRACKET;}
"]"                           {return R_SQUARE_BRACKET;}
[0-9]+"."[0-9]+               {yylval = atof(yytext); return REAL;}
[0-9]+                        {yylval = atoi(yytext); return INTEGER;}
[\n]                          {line_comment = 0; lines++; columns=1; return EOL;}
.                             {return ERROR;}

%%