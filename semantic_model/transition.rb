# encoding: utf-8
# vim:set ft=ruby

class Transition
  
  def initialize(source, trigger, target)
    @source  = source
    @trigger = trigger
    @target  = target
  end

  attr_reader :source, :trigger, :target

  def event_name
    @trigger.name
  end

end
