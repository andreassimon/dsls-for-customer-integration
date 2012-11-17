# encoding: utf-8
# vim:set ft=ruby

Given /^I build a semantic model through$/ do |code|
  $LOAD_PATH << File.expand_path('../parser', File.dirname(__FILE__))

  require 'OrderStatesLexer'
  require 'OrderStatesParser'

  stream = ANTLR3::StringStream.new(code)
  lexer  = OrderStates::Lexer.new(stream)
  parser = OrderStates::Parser.new(lexer)
  parser.start
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
