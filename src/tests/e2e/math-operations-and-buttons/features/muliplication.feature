Feature: The customer is able to perform multiplcation using the google search calculator

    ## More test cases could be added for better coverage but this is a good start

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @e2e @calculator @regression @multiplication
Scenario Outline: The customer can multiply two whole numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "x" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue          | secondValue         | expectedResult   |
    | 0                   | 0                   | 0                |
    | 2                   | 1                   | 2                |
    | 5000                | 4000                | 20000000         |
    | 1000000             | 1000000             | 1e+12            |
    | 90000000            | 80000000            | 7.2e+15          |
    | 9999999999999999999 | 9999999999999999999 | 1e+38            |

@noLogin @e2e @calculator @regression @multiplication
Scenario Outline: The customer can multiply two negative numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "x" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue           | secondValue            | expectedResult     |
    | -0                   | -0                     | 0                  |
    | -2                   | -1                     | 2                  |
    | -5000                | -4000                  | 20000000           |
    | -90000000            | -80000000              | 7.2e+15            |
    | -9999999999999999999 | -9999999999999999999   | 1e+38              |

@noLogin @e2e @calculator @regression @multiplication
Scenario Outline: The customer can multiply a negative number and a positive number using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "x" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue   | secondValue  | expectedResult  |
    | -0           | 0            | 0               |
    | -1           | 2            | -2              |
    | -20          | 30           | -600            |
    | -50000       | 60000        | -3000000000     |
    | 80000000     | -90000000    | -7.2e+15        |

@noLogin @e2e @calculator @regression @multiplication
Scenario Outline: The customer can multiply two decimal numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "x" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue             | secondValue           | expectedResult  |
    | 0.0                    | 0.0                   | 0               |
    | 0.2                    | 0.1                   | 0.02            |
    | 123.456                | 654.321               | 80779.853376    |
    | 999999.999             | 0.001                 | 999.999999      |
    | 123.456                | 123.456               | 15241.383936    |
    | 0.9999999999999999999  | 0.9999999999999999999 | 1               |

@noLogin @e2e @calculator @smoke @multiplication
Scenario Outline: The customer can perform different types of basic multiplication using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "x" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue    | secondValue    | expectedResult        |
    | 2             | 1              | 2                     |
    | 0.2           | 0.1            | 0.02                  |
    | 0.5           | -0.5           | -0.25                 |
    | 12345678909   | 12345678909    | 1.5241579e+20         |
    | -12345678909  | -12345678909   | 1.5241579e+20         |
    | 0.0           | 0.0            | 0                     |