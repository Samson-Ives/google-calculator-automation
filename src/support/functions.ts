import { Page, BrowserContext } from "@playwright/test";
import { pageFixture, browserFixture } from "./page-fixture";
import * as world from "../config/world";
import { HEADLESS } from "../config/world";
import { IWorld } from "@cucumber/cucumber";
import * as screenshotFunctions from "./screenshot-functions";
const fs = require("fs").promises;
import { existsSync, mkdirSync } from "fs";
import { join, dirname } from "path";
import { readdir, unlink } from "fs/promises";
let context: BrowserContext;

export function debugLog(message: string): void {
  if (world.debug) {
    console.log("DEBUG: ", message);
  }
}

export function sleep(ms: number): Promise<void> {
  return new Promise((join) => setTimeout(join, ms));
}

/**
 * Deletes old test report media, including videos, failure screenshots, and snapshots,
 * to prepare for new test runs. Targets specific directories within the reports folder.
 */
export async function clearOldReports() {
  console.log("    -Clearing old reports");
  await removeAllFilesInDir("./reports/media/videos");
  await removeAllFilesInDir("./reports/media/failure-screenshots");
  await removeAllFilesInDir("./reports/media/snapshots");
}

/**
 * Asynchronously removes all files within a specified directory.
 * Checks for the existence of the directory before attempting removal.
 * If the directory does not exist, logs a message and exits.
 * If an error occurs during file deletion, logs the error message.
 *
 * @param {string} directoryPath - The path to the directory from which files will be removed.
 */
export async function removeAllFilesInDir(
  directoryPath: string,
): Promise<void> {
  try {
    // Check if the directory exists before proceeding
    if (!existsSync(directoryPath)) {
      console.log(`Directory does not exist: ${directoryPath}`);
      return; // Exit the function if the directory doesn't exist
    }

    // Read all the files in the directory
    const files = await readdir(directoryPath);

    // Create a promise for each file's deletion and wait for all of them to complete
    await Promise.all(
      files.map((file) => {
        const filePath = join(directoryPath, file);
        return unlink(filePath);
      }),
    );

    console.log(`All files have been removed in ${directoryPath}`);
  } catch (error) {
    console.error("Error removing files:", error);
  }
}

export async function tearDownScenario() {
  await pageFixture.page?.context().close();
  await browserFixture.browser.close();
}

/**
 * Launches a headless browser instance, creates a new browser context with video recording capabilities,
 * and opens a new page, ready for testing.
 * This setup ensures that each test scenario starts with a clean slate and provides
 * video artifacts for debugging and verification.
 */
export async function buildScenario() {
  browserFixture.browser = await world.browserType.launch({
    headless: HEADLESS,
  });
  context = await browserFixture.browser.newContext({
    recordVideo: { dir: "./reports/media/videos" },
  });
  pageFixture.page = await context.newPage();
  debugLog(`Opened a new page in the browser context`);
}

/**
 * Cleans up after a test scenario execution, attaching screenshots and videos to the test report if the test failed,
 * and removing videos for passed tests. It handles the final teardown steps for the testing environment.
 *
 * @param {IWorld} world - The test world context for attaching media.
 * @param {any} scenario - The executed test scenario, used to determine if it failed or passed.
 * @param {string} screenshotPath - The path for saving screenshots
 * @param {string} tag - The tag identifying the current test scenario.
 */
export async function tearDownWorld(
  world: IWorld,
  scenario: any,
  screenshotPath: string,
  tag: string,
) {
  console.log(`    -After ${tag} tag is executing`);
  await sleep(2000);
  if (scenario.result.status === "FAILED") {
    // Ensure `page` is passed to the screenshot function
    await screenshotFunctions.takeVideoAndScreenshot(
      scenario,
      screenshotPath,
      world,
    );
  }
  console.log(scenario.result.status);
  if (scenario.result.status === "PASSED") {
    const video = pageFixture.page.video();
    if (video) {
      const videoPath = await video.path();
      console.log("Video path:", videoPath);
    }
  }

  await tearDownScenario();
}

/**
 * Initializes the testing environment by building necessary fixtures for browser and page based on the specified tag.
 * This function is designed to be executed before each tagged test scenario to ensure a consistent setup.
 * It logs the beginning and completion of the setup process and handles any errors that occur during the environment setup.
 *
 * @param {string} tag - The tag associated with the test scenario that dictates specific setup configurations or logging.
 */
export async function buildWorld(tag: string) {
  debugLog(`Starting the ${tag} before tag execution`);

  console.log(`    -${tag} before tag is executing`);

  try {
    // Build PageFixure and browserFixture
    await buildScenario();
  } catch (error) {
    debugLog(
      `Encountered an error during ${tag} before tag execution: ${
        (error as Error).message
      }`,
    );
    throw error;
  }

  debugLog(`Completed the ${tag} before tag execution`);
}

/**
 * Takes a string and separates each character, storing them in an array.
 * @param inputString The string to be separated into characters.
 * @returns An array of characters from the input string.
 */
export function separateCharacters(inputString: string): string[] {
  // Split the string into an array of characters
  const characterArray = inputString.split("");

  // Return the array containing each character from the input string
  return characterArray;
}

// Function to check for operator characters and return the corresponding symbol/unicode character
export function checkForOperatorChar(inputChar: string) {
  // Check for '+' operator
  if (inputChar.includes("+")) {
    return "+";
  }
  // Check for '-' operator
  else if (inputChar.includes("-")) {
    return "−";
  }
  // Check for '*' operator
  else if (inputChar.includes("x")) {
    return "×";
  }
  // Check for '/' operator
  else if (inputChar.includes("/")) {
    return "÷";
  }
  // Check for '%' operator
  else if (inputChar.includes("%")) {
    return "%";
  }
  // Optional: handle the case where no known operator is found
  else {
    return inputChar; // or return undefined, or any other appropriate value or handling
  }
}
