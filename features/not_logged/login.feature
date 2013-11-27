Feature: Physician wants to login 

  Scenario: Physician enters correct credentials
  When physician sign in correctly
  Then he should visit welcome page


  Scenario: Physician enters incorrect credentials
  When physician sign in incorrectly
  Then he should see a warning "incorrect login" message

