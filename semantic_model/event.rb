# encoding: utf-8
# vim:set ft=ruby

class Event

  @@all_instances = Array.new

  def self.[](event_name)
    @@all_instances.find(proc { Event.new event_name }) do |event|
      event_name == event.name
    end
  end

  def initialize(name)
    @name = name
    @@all_instances << self
  end

  attr_reader :name

  def ==(other)
    other.respond_to?(:name) &&
      self.name == other.name
  end

  def to_s
    "[event:\"#{self.name}\"]"
  end

end
