import { BeforeAll } from "@cucumber/cucumber";
import * as functions from "../../support/functions";

/**
 * This hook will be executed before all scenarios.
 * It logs a message and clears any old report files.
 */
BeforeAll(async function () {
  console.log(
    "    -BeforeAll hook is executing, clearing any old report files.",
  );
  await functions.clearOldReports();
});
