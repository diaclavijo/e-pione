Feature: Physician is logged and on "Búsqueda de pacientes" page, where he will see a breadcrumb, the date,
  and a panel containing 10 patients and elemnts for navigating through the panel (paginator, filter by or search) or creating a new patient"

  Background:
    Given Physician is logged and on Búsqueda de Pacientes site.

  Scenario:Breadcrumb
    Then physician should see a breadcrumb remarking the actual page and showing the path on how to get there

  Scenario:Date
    Then physician should see the actual date

  Scenario: Panel
    Then physician should see a panel with essential data of maximum 10 patients that will display inside the panel
    And the panel will be titled by "Últimos pacientes atendidos"
    And inside the panel there will be a Buscar por button, a Buscar button along with a text field and a Nuevo Paciente button
    And if there are 10 patients or more registered, there will be a paginator

  #Scenario: Button "Nuevo Paciente" behaviour
  #When physician click on Nuevo Paciente
  #Then he will visit a page to create a new page


  #Scenario: Button "Buscar" and text field behaviour
   # When physician fills the text field with some data
   # And clicks on Buscar button
   # Then ???


#TODO: button  and mas datos e historia clínica behaviours
    #TODO: Refactor common scenarios into a unique step definition file

#TODO: Paginator will only be present if there are more than 10 patients, so, the above scenario should be redescribed as if less than 10 rows, there will be pe a paginator.
#or something like that