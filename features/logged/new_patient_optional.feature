#Feature: Register a new patient filling all the needed and optional fields


#  Background:
#    Given Physician is logged and on "Registrar nuevo paciente" site


#  Scenario Outline: Fill mandatory and optional camps
#    When I fill in the following:
#      | Pasaporte (Si es extranjero)  |  <passport>             |
#      | Núm. Seg. Social              |  <social_security_nr>   |
#      | Tarjeta sanitaria             | <social_security_card>  |
#      | Teléfono fijo                 | <phone_number>          |
#      | Teléfono móvil                | <cellphone_number>      |
#      | Otro teléfono                 | <another_number>        |
#      | Dirección                     | <address>               |


#    And when I select in the following:
#      | Escolaridad             | <school_level>|
#      | Profesión               | <profession>  |
#      | Situación laboral       | <laboral>     |
#      | Situación económica     | <economic>    |
#      | ¿Institucionalizado?    | <interned>    |


  #  And when I check in the following:
  #  | Exitus | <exitus> |


    #And click on "Crear paciente" button

   # Then a "patient" is successfully created

#  Examples:
#    | passport      | social_security_nr  | social_security_card    | phone_number  | cellphone_number  | another_number  | address              | school_level       | profession              | laboral      | economic | interned    |
#    | 123456789A    |  12345              |  23412412X              |  928430214    | 679023123         |    213214       |C/Tolete Num 4, 4º B  | Desconocido        | Desconocido             | Desconocido  | Pobre    | Desconocido |
#    | 123456789B    |  AAA1               |  123                    |  92843021000  | 679023123         |    2424         |Detrás tuyo           | Lee y escribe      | Manual no especializado | Jubilado     | Mala     | No          |
#    | 012344569C    |  343423             |  0.34?                  |  jaaaaaa      | 6790231232010     |                 |                      | Analfabeto         | Técnico                 |  Activo      | Normal   | Hospital    |
#    | 0000          |  XY??               |  '?*ç                   |  000          | XXXX?             |                 | Evergreen terrace    | Estudios mínimos   | Intelectual             | Desempleado  | Buena    | Residencia  |
#    | XXYYYYY       |  ZZZ                |  ZZZZ                   |  123          | AAAA              |   231231        |    dsad              | Estudios Primarios | Manual especializado    |  Pendiente   | Muy buena| Seleccionar |
