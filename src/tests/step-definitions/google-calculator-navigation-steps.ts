import { When } from "@cucumber/cucumber";
import { expect, test } from "@playwright/test";
import { pageFixture } from "../../support/page-fixture";
import * as world from "../../config/world";
import * as functions from "../../support/functions";

When(
  "I wait {int} seconds for the UI to load",
  async (numberOfSeconds: number) => {
    await functions.sleep(numberOfSeconds * 1000);
  },
);

When("I navigate to the google search home page", async () => {
  const googleUrl = "https://www.google.com/";
  // Navigate to the Google search home page
  await pageFixture.page?.goto(googleUrl);

  // Get the current URL and check it against the expected URL
  const actualURL = await pageFixture.page?.url();
  expect(actualURL).toBe(googleUrl);
});

When("I enter in the search bar {string}", async (text: string) => {
  // Get the search bar locator and wait for it to be ready
  const searchBar = pageFixture.page?.getByRole("combobox", { name: "Search" });

  // Type the search text into the search bar
  await searchBar.fill("calculator");
});

When("I hit the enter key", async () => {
  await pageFixture.page?.keyboard.press("Enter");
});

When("I can see the google calculator app", async () => {
  // Wait for the element to be visible on the page to ensure it's interactable
  const element = await pageFixture.page.waitForSelector("#cwos");

  // Confirm the elemment contains "0" as the default value for the calculator
  const content = await element.textContent();
  expect(content).toBe("0");
});
