Feature: The customer can use the AC (all clear) button to remove the whole answer to an expression

    ## More test cases could be added for better coverage but this is a good start

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @e2e @calculator @regression @addition
Scenario Outline: The customer can use the AC (all clear) button to set the calculator to 0 once the expression is evaluated
    When I enter the expression "<expression>" into the calculator
    Then I click the "AC" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | expression | expectedResult |
    | 2+1=       | 0              |
    | 2x1=       | 0              |
    | 2-1=       | 0              |
    | 1x(5%)=    | 0              |
    | 2/1=       | 0              |
    | 1.2+1.3=   | 0              |


