Feature: The customer is able to perform addition using the google search calculator

    ## More test cases could be added for better coverage but this is a good start

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @e2e @calculator @regression @addition
Scenario Outline: The customer can add two whole numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "+" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue          | secondValue         | expectedResult  |
    | 0                   | 0                   | 0               |
    | 1                   | 2                   | 3               |
    | 80000000            | 90000000            | 170000000       |
    | 2147483647          | 1                   | 2147483648      |
    | 9999999999999999999 | 9999999999999999999 | 2e+19           |

@noLogin @e2e @calculator @regression @addition
Scenario Outline: The customer can add two negative numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "+" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

    Examples:
Examples:
    | firstValue           | secondValue            | expectedResult  |
    | -0                   | (-0)                   | 0               |
    | -1                   | (-2)                   | -3              |
    | -100                 | (-200)                 | -300            |
    | -80000000            | (-90000000)            | -170000000      |
    | -9999999999999999999 | (-9999999999999999999) | -2e+19          |

@noLogin @e2e @calculator @regression @addition
Scenario Outline: The customer can add a negative number and a positive number using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "+" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

    Examples:
Examples:
    | firstValue   | secondValue   | expectedResult |
    | -0           | 0             | 0              |
    | -1           | 2             | 1              |
    | 300          | (-400)        | -100           |
    | -7000000     | 8000000       | 1000000        |
    | 80000000     | (-90000000)   | -10000000      |

@noLogin @e2e @calculator @regression @addition
Scenario Outline: The customer can add two decimal numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "+" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
Examples:
    | firstValue             | secondValue           | expectedResult  |
    | 0.0                    | (-0.0)                | 0               |
    | 999999.999             | 0.001                 | 1000000         |
    | -123.456               | 123.456               | 0               |
    | 0.9999999999999999999  | 0.9999999999999999999 | 2               |

@noLogin @e2e @calculator @smoke @addition
Scenario Outline: The customer can perform different types of basic addition using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "+" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue    | secondValue   | expectedResult  |
    | 1             | 2             | 3               |
    | 123.456       | 654.321       | 777.777         |
    | 0.1           | 0.2           | 0.3             |
    | -20           | (-30)         | -50             |
    | 1000.5        | 2000.25       | 3000.75         |
    | 12345678909   | 12345678909   | 24691357818     |
    | -12345678909  | 12345678909   | 0               |
    | 2147483647    | 1             | 2147483648      |
    | 0.0           | 0.0           | 0               |