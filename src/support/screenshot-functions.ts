import { pageFixture } from "./page-fixture";
import { IWorld } from "@cucumber/cucumber";
const fs = require("fs").promises;

/**
 * Takes a screenshot and video of the current page, then attaches them to the test report.
 * @param scenario
 * @param screenshotPath
 * @param world
 */
export async function takeVideoAndScreenshot(
  scenario: any,
  screenshotPath: string,
  world: IWorld<any>,
) {
  const buffer = await takeScreenshot(scenario, screenshotPath);

  // Attach the screenshot buffer to the report
  await world.attach(buffer, "image/png");

  const video = pageFixture.page.video();
  if (video) {
    const videoPath = await video.path();
    // Read the video file into a buffer
    const videoBuffer = await fs.readFile(videoPath);
    // Convert the buffer to a base64-encoded string
    const videoBase64 = videoBuffer.toString("base64");
    // Attach the base64-encoded video specifying the MIME type correctly
    await world.attach(videoBase64, { mediaType: "base64:video/mp4" });
  }
}

/**
 * Captures and saves a page screenshot for a given scenario, appending the scenario name and a timestamp to the filename.
 * Returns the screenshot as a buffer. Assumes pageFixture.page is the current page context.
 *
 * @param {any} scenario - The test scenario, used for naming the screenshot.
 * @param {string} filePath - Base path for saving the screenshot.
 * @returns {Promise<Buffer>} A buffer with the screenshot data.
 */
async function takeScreenshot(scenario: any, filePath: string) {
  // Get current date and time
  const now = new Date();
  const timestamp = now.toISOString().replace(/[:T]/g, "-").slice(0, -5); // Format as 'YYYY-MM-DD-HH-MM'

  // Update screenshotPath to include the timestamp
  const screenshotPath = `${filePath}${scenario.pickle.name.replace(/\s+/g, "_")}_${timestamp}.png`;

  pageFixture.page.screenshot({ path: screenshotPath });
  const buffer = await pageFixture.page.screenshot();

  return buffer;
}
