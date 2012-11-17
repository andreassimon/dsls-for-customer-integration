# encoding: utf-8
# vim:set ft=ruby

Given /^I use the internal DSL$/ do |code|
  model_builder = ModelBuilder.new
  model_builder.instance_eval(code)
  model_builder.emit!
end
