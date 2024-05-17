Feature: Example to show what test failures look like if the expected result is incorrect

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @failureExamples
Scenario Outline: The customer can perform some basic calculations that are expected to fail
    When I enter the expression "<expression>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | expression               | expectedResult |
    | 3+5x2                    | 14             |
    | (3+5)x2                  | 12             |
    | 10+(5-3)x4               | 16             |
    | (10+5)÷(3x2)             | 2.0            |
    | 3+(2-1)x(4÷2)            | 54             |
    | (3+2)x(5-1)              | 202            |
