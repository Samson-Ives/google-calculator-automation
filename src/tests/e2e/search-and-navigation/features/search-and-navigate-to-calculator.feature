Feature: The customer is able to navigate to and search for the google calculator

  @noLogin @e2e @navigation @calculator @smoke
  Scenario Outline: The customer should be able to navigate to the calculator by searching google
    Given I navigate to the google search home page
    And I enter in the search bar "calculator"
    When I hit the enter key
    Then I can see the google calculator app