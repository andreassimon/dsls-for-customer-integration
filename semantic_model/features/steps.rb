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

  State.by_name('new').add_transition(Event.by_name('order processed'), State.by_name('processed'))
  State.by_name('new').add_transition(Event.by_name('order cancelled'), State.by_name('cancelled'))
  State.by_name('processed').add_transition(Event.by_name('invoice was paid'), State.by_name('paid'))
end

Given /^an order is in state "(.*?)"$/ do |current_state_name|
  @order = Order.new(State.by_name(current_state_name))
end

When /^the event "(.*?)" has occurred$/ do |event_name|
  @order.handle(event_name)
end

Then /^the order will be in state "(.*?)"$/ do |next_state_name|
  @order.current_state.should == State.by_name(next_state_name)
end
