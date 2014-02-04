Feature: Physician is logged and looking for the consultations of the

  Background:
    Given Physician is logged and on "Procolo clínico de consulta" of the patient stie


  Scenario: Panel with different kinds of consultations
    Then he will see a panel with buttons to all the possible consultations/kinds:
    |Sintomatología cognitiva|
    |Sintomatología no cognitiva|
    |Exploración Funcional      |
    |Exploración Neurológica    |
    |Exploración Física  y Cardiaca|
    |Hábitos                       |
    |Patologías Intercurrentes     |
    |Pruebas complementarias       |
    |Prescripción farmacológica    |
    |Diagnóstico                   |


    Scenario: Panel with a summary of the last consultations made



    Scenario: Panel with a summary of the last tests made