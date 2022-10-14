grammar Expr;		
prog:	(statement)* EOF ;

expr:	expr ('*'|'/') expr
    |	expr ('+'|'-') expr
    |	INT
    |	'(' expr ')'
    |  function
    |  function_call
    ;

statement: expr | const_assignment | var_assignment;


function: 'fun' IDENTIFIER '(' arguments? ')' body;
function_call: IDENTIFIER '(' arguments? ')';
arguments: expr ( ',' expr )*;

body: '{' (statement)* return_statement? '}'| return_statement | expr;
return_statement: 'return' expr; 

const_assignment: 'const' IDENTIFIER '=' expr;
var_assignment: 'let' IDENTIFIER '=' expr;

member_get: '$this->'IDENTIFIER;

if_expression: 'if' '(' expr ')' body;
for_expression: 'for' '(' expr ')' body;

IDENTIFIER : [a-zA-Z_] [a-zA-Z0-9_]*; 
NEWLINE : [\r\n]+ -> skip;
INT     : [0-9]+ ;

