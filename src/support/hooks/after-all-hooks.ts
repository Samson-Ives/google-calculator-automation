import { AfterAll } from "@cucumber/cucumber";
import * as functions from "../../support/functions";

/**
 * This hook will be executed after all scenarios.
 * It logs a message and removes all files in the specified temporary directory.
 */
AfterAll(async function () {
  console.log("    -AfterAll hook is executing");
  await functions.removeAllFilesInDir("./src/tmp");
});
