# Selenium testing in Eclipse

## Prerequisites

1. Start the application on Apache Tomcat 9 and confirm that `http://localhost:8080/interview/index.jsp` opens.
2. Install Selenium Java 4.x. Download the Selenium Java ZIP and add `selenium-java-4.x.x.jar` plus every JAR in its `lib` folder to the Eclipse project build path using **Project > Properties > Java Build Path > Libraries > Add External JARs**.
3. Use Selenium 4.6 or later so Selenium Manager can locate the matching Chrome, Firefox, or Edge driver. The browser must be installed.

The test source is `src/test/java/com/example/selenium/InterviewPortalSeleniumTest.java`. It is a plain Java application and does not require JUnit or Maven.

## Eclipse setup

1. Right-click the project and select **Refresh**.
2. Add `src/test/java` as a source folder if Eclipse has not detected it: **Project > Properties > Java Build Path > Source > Add Folder**.
3. Right-click `InterviewPortalSeleniumTest.java` and select **Run As > Java Application**.

Use these program arguments in **Run Configurations > Arguments > Program arguments**:

```text
--browser=chrome --base-url=http://localhost:8080/interview --headless=false
```

Supported browsers are `chrome`, `firefox`, and `edge`. Change `--base-url` for a different Tomcat context path.

## Coverage

- Chrome, Firefox, and Edge launch.
- Current URL, page title, page source capture, refresh, navigation back/forward, and `switchTo()` between browser tabs.
- `isSelected`, `isDisplayed`, `isEnabled`, `click`, `clear`, `sendKeys`, `getText`, `getAttribute`, `findElement`, and `findElements`.
- Locators using `id`, `name`, `className`, `linkText`, `tagName`, `cssSelector`, and `xpath`.

The captured source is written to `build/selenium-output/index-page-source.html`.