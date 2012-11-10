# encoding: utf-8
# vim:set ft=ruby

class Order

  def initialize(start_state)
    @current_state = start_state
  end

  attr_accessor :current_state 
 
  def handle(event)
    @current_state.handle(event)
  end

end
