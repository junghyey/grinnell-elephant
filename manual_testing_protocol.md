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
<img width="496" alt="image" src="https://github.com/user-attachments/assets/6877e659-e13f-4db7-aad7-164f9e391d87" />
<img width="496" alt="image" src="https://github.com/user-attachments/assets/01f5c153-fb2e-44f5-82fe-88bc800f586e" />



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


## SettingsView Manual Testing

### Goal  
Ensure that all buttons and views within the `SettingsView` (settingsPage) function as intended, including correct navigation, updates to app state (such as theme and mode), and time configuration changes.
This tests the settingsPage.

### Requirements  
- Working implementation of `SettingsView` in the Elephant app  
- Navigation link to `SettingsView` from HomePage
- Functioning buttons and sliders within `SettingsView`
---

#### Identifiers: backButton, modeButton, themesButton

<img widith = "300" alt = "image" src ="https://github.com/user-attachments/assets/b13aebe5-078b-4aa7-9603-b701b00bc156" />

### "Back" Button Testing (Back Navigation)
#### Steps:
1. Launch the Elephant app (we see the Home Page)
2. Tap the **SettingsPage Button** (identifier: Gear Icon in the top-right corner)
3. Make sure you end up in the settingsPage.
4. Tap a button that pushes to a new view (e.g., Mode or Themes)
5. Verify the new view appears (e.g., change in background color or content)
6. Tap the **Back Button** in the navigation bar
7. Ensure that you return to the Home Page

#### Expected:
- Tapping the back button from within the `settingsPage` navigates the user back to the Home Page.


### "Mode" Button Testing (Dark / Light Mode Toggle)

#### Steps:
1. Launch the Elephant app
2. Tap the **SettingsPage Button**
3. Tap the **"Mode"** button (identifier: `modeButton`)
4. Observe that the app layout changes (Light ↔ Dark Mode)
5. Navigate to other views (Home, Manual, Timer) to ensure the mode persists

#### Expected:
- Tapping Mode toggles between Light and Dark mode
- The change applies consistently across all main views


### "Theme" Button Testing (Background Color Selection)

#### Steps:
1. Launch the Elephant app
2. Tap the **SettingsPage Button**
3. Tap one of the **Theme Buttons** (e.g., Blue, Yellow, Pink)
4. Observe that the background color of the app changes
5. Navigate between views to confirm the theme persists

#### Expected:
- Tapping a Theme button updates the app’s background color
- The selected theme is applied consistently across the app

###  "Checklist" Sheet Testing (Pop-up from Settings)
>  **Note:** Checklist customization and persistence features are still under development. Further testing is required once development is complete.

<img width="300" alt="image" src="https://github.com/user-attachments/assets/6877e659-e13f-4db7-aad7-164f9e391d87" />

#### Steps:
1. Launch the Elephant app (we see the Home Page)
2. Tap the **settingsPageButton** (identifier: Gear Icon)
3. Tap the **"Add New Custom Checklist"** button 
4. Ensure the checklist sheet appears (default name: "Checklist #1")
5. Tap either the **Save** or **Cancel** button
6. Confirm the sheet closes and you are returned to the `SettingsView`

#### Expected:
- Tapping the Checklist button opens a Checklist sheet
- Tapping Save or Cancel dismisses the sheet and returns to the Settings view



---
#### Identifiers : pomodoroTimeSetting, stopwatchTimeSetting
<img width="300" alt="image" src="https://github.com/user-attachments/assets/01f5c153-fb2e-44f5-82fe-88bc800f586e" />


### "Pomodoro Time Settings" Testing

#### Steps:
1. Launch the Elephant app
2. Tap the **settingsPageButton** (Gear icon)
3. Scroll to the **PomodoroTimeSettings** section
4. Move the **Work Duration** and **Short Break Duration** sliders
5. Observe the updated time values shown in real time
6. (Optional) Navigate to the Pomodoro widget or related timer screen to verify usage of updated values

#### Expected:
- Sliders adjust the duration of work and break periods
- Changes are saved and reflected in Pomodoro-related views


### "Stopwatch Time Settings" Testing

#### Steps:
1. Launch the Elephant app
2. Tap the **SettingsPage Button** (Gear icon)
3. Scroll to the **Stopwatch Time Settings** section
4. Move the **Reminder Intervals** slider (between 20 and 120 minutes)
5. Observe the updated value and verify that the slider can move within the allowed range

#### Expected:
- Slider value updates within the specified bounds (20 to 120 minutes)
- New time is saved and will be used for future break notifications in Stopwatch Widget (once fully integrated)
