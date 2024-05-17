Feature: The customer is able to perform calculations using the correct order of operations on the google search calculator

## More test cases could be added for better coverage but this is a good start

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @e2e @calculator @regression @orderOfOperations 
Scenario Outline: The customer can perform calculations with correct order of operations
    When I enter the expression "<expression>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | expression               | expectedResult |
    | 3+5x2                    | 13             |
    | (3+5)x2                  | 16             |
    | 10+(5-3)x4               | 18             |
    | (10+5)÷(3x2)             | 2.5            |
    | 3+(2-1)x(4÷2)            | 5              |
    | (3+2)x(5-1)              | 20             |
    | 7+6x(5+3)÷4              | 19             |
    | (7+6)x(5-3)÷2            | 13             |
    | (3+2)x((4-1)÷(5-3))      | 7.5            |
    | 6÷(3+3)+(4x2)-5          | 4              |
    | 25-(2x5)-4               | 11             |
    | 10÷(5-3)x(2+3)           | 25             |
    | (4+3)x(10÷(5-3))         | 35             |
    | (10÷(5-3))+(6x(3+1))     | 29             |
    | 10-(3x(2+1))             | 1              |
    | (6x(2+3))-(4÷2)          | 28             |

@noLogin @e2e @calculator @smoke @orderOfOperations 
Scenario Outline: The customer can perform some basic calculations with correct order of operations
    When I enter the expression "<expression>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | expression               | expectedResult |
    | 3+5x2                    | 13             |
    | (3+5)x2                  | 16             |
    | 10+(5-3)x4               | 18             |
    | (10+5)÷(3x2)             | 2.5            |
    | 3+(2-1)x(4÷2)            | 5              |
    | (3+2)x(5-1)              | 20             |
