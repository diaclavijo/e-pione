Feature: Register a new patient filling all the needed fields


  Background:
    Given Physician is logged and on "Registrar nuevo paciente" site

  Scenario Outline: Fill all the fields, mandatory and optionals
    When I fill in the following:
    | Nombre (*)              |   <name>     |
    | Apellido (*)            |  <surname>   |


    And when I select the born date of the patient in the following:
      |patient_birth_3i         |  <day>          |
      |patient_birth_2i         |  <month>        |
      |patient_birth_1i         |  <year>         |

    And when I select in the following:
      | Sexo (*)                |  <gender>       |
      | Estado civil (*)        |  <civil_state>  |

    And I fill in the following:
    |NIF (*)      | <nif>     |
    |Ciudad (*)   | <city>    |
    |Provincia (*)| <state>   |
    |Pais (*)     | <country> |

   And I fill in the following:
      | Pasaporte (Si es extranjero)  |  <passport>             |
      | Núm. Seg. Social              |  <social_security_nr>   |
      | Tarjeta sanitaria             | <social_security_card>  |
      | Teléfono fijo                 | <phone_number>          |
      | Teléfono móvil                | <cellphone_number>      |
      | Otro teléfono                 | <another_number>        |
      | Dirección                     | <address>               |


    And when I select in the following:
      | Escolaridad             | <school_level>|
      | Profesión               | <profession>  |
      | Situación laboral       | <laboral>     |
      | Situación económica     | <economic>    |
      | ¿Institucionalizado?    | <interned>    |

    And click on "Crear paciente" button

    Then a "patient" is successfully created


    Examples:
    | name         | surname        | day   |  month   | year  | gender          | civil_state   | nif       | city                         | state                 | country        | passport      | social_security_nr  | social_security_card    | phone_number  | cellphone_number  | another_number  | address              | school_level       | profession              | laboral      | economic | interned    |
    | Pepe         |  Paleta        |  12   |  octubre | 2008  |    Hombre       |Soltero        | 9625782   | Las Palmas de Gran Canaria   |  Las Palmas           | España         | 123456789A    |  12345              |  23412412X              |  928430214    | 679122222         |    213214       |C/Tolete Num 4, 4º B  | Desconocido        | Desconocido             | Desconocido  | Pobre    | Desconocido |
    | Pepa         |  La Libre      |  13   |  abril   | 2009  |    Mujer        |Casado         | 53223461  | Las Palmas de Gran Canaria   |  Las Palmas           | España         |  123456789B   |  AAA1               |  123                    |  928430210    | 679122222         |    2424         |Detrás tuyo           | Lee y escribe      | Manual no especializado | Jubilado     | Mala     | No          |
    | Anacleto     |  Fernández     |  9   |  febrero | 2010  |    Mujer         |Viudo          | 47800229  | Wonderland                   |  Wonderland Capital   | Wonderlandia   | 012344569C    |  343423             |  0.34?                  |  123          | 12345             |                 |                      | Analfabeto         | Técnico                 |  Activo      | Normal   | Hospital    |
    | Hermenegilda |  Rigoberta     |  3   |  febrero | 2011  |    Mujer         |Divorciado     | 41756446  | Eurasia                      | Eurasia Capital       | Euraskasia     | 0000          |  XY??               |  '?*ç                   |  000          | XXXX?             |                 | Evergreen terrace    | Estudios mínimos   | Intelectual             | Desempleado  | Buena    | Residencia  |
    | Zanistafio   |  Wencesalo     |  1   |  enero   | 2013  |    Desconocido   |Desconocido    | 33661003  | Winterfall                   | Winterfallia          | A song of ice and fire | XXYYYYY       |  ZZZ        |  ZZZZ                   |  123          | AAAA              |   231231        |    dsad              | Estudios Primarios | Manual especializado    |  Pendiente   | Muy buena| Seleccionar |




     Scenario: Not fill mandatory camps
      When I not fill mandatory camps
      And click on "Crear paciente" button
      Then the fields with errors are remarked
      And a warning message appears







#TODO: Scenario fill optional camps (and mandatory camps) - >Done, a lo bestia.
  #TODO: Scenario not fill mandatory camps  -Done
  #TODO: Fecha de nacimiento is tested using names to close to implementation. But it fucking works.


#TODO: Errores coloreados en rojo para todos los campos.