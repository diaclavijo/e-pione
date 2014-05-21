Feature: Physician is logged on and on "Diagnóstico rápido" site, where he/she
  can perform a quick diagnosis by introducing 4 variables: FAQ score, MMSE Score, age and education

  Background:
    Given Physician is logged and on "Diagnóstico rápido" site.

  Scenario: Submit quick diagnosis appareance
      Then physician should see a button with gears to send the form
      And  the text "Solicitar diagnóstico computacional"
