# encoding: utf-8
# vim:set ft=ruby

class Transition
  
  def initialize(source, trigger, target)
    raise ArgumentError, 'Need a trigger event' unless trigger
    @source  = source
    @trigger = trigger
    @target  = target
  end

  attr_reader :source, :trigger, :target

  def event_name
    @trigger.name
  end

  def to_s
    "#{self.source} --#{self.trigger}--> #{self.target}"
  end

end
