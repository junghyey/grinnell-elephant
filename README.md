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

####
[Link to coding guidelines](https://google.github.io/swift/)

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
  |       |-- sprint1_plan_report.md         # this is where we have sprint1 planning report
  |       |-- sprint1_journal.md
  |       |-- sprint1_review_report.md
  |   |-- sprint2_reports/
  |       |-- sprint2_plan_report.md         # this is where we have sprint2 planning report
  |       |-- sprint2_journal.md
  |       |-- sprint2_review_report.md
  |-- Elephant
  |-- ElephantWidget 
  |-- ElephantUITests
  |-- ElephantTests
  |-- Elephant.xcodeproj      
  |
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
  - Widget Testing: All the funcionality works in the widget
  - UI testing: Validate UI flows for user experience
  - Unit Tests: Verify individual components
    
- Determining which development actions trigger a CI build:
  - Pull Request
  - Pushing to the main branch
  - (Possibly) scheduled run


# Issue Tracking Tool
Include a link to your issue tracking tool: [Elephant Dev Board🐘💻](https://trello.com/b/4KAD6ca1/elephant-dev-board-%F0%9F%90%98%F0%9F%92%BB)
