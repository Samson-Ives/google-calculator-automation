import { After } from "@cucumber/cucumber";
import * as functions from "../../support/functions";

/**
 * This hook will be executed after each scenario tagged with @noLogin.
 * It handles the teardown process, including taking failure screenshots.
 *
 * @param {object} scenario - The scenario that just finished.
 */
After({ tags: "@noLogin" }, async function (scenario: any) {
  await functions.tearDownWorld(
    this,
    scenario,
    "./reports/media/failure-screenshots/",
    "@noLogin",
  );
});
