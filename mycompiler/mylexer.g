lexer grammar mylexer;

options
{
    language=Java;
    backtrack=true;
}



BASIC_TYPE
    :'short'
    |'int'
    |'long'
    |'double'
    |'float'
    |'char'
    |'void'
    ;

SIGN
    :'signed'
    |'unsigned'
    ;

EXTEND_TYPE
    :'struct'
    |'enum'
    |'union'
    ;

TYPEDEF
    :'typedef'
    ;

TYPE_MODIFIER
    :'const'
    |'restrict'
    |'volatile'
    ;

NULL_PTR
    :'NULL'
    ;

STORAGE_CLASS_SPECIFIER
    : 'extern'
	| 'static'
	| 'auto'
	| 'register'
	;

INLINE
    :'inline'
    ;

FLOW_CONTROL
    :'if'
    |'else'
    |'switch'
    |'case'
    |'default'
    ;

LOOP
    :'for'
    |'while'
    |'do'
    ;

JUMP
    :'goto'
    |'break'
    |'continue'
    |'return'
    ;

SIZEOF
    :'sizeof'
    ;


LITERAL_STRING
    :'"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;

LITERAL_CHAR
    :'\'' (~('\'')|EscapeSequence) '\''
    ;

DECIMAL_INT
    : ('0' | '1'..'9' '0'..'9'*)
    ;

HEX_INT
    : '0' ('x'|'X') ('0'..'9'|'A'..'F'|'a'..'f')+
    ;

OCTAL_INT
    :'0' ('0'..'7')+
    ;
    
FLOAT
    :('0'..'9')+ '.' ('0'..'9')* (('e'|'E') ('+'|'-')? ('0'..'9')+ )? ('f'|'F'|'d'|'D')?
    |'.' ('0'..'9')+ (('e'|'E') ('+'|'-')? ('0'..'9')+ )? ('f'|'F'|'d'|'D')?
    |('0'..'9')+  (('e'|'E') ('+'|'-')? ('0'..'9')+ ) ('f'|'F'|'d'|'D')?
    |('0'..'9')+  (('e'|'E') ('+'|'-')? ('0'..'9')+ )? ('f'|'F'|'d'|'D')
    ;

PARENTHESES_LEFT
    :'('
    ;

PARENTHESES_RIGHT
    :')'
    ;

SQUARE_BRACKETS_LEFT
    :'['
    ;

SQUARE_BRACKETS_RIGHT
    :']'
    ;

CURLY_BRACKETS_LEFT
    :'{'
    ;

CURLY_BRACKETS_RIGHT
    :'}'
    ;

COLON
    :':'
    ;

SEMI_COLON
    :';'
    ;

COMMA
    :','
    ;

DOT
    :'.'
    ;

ARROW
    :'->'
    ;

QUESTION
    :'?'
    ;

MATH_OPERATOR
    :'+'
    |'-'
    |'/'
    |'*'
    |'%'
    ;

LOGICAL_OPERATOR
    :'!'
    |'||'
    |'&&'
    ;

BITWISE_OPERATOR
    :'|'
    |'&'
    |'~'
    |'^'
    ;

COMPARISON_OPERATOR
    :'<'
    |'<='
    |'>'
    |'>='
    |'=='
    |'!='
    ;

SHIFT_OPERATOR
    :'<<'
    |'>>'
    ;

ASSIGN_OPERATOR
    :'='
    |'+='
    |'-='
    |'*='
    |'/='
    |'%='
    |'|='
    |'&='
    |'^='
    |'<<='
    |'>>='
    |'++'
    |'--'
    ;


IDENTIFIER
	:	LETTER (LETTER|DIGIT)*
	;

WS
    :(' '|'\r'|'\t'|'\u000C') {skip();}
    ;

NEW_LINE: '\n'{skip();};

COMMENT
    :   '/*' ( options {greedy=false;} : . )* '*/'
    ;

LINE_COMMENT
    : '//' ~('\n'|'\r')* '\r'? '\n'?
    ;

LINE_COMMAND 
    :'#' ~('\n'|'\r')* '\r'? '\n' ?
    ;

fragment LETTER : 'a'..'z' | 'A'..'Z' | '_';
fragment DIGIT : '0'..'9';
fragment
EscapeSequence
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   OctalEscape
    ;

fragment
OctalEscape
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;


