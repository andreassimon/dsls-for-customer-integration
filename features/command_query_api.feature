# encoding: utf-8

Feature: Command Query API

  Background:
    Given I use the Command/Query API
      """
        State.new('new')
        State.new('processed')
        State.new('cancelled')
        State.new('paid')

        Event.new('order processed')
        Event.new('order cancelled')
        Event.new('invoice was paid')

        State['new'].add_transition(Event['order processed'], State['processed'])
        State['new'].add_transition(Event['order cancelled'], State['cancelled'])
        State['processed'].add_transition(Event['invoice was paid'], State['paid'])
      """

  Scenario: new -> processed
    Given an order is in state "new"
    When the event "order processed" has occurred
    Then the order will be in state "processed"

  Scenario: new -> cancelled
    Given an order is in state "new"
    When the event "order cancelled" has occurred
    Then the order will be in state "cancelled"

  Scenario: processed -> paid
    Given an order is in state "processed"
    When the event "invoice was paid" has occurred
    Then the order will be in state "paid"
