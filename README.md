# Google Calculator Test Automation

## Overview

This repository contains automated tests for the Google Calculator, focusing on end-to-end (E2E) testing using Behavior-Driven Development (BDD). The goal is to verify the functionality of the calculator component that appears on Google search results.

## Main Components

- **Playwright**: A robust node library for browser automation, supporting all modern web browsers.
- **Cucumber**: Utilized for BDD to write acceptance tests in readable language.
- **TypeScript**: The primary programming language for test script development.
- **Node.js**: The runtime environment for executing JavaScript code server-side.
- **Cucumber Pretty Formatter**: For enhanced test reporting and readability.

## Technology Stack

- **Languages:** [TypeScript](https://www.typescriptlang.org/), [Node.js](https://nodejs.org/)
- **Test & Automation Frameworks:** [Playwright](https://playwright.dev/), [Cucumber](https://cucumber.io/docs/cucumber/) for Behavior-Driven Development ([BDD](https://cucumber.io/docs/bdd/))

## What is BDD?

Behavior Driven Development (BDD) is a development approach that emerged from Test-Driven Development (TDD). BDD uses examples to illustrate the behavior of the application, written in a readable and understandable language for everyone involved in the development.

### BDD Test Structure
```gherkin
- **Feature**: Describes an application feature that needs to be tested.
- **Scenario**: Defines a specific situation or use case of the feature.
- **Given**: Describes the initial context at the start of the scenario.
- **When**: Specifies the event or action that triggers the scenario.
- **Then**: Describes the expected outcome or result in response to the event.
```

### Example of a BDD Test
```gherkin
Feature: Google Calculator

Scenario: Perform addition
  Given I am on the google calculator search page
  When I enter the number "2" into the calculator
  And I click the "+" button on the calculator
  And I enter the number "3" into the calculator
  And I wait 1 second for the UI to load
  Then I click the "=" button on the calculator
  And I see the calculator display the result "5"
```

## Basic File Structure

```
.
├── README.md
├── cucumber.json
├── package.json
├── reports
│   ├── media
│   │   ├── failure-screenshots
│   │   └── videos
│   ├── test-results.html
│   └── test-results.json
├── src
│   ├── config
│   │   └── world.ts
│   ├── support
│   │   ├── functions.ts
│   │   ├── hooks
│   │   │   ├── after-all-hooks.ts
│   │   │   ├── after-hooks.ts
│   │   │   ├── before-all-hooks.ts
│   │   │   └── before-hooks.ts
│   │   ├── page-fixture.ts
│   ├── tests
│   │   ├── e2e
│   │   │   ├── math-operations
│   │   │   │   └── features
│   │   │   │       ├── addition.feature
│   │   │   │       ├── subtraction.feature
│   │   │   │       ├── multiplication.feature
│   │   │   │       ├── division.feature
│   │   │   │       ├── percentage.feature
│   │   │   │       ├── order-of-operations.feature
│   │   │   ├── search-and-navigation
│   │   │   │   └── features
│   │   │   │       └── search-and-navigate-to-calculator.feature
│   │   │   └── test-failure-examples
│   │   │       └── features
│   │   │           └── test-failure-examples.feature
│   └── tmp
└── tsconfig.json
```

## Prerequisites

Ensure you have [Node.js](https://nodejs.org/en/) installed on your machine.

### Setup

1. Clone the repository:
    ```sh
    git clone Samson-Ives/google-calculator-automation
    cd google-calculator-automation
    ```

2. Install Playwright:
    ```sh
    npx playwright install
    ```

3. Install Dependencies:
    ```sh
    npm install
    ```

## Running Tests

You can dynamically specify the browser and tags for the tests using the following command structure:

```sh
npm run test:<browser> -- --tags '<@tag>'
```

Example Commands:

```sh
npm run test:chrome -- --tags '@regression'
npm run test:firefox -- --tags '@smoke'
npm run test:safari -- --tags '@load'
```
Note: To run the tests in headless mode update the `src/config/world.ts` file to `export const HEADLESS = isHeadlessCmdArg ?? isHeadlessEnvVar ?? true;`


This command runs all *.feature files corresponding to the specified tags in the features directory. Upon completion, a HTML report will be generated in the reports directory. Test failure images and videos are captured and attached to the test report.

### Tagging

Tags allow for the execution of specific test suites or features:

- @noLogin
- @e2e - Runs all End to end test cases
- @navigation
- @calculator
- @addition
- @subtraction
- @multiplication
- @division
- @percentage
- @orderOfOperations
- @allClear
- @clearEntry
- @regression - Recommended to run for all tests expected to pass
- @smoke - Recommened to run for a smoke test of all features
- @failureExample - Runs tests that are expected to fail

## Reporting
After a test run is complete a `reports/test-results.html` is generated with details on passing and failing tests. Images and videos from failing tests are also attached to the report.

## Conclusion

This project aims to ensure the reliability and accuracy of the Google Calculator through automated end-to-end testing. By leveraging Playwright and Cucumber, we can create readable, maintainable, and robust tests that cover various calculator functionalities, including basic arithmetic operations, percentages, and complex order of operations.

Feel free to contribute to this project by adding more test cases or improving the existing ones.

## License

This project is licensed under the MIT License.