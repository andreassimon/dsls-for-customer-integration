grammar OrderStates;

options {
  language = Ruby;
  output   = AST;
}

states : (state_definition)*;

state_definition : state_name (':' (transition_definition)+)?
                 ;

state_name : ID
           ;

transition_definition : event ' '* '=>' ' '* state_name
                      ;

event : '[' ID ']'
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
