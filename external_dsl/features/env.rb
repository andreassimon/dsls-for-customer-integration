# encoding: utf-8
# vim:set ft=ruby

require 'rspec'

%w(../../semantic_model/model).each do |relative_file_name|
  require File.expand_path(relative_file_name, File.dirname(__FILE__))
end
