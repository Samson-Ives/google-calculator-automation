import { Given, Then, When } from "@cucumber/cucumber";
import { expect } from "@playwright/test";
import { pageFixture } from "../../support/page-fixture";
import * as world from "../../config/world";
import * as functions from "../../support/functions";

/**
 * Sets up the scenario where the user is on the Google calculator search page.
 * This involves navigating to Google, searching for 'calculator', pressing enter,
 * and confirming that the calculator interface is displayed correctly.
 */
Given("I am on the google calculator search page", async () => {
  const googleUrl = "https://www.google.com/";
  const expectedInitialCalculatorValue = "0"; // Expected default value when the calculator loads

  // Navigate to the Google search home page
  await pageFixture.page?.goto(googleUrl);

  // Verify the page has loaded by checking the URL
  const actualURL = await pageFixture.page?.url();
  expect(actualURL).toBe(googleUrl);

  // Locate the search bar and enter 'calculator'
  const searchBar = pageFixture.page?.getByRole("combobox", { name: "Search" });
  await searchBar.fill("calculator");

  // Simulate pressing the Enter key to search
  await pageFixture.page?.keyboard.press("Enter");

  // Wait for the calculator to appear and verify it shows the expected initial value
  const calculatorElement = await pageFixture.page.waitForSelector("#cwos");
  const calculatorContent = await calculatorElement.textContent();
  expect(calculatorContent).toBe(expectedInitialCalculatorValue);
});

/**
 * Cucumber step to enter each digit from the input string into the calculator by clicking the corresponding button.
 * @param input A string representing the number to be entered into the calculator.
 */
When(
  "I enter the value {string} into the calculator",
  async (input: string) => {
    const characters = functions.separateCharacters(input); // Assuming `separateCharacters` is correctly imported.

    for (let char of characters) {
      try {
        char = functions.checkForOperatorChar(char);
        const buttonSelector = `div[role="button"]:text("${char}") >> visible=true`;

        // Log the action for debugging
        console.log(`Attempting to click on button with text: ${char}`);

        // Click the button
        await pageFixture.page?.click(buttonSelector);
      } catch (error) {
        // Log the error to understand which character failed and why
        console.error(
          `Failed to click on button with text: ${char}. Error: ${error}`,
        );
        throw error; // Optionally re-throw to fail the test
      }
    }
  },
);

When(
  "I click the {string} button on the calculator",
  async (calculatorButton: string) => {
    calculatorButton = functions.checkForOperatorChar(calculatorButton);

    const parentSelector = "div.card-section";
    const buttonSelector = `${parentSelector}  div[role="button"]:text("${calculatorButton}") >> visible=true`;
    // Wait for the element to be visible on the page
    await pageFixture.page?.waitForSelector(buttonSelector, {
      state: "visible",
    });

    // Click the element
    await pageFixture.page?.click(buttonSelector);
  },
);

When(
  "I see the calculator display the result {string}",
  async (expectedValue: string) => {
    const calculatorElement = await pageFixture.page.waitForSelector("#cwos");
    const calculatorAnswer = await calculatorElement.textContent();
    expect(calculatorAnswer).toBe(expectedValue);
  },
);

/**
 * Cucumber step to enter each digit from the input string into the calculator by clicking the corresponding button.
 * Adds error handling and detailed logging to diagnose issues.
 * @param input A string representing the number to be entered into the calculator.
 */
When(
  "I enter the expression {string} into the calculator",
  async (input: string) => {
    const characters = functions.separateCharacters(input); // Assuming `separateCharacters` is correctly imported.

    for (let char of characters) {
      try {
        char = functions.checkForOperatorChar(char);
        const buttonSelector = `div[role="button"]:text("${char}") >> visible=true`;

        // Log the action for debugging
        console.log(`Attempting to click on button with text: ${char}`);

        // Click the button
        await pageFixture.page?.click(buttonSelector);
      } catch (error) {
        // Log the error to understand which character failed and why
        console.error(
          `Failed to click on button with text: ${char}. Error: ${error}`,
        );
        throw error; // Optionally re-throw to fail the test
      }
    }
  },
);
