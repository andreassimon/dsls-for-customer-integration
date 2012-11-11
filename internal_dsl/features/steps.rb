# encoding: utf-8
# vim:set ft=ruby

class StateBuilder
  def initialize(state_name)
    @state = State.new(state_name)
  end

  def transition(transition_hash)
    transition_hash.each do |trigger_event_name, target_state_name|
      @state.add_transition(Event[trigger_event_name], State[target_state_name])
    end
  end
end

class ModelBuilder

  def initialize()
    @delayed_initializations = Array.new
  end

  def event(event_name)
    Event.new(event_name)
  end

  def state(state_name, &block)
    state_builder = StateBuilder.new(state_name)
    if block_given?
      @delayed_initializations << proc do
        state_builder.instance_eval &block
      end
    end
  end

  def emit!
    @delayed_initializations.each do |initilization_proc|
      initilization_proc.call
    end
  end
end

Given /^I build a semantic model through$/ do |code|
  model_builder = ModelBuilder.new
  model_builder.instance_eval(code)
  model_builder.emit!
end

Given /^an order is in state "(.*?)"$/ do |current_state_name|
  @order = Order.new(State[current_state_name])
end

When /^the event "(.*?)" has occurred$/ do |event_name|
  @order.handle(event_name)
end

Then /^the order will be in state "(.*?)"$/ do |next_state_name|
  @order.current_state.should == State[next_state_name]
end
