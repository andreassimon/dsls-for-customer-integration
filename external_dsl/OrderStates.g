grammar OrderStates;

states : (state_definition)*;

state_definition : ID (':' (transitions))*
                 ;

transitions      : (transition_definition)*
                 ;

transition_definition : '[' ID ']' '=>' ID
                      ;

ID  :	('a'..'z')+ (' ' ('a'..'z')+)*
    ;

COMMENT
    :   '#' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    ;

WHITESPACE
    :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;
