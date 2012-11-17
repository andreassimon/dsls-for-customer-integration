# encoding: utf-8
# vim:set ft=ruby

Given /^an order is in state "(.*?)"$/ do |current_state_name|
  @order = Order.new(State[current_state_name])
end

When /^the event "(.*?)" has occurred$/ do |event_name|
  @order.handle(event_name)
end

Then /^the order will be in state "(.*?)"$/ do |next_state_name|
  @order.current_state.should == State[next_state_name]
end
