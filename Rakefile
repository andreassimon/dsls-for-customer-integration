#!/usr/bin/ruby
# encoding: utf-8

require 'rubygems'
require 'antlr3/task'
require 'cucumber'
require 'cucumber/rake/task'


ANTLR3::CompileTask.define do |t|
  t.grammar_set "external_dsl/OrderStates.g", output_directory: "features/external_dsl/parser"
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

desc("demonstrate the example")
task(:default => ['antlr-grammars:compile', 'features'])

desc("trash all generated output")
task(:clean => 'antlr-grammars:clobber')
