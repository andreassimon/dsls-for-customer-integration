# encoding: utf-8

Feature: External DSL (ANTLR3)

  Background:
    Given I use the external DSL
      """
		new:
		  [order processed] => processed
		  [order cancelled] => cancelled

		processed:
		  [invoice was paid] => paid

		# States w/o transitions
		cancelled
		paid
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
