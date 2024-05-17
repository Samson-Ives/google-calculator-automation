Feature: The customer is able to perform percentage calculations using the google search calculator

## More test cases could be added for better coverage but this is a good start

Background: The browser is open and the google search page is loaded
    Given I am on the google calculator search page

@noLogin @e2e @calculator @regression @percentage
Scenario Outline: The customer can perform addition with percentages
    When I enter the value "<firstValue>" into the calculator
    And I click the "+" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue          | secondValue         | expectedResult   |
    | 100%                | 20                  | 21               |
    | 200                 | 50%                 | 300              |
    | 5000%               | 10                  | 60               |
    | 200                 | (-50%)              | 199.5            |
    | -5000%              | 10                  | -40              |
    | 123.456%            | 654.321             | 655.55556        |
    | -50%                | (-50%)              | -1               |
    | -50%                | 50%                 | -0.75            |

@noLogin @e2e @calculator @regression @percentage
Scenario Outline: The customer can perform subtraction with percentages
    When I enter the value "<firstValue>" into the calculator
    And I click the "-" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue          | secondValue         | expectedResult |
    | 100%                | 20                  | -19            |
    | -100%               | 20                  | -21            |
    | -5000%              | 10                  | -60            |
    | -123.456            | (-123.456%)         | -122.22144     |
    | 50%                 | 50%                 | 0.25           |
    | -50%                | (-50%)              | 0              |
    | -50%                | 50%                 | -0.25          |

@noLogin @e2e @calculator @regression @percentage
Scenario Outline: The customer can perform multiplication with percentages
    When I enter the value "<firstValue>" into the calculator
    And I click the "x" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue          | secondValue         | expectedResult  |
    | 100%                | 20                  | 20              |
    | 200                 | 50%                 | 100             |
    | -5000%              | 10                  | -500            |
    | -123.456            | (-123.456%)         | 152.41383936    |
    | 50%                 | 50%                 | 0.25            |
    | -50%                | -50%                | 0.25            |
    | -50%                | 50%                 | -0.25           |

@noLogin @e2e @calculator @regression @percentage
Scenario Outline: The customer can perform division with percentages
    When I enter the value "<firstValue>" into the calculator
    And I click the "/" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue          | secondValue  | expectedResult  |
    | 100%                | 20           | 0.05            |
    | 200                 | 50%          | 400             |
    | -5000%              | 10           | -5              |
    | 123.456%            | 654.321      | 0.00188678034   |
    | 50%                 | 50%          | 1               |
    | -50%                | (-50%)       | 1               |
    | -50%                | 50%          | -1              |

@noLogin @e2e @calculator @smoke @percentage
Scenario Outline: The customer can perform basic calculations with percentages using the google search calculator
    When I enter the value "<firstValue>" into the calculator
    And I click the "<operator>" button on the calculator
    And I enter the value "<secondValue>" into the calculator
    And I wait 1 seconds for the UI to load
    Then I click the "=" button on the calculator
    And I see the calculator display the result "<expectedResult>"

Examples:
    | firstValue | operator | secondValue | expectedResult   |
    | 100%       | +        | 20          | 21               |
    | 200        | -        | 50%         | 100              |
    | 5000%      | x        | 10          | 500              |
    | 123.456%   | /        | 654.321     | 0.00188678034    |
    | -100%      | +        | 20          | 19               |
    | -5000%     | x        | 10          | -500             |
    | 50%        | +        | 50%         | 0.75             |
    | -50%       | -        | (-50%)      | 0                |
    | 2000.25%   | /        | 1000.5      | 0.01999250374    |
