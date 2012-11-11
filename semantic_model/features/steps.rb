# encoding: utf-8
# vim:set ft=ruby

Before do
  State.new('new')
  State.new('processed')
  State.new('cancelled')
  State.new('paid')

  Event.new('order processed')
  Event.new('order cancelled')
  Event.new('invoice was paid')

  State['new'].add_transition(Event['order processed'], State['processed'])
  State['new'].add_transition(Event['order cancelled'], State['cancelled'])
  State['processed'].add_transition(Event['invoice was paid'], State['paid'])
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
