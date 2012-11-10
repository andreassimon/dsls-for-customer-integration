# encoding: utf-8

Feature: state machine example
  As the speaker
  I want to have a small example
  so that I can demonstrate different DSLs

  Scenario:
    Given an order is in state "new"
    When the event "order processed" has occurred
    Then the order will be in state "processed"
