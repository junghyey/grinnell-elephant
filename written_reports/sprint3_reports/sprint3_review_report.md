# Sprint 3 Review

This sprint, we focsed on the development

### How has your product improved or progressed from a customer perspective? Describe high-level features that a non-technical user could recognize and appreciate.

 We have basic functionalities of the app compared to the previous sprints where we did not have an actual working product. Moreover, in terms of aesthetics, it looks better.

### What progress have you made that is not visible to a common user?

The way we store the data as in json file task checklist is not visible to a common user.
Aside from that we focused on adding more features and app rather than backend. So, there aren't evident changes that might not be visitble to a common user. In the next sprint, we are planning on adding.


### How to activate each feature:

The step is similar to the testing protocol. 

### Requirements
- Application is installed on macOS
- Includes the most recent version of the github

1. Download Xcode
2. Git clone this package
3. Click play button (like play button)
4. The app will pop up in the dock station of the mac
5. The app will pop up and the home page will show.

### Features/View 

### The Homepage
<img width="496" alt="image" src="https://github.com/user-attachments/assets/690a8073-8dca-4c45-853c-af2240f7f5ce" />

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

   b. Navigate back to the homepage, follow the instructions of the "ManualView", or relaunch the app.

   c. Click "⛭" to navigate to an app personalization page, the settings page.

   d. Navigate back to the homepage, follow the instructions of the "SettingsView", or relaunch the app.

3. The Pomodoro and Stopwatch buttons are still under development; skip past those.

4. Click "Collectibles Shop" to navigate to the in-app store, the Collectibles Shop.

5. Navigate back to the homepage, follow the instructions of the "ShopMainPageView", or relaunch the app.
   

## ManualView

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


## Executing Next Button on each page
1. Basically tap nextButton(->) in each page. (The manualFourthPage does not have nextButton)

## Example Flow
1. Launch the Elephant app (we see homePage)
2. Tap the Manual Button (identifier: manualPage), which is a ? button on the right corner of the top page
3. Make sure you are on manualFirstPage (showing Welcome!)
4. Tap the nextButton (->)  to go to the second page (identified by nextButton)
5. Make sure you are on the second page (manualSecondPage)
6. Tap nextButton again
7. Make sure you are on the third page (manualThirdPage)
8. Tap nextButton again
9. Make sure you are on the fourth page, which is the last page (manualFourthPage)

## Back Button on each page

1. Basically tap nextButton(->) in each page. (The manualFirstPage does not have backButton)

 ## Example Flow
1. While you are on manualFourthPage, tap the backButton (identifier: back button)
2. Make sure you are on manualThirdPage.
3. Tap backButton again.
4. Make sure you are on manualSecondPage.
5. Tap backButton again.
6. Make sure you are on manualFirstPage.


### Home Button Testing
Repeat for each of the 4 pages:

1. From homePage, tap manualPage button. 
2. Use the nextButton button to go to the desired page.
3. Tap the homeButton
4. Make sure the app goes to the homePage.
   
## MainStoreView
### Page identifiers

<img width="554" alt="Screenshot 2025-04-08 at 9 28 47 PM" src="https://github.com/user-attachments/assets/40f277f3-7626-4f2a-aedf-4dbce675a755" />

- The page is accessible through button with identifier "shopPage" on the homePage,

### Steps
-  Click on the shopPage button on the main page to bring us back to the shop page
- Next, from the first listing on the first row, we click on each shop listing and check if they bring us to a new page with the corresponding item listing, from left to right, top to bottom
     - For instance, for the button "shopButton_mammal-squirrel", we expect to arrive at a page with a squirrel

## 


## Shop




