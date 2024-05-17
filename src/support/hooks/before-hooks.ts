import { Before } from "@cucumber/cucumber";
import * as functions from "../../support/functions";

/**
 * This hook will be executed before each scenario tagged with @noLogin.
 * It launches a browser and creates a new page in a new context.
 * Future versions may only open a new tab in the browser to reduce test run times and compute.
 *
 * @param {object} scenario - The scenario that is about to be executed.
 */
Before({ tags: "@noLogin" }, async function (scenario) {
  this.scenarioName = scenario.pickle.name;
  await functions.buildWorld("@noLogin");
});
