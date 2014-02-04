Feature: Physician is logged and on "Historia clínica" page, where he will see a breadrcumb, the "NHC" number and patient name and surname
  the list of the patient consultations plus links to create a new consultations or check detailed/full history of the patient

  Background:
    Given Physician is logged and on Historia Clínica del Paciente site

    Scenario: Panel with three links: Nueva Consulta, Informe Historia Completa, Tipos de Historia
      Then He will see a panel with three links: "Nueva consulta", "Informe historia completa", "Tipos de historia"
      And if he clicks "Nueva consulta" he will visit a page to create a new consulta
      And if he clicks "Informe historia completa" he will visit a page with the full history of the patient
      And if he clicks "Tipos de historia" he will go to a page with every kind of history


      Scenario: Panel with the last consultations of the patient
        Then he will see a panel with the last "5" consultations of the patient
        And every row will have "NHC","Consulta","Fecha","Tipo","Facultativo" and "Detalles"
