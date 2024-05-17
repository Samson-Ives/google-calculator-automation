Feature: The customer is able to perform subtraction using the google search calculator

    ## More test cases could be subtracted for better coverage but this is a good start

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @e2e @calculator @regression @subtraction
Scenario Outline: The customer can subtract two whole numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "-" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue          | secondValue         | expectedResult  |
    | 0                   | 0                   | 0               |
    | 2                   | 1                   | 1               |
    | 200                 | 100                 | 100             |
    | 90000000            | 80000000            | 10000000        |
    | 2147483648          | 1                   | 2147483647      |
    | 9999999999999999999 | 9999999999999999999 | 0               |

@noLogin @e2e @calculator @regression @subtraction
Scenario Outline: The customer can subtract two negative numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "-" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue           | secondValue            | expectedResult    |
    | -0                   | (-0)                   | 0               |
    | -2                   | (-1)                   | -1              |
    | -200                 | (-100)                 | -100            |
    | -5000                | (-4000)                | -1000           |
    | -1000000             | (-1000000)             | 0               |
    | -90000000            | (-80000000)            | -10000000       |
    | -9999999999999999999 | (-9999999999999999999) | 0               |

@noLogin @e2e @calculator @regression @subtraction
Scenario Outline: The customer can subtract a negative number and a positive number using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "-" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue   | secondValue  | expectedResult |
    | -0           | 0            | 0              |
    | -1           | 2            | -3             |
    | -20          | 30           | -50            |
    | -7000000     | 8000000      | -15000000      |
    | 80000000     | (-90000000)  | 170000000      |

@noLogin @e2e @calculator @regression @subtraction
Scenario Outline: The customer can subtract two decimal numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "-" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue             | secondValue           | expectedResult  |
    | 0.0                    | 0.0                   | 0               |
    | 0.2                    | 0.1                   | 0.1             |
    | 999999.999             | 0.001                 | 999999.998      |
    | 0.9999999999999999999  | 0.9999999999999999999 | 0               |

@noLogin @e2e @smoke @regression @subtraction
Scenario Outline: The customer can perform different types of basic subtraction using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "-" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue    | secondValue    | expectedResult  |
    | 2             | 1              | 1               |
    | 654.321       | 123.456        | 530.865         |
    | 0.2           | 0.1            | 0.1             |
    | 2000.25       | 1000.5         | 999.75          |
    | -2000.25      | (-1000.75)     | -999.5          |
    | 2147483648    | 1              | 2147483647      |
    | 0.0           | 0.0            | 0               |