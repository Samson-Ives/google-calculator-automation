import { Page, Browser } from "@playwright/test";

export type PageFixture = {
  page: Page;
  apiData: { [url: string]: any };
};

export const pageFixture: PageFixture = {
  page: undefined as unknown as Page,
  apiData: {},
};

export type BrowserFixture = {
  browser: Browser;
};

export const browserFixture: BrowserFixture = {
  browser: undefined as unknown as Browser,
};
