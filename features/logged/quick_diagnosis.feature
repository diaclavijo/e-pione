Feature: Physician is logged on and on "Diagnóstico rápido" site, where he/she
  can perform a quick diagnosis by introducing 4 variables: FAQ score, MMSE Score, age and education

  Background:
    Given Physician is logged and on "Diagnóstico rápido" site.

  Scenario Outline: Fill all the fields properly

    When physician fills in the following:
      | Puntuación FAQ              |   <faq_score>     |
      | Puntuación MMSE             |  <mmse_score>     |
      | Edad                        |  <age>            |


    And when he selects in the following:
      | patient_education_select      |  <education>  |



    And clicks on "Solicitar diagnóstico computacional" button

    Then he should visit "Diagnóstico rápido - Resultado" page


  Examples:
    | faq_score    | mmse_score     | age   |  education                        | other_education |
    |   1          |  30            |  65   |  Analfabeto (0 años)              |                 |
    |   9          |  25            |  70   |  Estudios mínimos (6 años)        | :..             |
    |   0          |  1             |  70   |  Estudios Primarios (10 años)     | :..             |
    |   2          |  30            |  70   |  Estudios Secundarios (12 años)   | :..             |
    |   3          |  29            |  70   |  Estudios Universitarios (16 años)| :..           |
    |   3          |  29            |  70   |  Otro (introducir número de años) | 20   |
    |   3          |  29            |  70   |  Otro (introducir número de años) | 0    |
    |   3          |  29            |  70   |  Otro (introducir número de años) | 10   |
