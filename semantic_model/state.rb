# encoding: utf-8
# vim:set ft=ruby

class State

  @@all_instances = Array.new
  def self.by_name(state_name)
    @@all_instances.find do |state|
      state_name == state.name
    end
  end

  def initialize(name)
    @name = name
    @transitions = Array.new

    @@all_instances << self
  end

  attr_reader :name, :transitions

  def add_transition(trigger, target_state)
    @transitions << Transition.new(self, trigger, target_state) unless __transition_by_trigger(trigger)
  end

  def __transition_by_trigger(trigger_event)
    self.transitions.find do |transition|
      trigger_event == transition.trigger
    end
  end
  
  def handle(event)
    __transition_by_trigger(event).target
  end

  def to_s
    "[state:\"#{self.name}\"]"
  end

end
