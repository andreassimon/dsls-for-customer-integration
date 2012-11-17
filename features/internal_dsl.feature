# encoding: utf-8

Feature: Internal DSL (Ruby)

  Background:
    Given I use the internal DSL
      """
        event 'order processed'
        event 'order cancelled'
        event 'invoice was paid'

        state('new') do
          transition 'order processed' => 'processed'
          transition 'order cancelled' => 'cancelled'
        end
        state('processed') do
          transition 'invoice was paid' => 'paid'
        end
        state 'cancelled'
        state 'paid'
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
