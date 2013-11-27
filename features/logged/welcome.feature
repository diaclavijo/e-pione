Feature: Physician is logged on home page where he see the date, a greeting message with his name
  and a navbar.

Background:
  Given Physician is logged on welcome site.

  Scenario:Welcome message
    Then physician should see a greeting message.

  Scenario: Name of physician
    Then physician should see his name prefixed by Dr.

  Scenario:Date
    Then physician should see the actual date

  Scenario: Featurette with three main actions
      Then Physician should be able to see a link to Request Diagnosis
      And a link to Search Patient
      And a link to Register New Patient
      And he will se the links centered horizontally and vertically on the site
