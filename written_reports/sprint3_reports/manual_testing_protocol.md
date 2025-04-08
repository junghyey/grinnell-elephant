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
We have identifier for the homepage.

1. homePage

   <img width="300" alt="image" src="https://github.com/user-attachments/assets/3bfe739d-9293-456c-97ee-cea21a656048" />


We have identifiers for each page in the manual.

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
3. Verify you are on manualFirstPage (showing Welcome!)
4. Tap the Next button (->) (identified by nextButton)
5. Verify you land on the second page (manualSecondPage)
6. Tap Next again
7. Verify you are on the third page (manualThirdPage)
8. Tap Next again
9. Verify you are on the fourth page, which is the last page (manualFourthPage)


