Feature: The customer can use the CE (clear entry) button to remove the most recent value and clear the calculator to zero

    ## More test cases could be added for better coverage but this is a good start

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @e2e @calculator @regression @addition
Scenario Outline: The customer can use the CE (clear entry) button to remove the most recent value
    When I enter the expression "<expression>" into the calculator
    Then I click the "CE" button on the calculator
    And I see the calculator display the result <expectedResult>

Examples:
    | expression    | expectedResult |
    | 1+1           | "1 + "         |
    | 1             | "0"            |
    | 1x            | "1"            |
    | 1%            | "1"            |
    | 1-            | "1"            |
    | 1.            | "1"            |
    | 1            | "1"             |
    | 1)            | "1"            |


    ## Given more time I would test the hold CE button to clear all values