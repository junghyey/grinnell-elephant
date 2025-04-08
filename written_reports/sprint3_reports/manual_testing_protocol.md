## Elephant Manual App Testing Protocol

---

## Overview
This document shows the procedures for manually testing the Elephant app. The tests are performed by humans and verified the UI work as expected. This protocol may reokace the automated tesing 
by testing UI transitions and functions that are not easily and readily testable via XCUI Test and limited support for SwiftUI navigation behavior.

--

## "ManualView" manual testing

### Goal
- Make sure every page is presented correctly (all four pages) and the buttons next, back, home buttons navigate to the correct page.

### Requirements
- Application is installed in MacOs
- Includes the most recent version of ManualView.swift


### Page Identifiers
- We have identifier for the homepage.

1. homePage

   <img width="300" alt="image" src="https://github.com/user-attachments/assets/3bfe739d-9293-456c-97ee-cea21a656048" />


- We have identifier for the homepage.

1. Manual Button (manualPage)
<img width="500" alt="image" src="https://github.com/user-attachments/assets/da194b81-3efc-40f5-b87c-625b7118ac55" />


- We have identifiers for each page in the manual.

1. manualFirstPage
   
   <img width="500" alt="image" src="https://github.com/user-attachments/assets/30480a2d-9841-410f-bbcb-5cdfc0af299f" />

3. manualSecondPage
   
   <img width="500" alt="image" src="https://github.com/user-attachments/assets/cb1260ca-2ca7-4ffd-844a-a0699c6b1e1f" />

4. manualThirdPage
   
   <img width="500" alt="image" src="https://github.com/user-attachments/assets/0e880dde-9b09-455b-b9ad-9842785abe98" />

5. manualFourthPage
   
  <img width="500" alt="image" src="https://github.com/user-attachments/assets/daec1fbf-4056-46af-9040-cc7f01f49762" />

### "Next" Button Testing (Forward)

#### Steps:

1. Launch the Elephant app (we see homePage)
2. Tap the Manual Button (identifier: manualPage), which is a ? button on the right corner of the top page
3. Make sure you are on manualFirstPage (showing Welcome!)
4. Tap the Next button (->) (identified by nextButton)
5. Make sure you land on the second page (manualSecondPage)
6. Tap Next again
7. Make sure you are on the third page (manualThirdPage)
8. Tap Next again
9. Make sure you are on the fourth page, which is the last page (manualFourthPage)

#### Expected:
- Each tap on "Next" goes to the next manual page

### "Back" Button Testing (Backward)

#### Steps:

1. While you are on manualFourthPage, tap the Back button (<-)
2. Make sure you are on manualThirdPage.
3. Tap Back again.
4. Make sure you are on manualSecondPage.
5. Tap Back again.
6. Make sure you are on manualFirstPage.


#### Expected:
- Each tap on "Back" goes to the previous manual page


### Home Button Testing

Repeat for each of the 4 pages:

1. From homePage, tap manualPage button (?)
2. Use the Next button to go to the desired page.
3. Tap the Home button (homeButton)
4. Make sure the app goes to the home screen (homePage).
   
#### Expected:
- The home button exists and each home button's manual page correctly guides to home page.

   
