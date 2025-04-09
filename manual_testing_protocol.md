## Elephant Manual App Testing Protocol

---

## Overview
This document shows the procedures for manually testing the Elephant app. The tests are performed by humans and verify that the UI works as expected. This protocol may replace the automated testing 
by testing UI transitions and functions that are not easily and readily testable via XCUI Tes,t and limited support for SwiftUI navigation behavior.

---
## "ContentView" Manual Testing

### Goal
- All the buttons need to navigate to the correct page or adjust the widget as necessary as development progresses.

### Requirements
- Application is installed on macOS
- Includes the most recent version of ManualView.swift

### The Homepage
<img width="496" alt="image" src="https://github.com/user-attachments/assets/6f50a8c5-6533-4f39-bf25-ae3a6f76ed7d" />

### The Manual Page
<img width="496" alt="image" src="https://github.com/user-attachments/assets/8a1f1e1b-b2a9-4d96-8e38-cb244a246e8b" />

### The Settings Page
<img width="495" alt="image" src="https://github.com/user-attachments/assets/acd60674-8233-4f67-b051-139d06f4c246" />

### The Collectible Shop
<img width="496" alt="image" src="https://github.com/user-attachments/assets/d4efdeb3-b4a6-4023-803c-5e5e9308cca8" />

### Steps and Expectations
1. Launch the Elephant app (it opens to the Homepage)
   
2. Begin at the top:
 
   a. Click "?" to navigate to an information page, the manual page.

   b. Navigate back to the homepage, follow the instructions of the "ManualView" Manual Testing, or relaunch the app.

   c. Click "⛭" to navigate to an app personalization page, the settings page.

   d. Navigate back to the homepage, follow the instructions of the "SettingsView Manual Testing", or relaunch the app.

3. The Pomodoro and Stopwatch buttons are still under development; skip past those.

4. Click "Collectibles Shop" to navigate to the in-app store, the Collectibles Shop.

5. Navigate back to the homepage, follow the instructions of the "ShopMainPageView Manual Testing", or relaunch the app.


## "ManualView" Manual Testing

### Goal
- Make sure every page is presented correctly (all four pages) and the buttons next, back, home buttons navigate to the correct page.

### Requirements
- Application is installed in macOS
- Includes the most recent version of ManualView.swift


### Page Identifiers
- We have an identifier for the homepage.

1. homePage

<img width="496" alt="image" src="https://github.com/user-attachments/assets/6f50a8c5-6533-4f39-bf25-ae3a6f76ed7d" />


- We have an identifier for the homepage.

1. Manual Button (manualPage)

- We have identifiers for each page in the manual.

1. manualFirstPage
   
   <img width="500" alt="image" src="https://github.com/user-attachments/assets/30480a2d-9841-410f-bbcb-5cdfc0af299f" />

3. manualSecondPage
   
   <img width="500" alt="image" src="https://github.com/user-attachments/assets/cb1260ca-2ca7-4ffd-844a-a0699c6b1e1f" />

4. manualThirdPage
   
   <img width="500" alt="image" src="https://github.com/user-attachments/assets/0e880dde-9b09-455b-b9ad-9842785abe98" />

5. manualFourthPage
   
  <img width="500" alt="image" src="https://github.com/user-attachments/assets/daec1fbf-4056-46af-9040-cc7f01f49762" />

6. Button in each page:

<img width="500" alt="image" src="https://github.com/user-attachments/assets/e9738837-5d1f-4c66-9c64-64944d4adda3" />


### "Next" Button Testing (Forward)

#### Steps:

1. Launch the Elephant app (we see homePage)
2. Tap the Manual Button (identifier: manualPage), which is a ? button on the right corner of the top page
3. Make sure you are on manualFirstPage (showing Welcome!)
4. Tap the nextButton (->) (identified by nextButton)
5. Make sure you are on the second page (manualSecondPage)
6. Tap nextButton again
7. Make sure you are on the third page (manualThirdPage)
8. Tap nextButton again
9. Make sure you are on the fourth page, which is the last page (manualFourthPage)

#### Expected:
- Each tap on "Next" goes to the next manual page

### "Back" Button Testing (Backward)

#### Steps:

1. While you are on manualFourthPage, tap the backButton (identifier: back button)
2. Make sure you are on manualThirdPage.
3. Tap backButton again.
4. Make sure you are on manualSecondPage.
5. Tap backButton again.
6. Make sure you are on manualFirstPage.


#### Expected:
- Each tap on "Back" goes to the previous manual page


### Home Button Testing

Repeat for each of the 4 pages:

1. From homePage, tap manualPage button. 
2. Use the nextButton button to go to the desired page.
3. Tap the homeButton
4. Make sure the app goes to the homePage.
   
#### Expected:
- The home button exists and each home button's manual page correctly guides to home page.

   
