# encoding: utf-8
# vim:set ft=ruby

Given /^I use the external DSL$/ do |code|
  stream = ANTLR3::StringStream.new(code)
  lexer  = OrderStates::Lexer.new(stream)
  parser = OrderStates::Parser.new(lexer)
  parser.start
end
