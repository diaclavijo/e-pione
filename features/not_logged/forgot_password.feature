Feature: User forgots login credentials and should
    obtain a way to get it back.

  Scenario: User forgots login credentials.
    Given user is on login page
    When user clicks on "¿Problemas para acceder?" link
    Then he should visit a website with help to recover credentials