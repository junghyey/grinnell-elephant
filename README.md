# grinnell-elephant

# Project Idea and Goals
## Description
Elephant: A Wellness Trunk is an extension/widget for macOS designed to help users integrate wellness breaks into their work. These breaks will remind the user to perform wellness tasks such as stretching, drinking water, meditation, walking breaks, etc. Our ***target audience*** is people whose working needs are not met by existing products (e.g. pomodoro, to-do list), are encouraged by an aesthetic or gamified system, and want to incorporate more wellness into their working routine.   

## Goals 
- Encourage wellness habits by combining work + break for stretch/hydrate/medicaitons</br>
- Reduce burnout & improve digital wellness</br>
#### Technical Goals
- Gamify self-care by having token-based systems/collectibles </br>
- Ensure accessibility & customization</br>
- Natural MacOS integration that does not disrupt work</br>
- Data security and privacy: Secure data storage and management</br>
- Lightweight, intuitive interface</br>

### Operational Use Cases
Referring to the use cases defined in our Requirements.md document, we currently have functionality for **use cases 2 (Users who want to customize their wellness checklist)** and **3  - Users who want to change themes/mode settings due to visual accessibility needs or just preference**. For User case 2, we currently have an operating flow 2: adding tasks from the in-app settings, and for User case 3, we have the default flow operating: the User opens the app manually, and then navigates to the settings page using the Gear icon in the top right corner. Once in the settings page, the User can choose between light or dark mode, and the theme choices should be right below. Once the user has made these choices, changes to the app and widget are applied immediately. To navigate back to the home page, the user will use the Back button on the top left.

The buttons are correctly navigating to their respective pages, a test user would at this point be able to test out the working settings, shop page, manual page, and directory home page. So, we are working on getting user functionality for connection to the widget and working on the stopwatch and pomodoro features, currently still under implementation.

# Repository Layout
## Overview
This section includes the overview/outline of the repository structure.</br>
```
Root
  |-- README.md 
  |
  |-- written_reports/
  |   |-- Requirements.md
  |   |-- milestone-2-report.md
  |   |-- sprint1_reports/
  |       |-- sprint1_journal.md
  |       |-- sprint1_plan_report.md         # this is where we have sprint1 planning report
  |       |-- sprint1_review_report.md
  |   |-- sprint2_reports/
  |       |-- sprint2_journal.md
  |       |-- sprint2_plan_report.md         # this is where we have sprint2 planning report
  |       |-- sprint2_review_report.md
  |   |-- sprint3_reports/
  |       |-- sprint3_journal.md
  |       |-- sprint3_plan_report.md         # this is where we have sprint3 planning report
  |       |-- sprint3_review_report.md
  |-- Elephant
  |-- ElephantWidget 
  |-- ElephantUITests
  |-- ElephantTests
  |-- Elephant.xcodeproj      
  |-- manual_testing_protocol.md    # manual testing
```
## Description
This repository (currently) includes README.md file and written_reports folder. 
#### README.md
Front face of the repo. Contains project idea, goals, repository layout and a link to Trello currently.
#### Written Reports
The written_reports folder will contain all the reports for milestone submission. Currently, it has milestone-2-report.md, Requirements.md, sprint_journal.md, and sprint1_plan_report.md.

## Developer Guidelines
### Testing and CI
- Adding a new test to the code base:
  1. Navigate to ElephantTests directory
  2. Create a new test file (Navigate to File > New> Target select either  “UI Testing Bundle” or “Unit Testing Bundle”)
  3. Implement test sub cases using XCTestCase:
     - File > New > File from the macOS menu bar and select either “UI Test Case Class” or “Unit Test Case Class”
  4. Follow the guideline in here: https://medium.com/tauk-blog/using-xctest-and-xctestcase-for-ios-tests-28828c829b3
  * This write up is referenced from: https://medium.com/tauk-blog/using-xctest-and-xctestcase-for-ios-tests-28828c829b3
     
- Determining which tests will be executed in a CI build: 
  - Widget Testing: All the funcionality works in the widget (checklist, timer, pomodore..etc..)
  - UI testing: Validate UI flows for user experience (ex: basic interactions)
  - Collectible Testing: Check Collectible system works (purchasing, setting images..etc..)
  - Unit Tests: Verify individual components
    
- Determining which development actions trigger a CI build:
  - Pull Request
  - Pushing to the main branch
  - (Possibly) scheduled run
    
- [Link to coding guidelines](https://google.github.io/swift/)

### How to Build
- Download and launch XCode
- Clone git repository
- Once it loads:
    - Navigate to "Product"
    - Navigate to "Build" or click "⌘B"

# Issue Tracking Tool
Include a link to your issue tracking tool: [Elephant Dev Board🐘💻](https://trello.com/b/4KAD6ca1/elephant-dev-board-%F0%9F%90%98%F0%9F%92%BB)
