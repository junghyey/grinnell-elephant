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

###  homePage
<img width="496" alt="image" src="https://github.com/user-attachments/assets/6f50a8c5-6533-4f39-bf25-ae3a6f76ed7d" />

###  manualPage
<img width="496" alt="image" src="https://github.com/user-attachments/assets/8a1f1e1b-b2a9-4d96-8e38-cb244a246e8b" />

###  settingsPage
![Image (27)](https://github.com/user-attachments/assets/6877e659-e13f-4db7-aad7-164f9e391d87)

![Image (28)](https://github.com/user-attachments/assets/01f5c153-fb2e-44f5-82fe-88bc800f586e)


###  collectiblePage
<img width="496" alt="image" src="https://github.com/user-attachments/assets/d4efdeb3-b4a6-4023-803c-5e5e9308cca8" />

### Steps and Expectations
1. Launch the Elephant app (it opens to the Homepage)
   
2. Begin at the top:
 
   a. Click "?" to navigate to an information page, the manual page.

   b. Navigate back to the homepage, follow the instructions of the "ManualView" Manual Testing, or relaunch the app.

   c. Click "⛭" to navigate to an app personalization page, the settingsPage.

   d. Navigate back to the homepage, follow the instructions of the "SettingsView Manual Testing", or relaunch the app.

3. The Pomodoro and Stopwatch buttons are still under development; skip past those.

4. Click "Collectibles Shop" to navigate to the in-app store, the Collectibles Shop.

5. Navigate back to the homepage, follow the instructions of the "ShopMainPageView Manual Testing", or relaunch the app.

## "MainStoreView" Manual Testing

### Goal
- Make sure and back button and all items on the store listing are clickable

### Requirements
- Application is installed in macOS
- Includes the most recent version of the Elephant app

### Steps

### Back Button Testing
- Open the main app, which defaults to the home page view
- Click button named "Collectibles Shop"
- Verify you are on the collectiblePage
- Click the back button and verify you are on the homePage

### Collectibles Shop (inside)
- While you are in the homePage:
- Click the "Collectibles Shop" button at the bottom of home page
- From the first listing on the first row, we click on each shop listing and check if they bring us to a new page with the corresponding item listing, from left to right, top to bottom
   - For instance, for the button "shopButton_mammal-elephant", we expect to arrive at a page with an elephant
     
<img width="555" alt="Screenshot 2025-04-09 at 10 43 39 AM" src="https://github.com/user-attachments/assets/d1f2061a-ab6a-4c50-a79f-35956386ef99" />
<img width="551" alt="Screenshot 2025-04-09 at 11 18 02 AM" src="https://github.com/user-attachments/assets/0e58dfb3-e6d4-42de-8038-8b10ce8a831f" />
 
## "ItemView" Manual Testing

### Goal
- Make sure and back button and the purchase button on the item page are clickable

### Requirements
- Application is installed in macOS
- Includes the most recent version of the Elephant app

### Identifiers
<img width="555" alt="Screenshot 2025-04-09 at 10 43 39 AM" src="https://github.com/user-attachments/assets/6f9a3145-0572-4233-98f8-89cc737ff88d" />

- The page is accessible through corresponding listing button in MainShopView, with identifiers "shopButton_item.imageName" and an image with the corresponding animal
- All buttons on this page has an identifier "itemButton_item.imageName_function"
     - Back button: identifier "itemButton_item.imageName_back"
     - Purchase button: identifier "itemButton_item.imageName_purchase"

### Back Button Testing
<img width="558" alt="Screenshot 2025-04-09 at 10 44 08 AM" src="https://github.com/user-attachments/assets/42d8c202-90a5-4b53-a53e-5e5f68531e70" />

- Open the main app, which defaults to the home page view
- Click the "Collectibles Shop" button at the bottom of home page
- Click on the item listing that you want to test the item page for on the main shop page
- Verify you are on the correct listing item view
- Click the back button and verify you are on the main shop page

### Other button testing
<img width="547" alt="Screenshot 2025-04-09 at 10 43 47 AM" src="https://github.com/user-attachments/assets/90ba78ab-4c7f-4cd9-a90c-5b3ab9636ed6" />
- Next, we click on the buy button and see if a confirmation dialogue pops up
<img width="553" alt="Screenshot 2025-04-09 at 10 43 55 AM" src="https://github.com/user-attachments/assets/e54dbe17-4c10-4836-963f-30168b650f3b" />

- Check that both `Cancel` and `Confirm` buttons on the confirmation dialogue is clickable

## "ManualView" Manual Testing

### Goal
- Make sure every page is presented correctly (all four pages) and the buttons next, back, home buttons navigate to the correct page.

### Requirements
- Application is installed in macOS
- Includes the most recent version of ManualView.swift


### Page Identifiers
- We have an identifier for the homepage.

1. homePage

   <img width="300" alt="image" src="https://github.com/user-attachments/assets/3bfe739d-9293-456c-97ee-cea21a656048" />


- We have an identifier for the homepage.

1. Manual Button (manualPage)
<img width="500" alt="image" src="https://github.com/user-attachments/assets/5cefb47e-c9d3-42fe-a134-7668f57374f6" />



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


### (nextButton) "Next" Button Testing (Forward)

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

### (backbutton) "Back" Button Testing (Backward)

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

---

## SettingsView Manual Testing

---

I am doing manual testing for the navigation link from the customizable checklist to the task list sheet, and the navigation from the settings page using the back button to the homepage view.

### "Checklist" Sheet Testing (Pop-up from Settings)

#### Steps:
- Launch the Elephant app (we see the home page)
- Tap the Settings Button (identifier: Sun Image)
- Tap the 'Add new custom checklist' Button (identifier: Checklist)
- Make sure the checklist sheet appears (default as "Checklist #1")
- Tap the Save or Cancel Button to close the sheet
- Make sure you are back on the Settings view (check for the 'Add new custom checklist' button again)

#### Expected:
- Tapping the "Checklist" button opens the checklist sheet.
- Tapping the "Save" or "Cancel" button closes the sheet and returns to the settingsView.

---
### Back Button Navigation Testing

#### Steps:
- Launch the Elephant app (we see the home page)
- Tap the Settings Button (identifier: Sun Image)
- Tap a button that pushes to a view inside the ScrollView (like Mode or Themes)
- Make sure the pushed view appears (check for background color change, for example)
- Tap the back button at the top of the Settings
- Make sure you are back on the home page (check for the Navigation Link takes you back to the home page)

#### Expected:
- The Settings view appears when you tap the Sun image from the Home page.
- Tapping the SettingsView back button returns you to the previous screen (Homepage).



