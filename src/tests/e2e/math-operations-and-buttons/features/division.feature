Feature: The customer is able to perform division using the google search calculator

## More test cases could be added for better coverage but this is a good start

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @e2e @calculator @regression @division
Scenario Outline: The customer can divide two whole numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "/" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue          | secondValue         | expectedResult  |
    | 1                   | 1                   | 1               |
    | 2                   | 1                   | 2               |
    | 1000000             | 1000000             | 1               |
    | 2147483648          | 1                   | 2147483648      |
    | 9999999999999999999 | 9999999999999999999 | 1               |

@noLogin @e2e @calculator @regression @division
Scenario Outline: The customer can divide two negative numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "/" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue           | secondValue            | expectedResult  |
    | -1                   | -1                     | 1               |
    | -2                   | -1                     | 2               |
    | -200                 | -100                   | 2               |
    | -1000000             | -1000000               | 1               |
    | -9999999999999999999 | -9999999999999999999   | 1               |

@noLogin @e2e @calculator @regression @division
Scenario Outline: The customer can divide a negative number and a positive number using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "/" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue   | secondValue  | expectedResult  |
    | -1           | 1            | -1              |
    | -2           | 2            | -1              |
    | 300          | -400         | -0.75           |
    | 80000000     | -90000000    | -0.88888888888  |

@noLogin @e2e @calculator @regression @division
Scenario Outline: The customer can divide two decimal numbers using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "/" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue             | secondValue           | expectedResult  |
    | 0.0                    | 1.0                   | 0               |
    | 0.2                    | 0.1                   | 2               |
    | 2.5                    | 1.5                   | 1.66666666667   |
    | 123.456                | 123.456               | 1               |
    | 0.9999999999999999999  | 0.9999999999999999999 | 1               |

@noLogin @e2e @calculator @smoke @division
Scenario Outline: The customer can perform different types of basic division using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "÷" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue    | secondValue    | expectedResult        |
    | 2             | 1              | 2                     |
    | 0.2           | 0.1            | 2                     |
    | 0.5           | -0.5           | -1                    |
    | 2000.25       | 1000.5         | 1.99925037481         |
    | 12345678909   | 12345678909    | 1                     |
    | 0.0           | 1.0            | 0                     |
