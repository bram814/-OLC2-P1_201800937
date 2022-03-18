lexer grammar ChemsLexer;


// Tokens

R_PRINTLN:      'println!';
P_NUMBER:       'number';
P_STRING:       'string';
R_AS_DOUBLE:    'as f64';
R_AS_INTEGER:   'as i64';

// P_IF:       'if';
// P_WHILE:    'while';

NUMBER: [0-9]+;
DOUBLE: [0-9]+'.'[0-9]+;
CHAR:   '\''~["]'\'';
STRING: '"'~["]*'"';
BOOLEAN: ('true'|'false');
ID: ([a-zA-Z_])[a-zA-Z0-9_]*;

// R_FORMATO_LLAVE: '"'('{}')+'"';
//  R_FORMATO_LLAVE: '"{}"';

TK_PUNTO:        '.';
TK_PUNTOCOMA:    ';';
TK_COMA:         ',';
// TK_DIFERENTE:    '!';
TK_IGUAL:        '=';
TK_MAYORIGUAL:   '>=';
TK_MENORIGUAL:   '<=';
TK_DIFIGUAL:     '!=';
TK_MAYOR:        '>';
TK_MENOR:        '<';
TK_MULT:         '*';
TK_DIV:          '/';
TK_MODULO:       '%';
TK_MAS:          '+';
TK_MENOS:        '-';
TK_PARA:         '(';
TK_PARC:         ')';
TK_LLAVEA:       '{';
TK_LLAVEC:       '}';
TK_CORA:         '[';
TK_CORC:         ']';


WHITESPACE: [ \r\n\t]+ -> skip;
TK_MULTI:    '/*' (~[/])+ '*/' -> skip;
TK_LINE:    '//'(~[\n])+ -> skip;

fragment
ESC_SEQ
    :   '\\' ('\\'|'@'|'['|']'|'.'|'#'|'+'|'-'|'!'|':'|' ')
    ;
