lexer grammar ChemsLexer;


// Tokens

/* RESERVADAS */
R_PRINT:        'print!';
R_PRINTLN:      'println!';
P_NUMBER:       'number';
R_AS_DOUBLE:    'as f64';
R_AS_INTEGER:   'as i64';
R_LET:          'let';
R_MUT:          'mut';
R_IF:           'if';
R_ELSE:         'else';
R_MATCH:        'match';
R_WHILE:        'while';
R_BREAK:        'break';
R_CONTINUE:     'continue';
R_RETURN:       'return';
R_LOOP:         'loop';
R_FOR:          'for';
R_IN:           'in';
R_MAIN:         'main';
R_FUNCTION:     'fn';

/* TIPOS */
R_INT:          'i64';
R_FLOAT:        'f64';
R_STRING:       'String';
R_BOOL:         'bool';
R_STR:          '&str';

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
TK_DOBLEPUNTO:   '..';
TK_PUNTO:        '.';
TK_PUNTOCOMA:    ';';
TK_COMA:         ',';
TK_DOSPUNTOS:    ':';
TK_IGUAL:        '=';
TK_IGUALIGUAL:   '==';
TK_MAYORIGUAL:   '>=';
TK_IGUALMAYOR:   '=>';
TK_MENOSMAYOR:   '->';
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
TK_AND:          '&&';
TK_OR:           '||';
TK_BARRA:        '|';
TK_NOT:          '!';
// TK_GUIONBAJO:    '_ =>';


WHITESPACE: [ \r\n\t]+ -> skip;
TK_MULTI:    '/*' (~[/])+ '*/' -> skip;
TK_LINE:    '//'(~[\n])+ -> skip;

fragment
ESC_SEQ
    :   '\\' ('\\'|'@'|'['|']'|'.'|'#'|'+'|'-'|'!'|':'|' ')
    ;
