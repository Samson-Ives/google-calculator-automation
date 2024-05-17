import { chromium, firefox, webkit, BrowserType } from "@playwright/test";
import { setDefaultTimeout } from "@cucumber/cucumber";

type BrowserEngine = "chromium" | "firefox" | "webkit";

/**
 * Parses command line arguments in the form of --key=value and returns an object map of the arguments.
 * @returns {Record<string, string>} The parsed command line arguments.
 */
function parseCommandLineArgs(): Record<string, string> {
  return process.argv.slice(2).reduce(
    (argsMap, arg) => {
      const [key, value] = arg.split("=");
      if (key.startsWith("--")) {
        argsMap[key.substring(2)] = value;
      }
      return argsMap;
    },
    {} as Record<string, string>,
  );
}

const cmdArgs = parseCommandLineArgs();
const envBrowserEngine = process.env.BROWSER_ENGINE as BrowserEngine;
const cmdBrowserEngine = cmdArgs["BROWSER_ENGINE"] as BrowserEngine;

export const setBrowser: BrowserEngine =
  cmdBrowserEngine || envBrowserEngine || "chromium";

setDefaultTimeout(120 * 1000);
export const debug = false;

const isHeadlessCmdArg = cmdArgs["HEADLESS"]
  ? cmdArgs["HEADLESS"] === "true"
  : undefined;
const isHeadlessEnvVar = process.env.HEADLESS
  ? process.env.HEADLESS === "true"
  : undefined;

export const HEADLESS = isHeadlessCmdArg ?? isHeadlessEnvVar ?? true;

export const browserType = setSelectedBrowser(setBrowser);

/**
 * Selects and returns the specified Playwright browser type based on the given engine name.
 * Supports 'chromium', 'firefox', and 'webkit'. Throws an error for invalid engine names.
 *
 * @param {BrowserEngine} engine - The name of the browser engine ('chromium', 'firefox', 'webkit').
 * @returns {BrowserType<null>} The selected Playwright browser type.
 */
function setSelectedBrowser(engine: BrowserEngine): BrowserType<null> {
  switch (engine) {
    case "chromium":
      return chromium;
    case "firefox":
      return firefox;
    case "webkit":
      return webkit;
    default:
      throw new Error(`Invalid browser engine: ${engine}`);
  }
}
