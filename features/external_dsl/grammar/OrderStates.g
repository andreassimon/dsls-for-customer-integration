grammar OrderStates;

options {
  language = Ruby;
  output   = AST;
}

start: order_states;

order_states: state_definition+
            ;

state_definition: STATE_NAME
                  {
                    state_name = $STATE_NAME.text
                    @current_state = State[state_name]
                  }
                  ( ':' transition+ )?
                ;

STATE_NAME: ('a'..'z')+
          ;

transition: EVENT TRANSITION_SYMBOL STATE_NAME
            {
              event_name = $EVENT.text[1..-2]
              state_name = $STATE_NAME.text
              @current_state.add_transition(Event[event_name], State[state_name])
            }
          ;

EVENT : '[' EVENT_NAME ']'
      ;

fragment
  EVENT_NAME  :	('a'..'z')+ (' ' ('a'..'z')+)*
      ;

TRANSITION_SYMBOL : '=>'
                  ;

WHITESPACE : ' ' {$channel=HIDDEN;}
           ;

LINE_BREAK : '\n' {$channel=HIDDEN;}
           ;

COMMENT
    :   '#' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    ;
