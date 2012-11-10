# encoding: utf-8
# vim:set ft=ruby

class Event

  @@all_instances = Array.new

  def self.by_name(event_name)
    @@all_instances.find do |event|
      event_name == event.name
    end
  end
  
  def initialize(name)
    @name = name
  end

  attr_reader :name

end
