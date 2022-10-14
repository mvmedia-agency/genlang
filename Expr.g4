grammar Expr;		
prog:	(statement)* EOF ;

expr:	expr ('*'|'/') expr
    |	expr ('+'|'-') expr
    |	INT
    |	'(' expr ')'
    |   server_function 
    |   server_function_call
    |   client_function
    |   client_function_call
    ;

statement: expr | const_assignment | var_assignment;

server_function: '@fun' IDENTIFIER '(' arguments? ')' body;
server_function_call: '@'IDENTIFIER '(' arguments? ')';
client_function: 'fun' IDENTIFIER '(' arguments? ')' body;
client_function_call: IDENTIFIER '(' arguments? ')';
arguments: expr ( ',' expr )*;

body: '{' (statement)* return_statement? '}'| return_statement | expr;
return_statement: 'return' expr; 

const_assignment: 'const' IDENTIFIER '=' expr;
var_assignment: 'let' IDENTIFIER '=' expr;

if_expression: 'if' '(' expr ')' body;

IDENTIFIER : [a-zA-Z_] [a-zA-Z0-9_]*; 
NEWLINE : [\r\n]+ -> skip;
INT     : [0-9]+ ;

