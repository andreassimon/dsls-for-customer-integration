# encoding: utf-8
# vim:set ft=ruby

class Order

  def initialize(start_state)
    @current_state = start_state
  end

  attr_accessor :current_state 
 
  def handle(event_name)
    @current_state = @current_state.handle(Event[event_name])
  end

end
