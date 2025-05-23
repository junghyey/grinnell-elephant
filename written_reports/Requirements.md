# 1. Product Description 
These days, people spend a lot of time on digital services such as Netflix, VSCode, Google Docs, etc. 
Most of the tasks are completed in front of computers. Sitting for a long time using computers can lead to various health concerns such as eye dryness and back pain (bad posture). Elephant can help address these modern workplace wellness challenges with a motivating environment.

***Elephant: A Wellness Trunk*** is an extension/widget for laptops that acts as a reminder for users to take wellness breaks amidst tasks. 
These breaks will remind the user to perform wellness tasks such as stretching, drinking water, meditation, walking breaks, etc. 
Our target audience is people whose working needs are not met by existing products (e.g. pomodoro, to-do list websites), are encouraged by an aesthetic or gamified system, and want to incorporate more wellness into their working routine.   
By performing wellness activities listed on the widget, users will gain tokens to draw new accessories and characters for their widget.
This widget is versatile and can cater to different needs related to time and health. 
Students may use this app to avoid just going on their phones during study breaks and office workers may use it to get some light exercise in. 
Overall, the purpose of this widget is to promote wellness in the lives of busy people working long hours in front of their computer screens and/or simply want to gamify wellness habits into their daily routines. 

## Related Products: 
- Finch: Self-care pet – mobile app that gamifies self-care through raising pets [3] 
 1. Features: provides instructions for self-care routines, users collect tokens from completing routines to raise a pet or customize it 
 2. Limitations: Routines are general (e.g., breathing, reflections, acts of kindness), and the mobile format might lead to distractions. Elephant can be integrated into the user’s work environment as a macOS widget. 
- Time Out: a minimalist customizable timer webapp [2] 
1. Features: allows customization of working and break intervals, detailed summaries on laptop use

## Minimal User Role:   

Elephant supports several different user roles to include different usage: 

- Standard User: For personal wellness routines with full access to notifications, customization, token collectible system, two modes (default/timer modes)
- Light (Guest) User: For accessing the basic timer and reminder function without login.  

## Future User Role: 
- Team: For sharing wellness challenges with others.

---

# 2. User Personas and User Stories (functional requirements) 

## Standard User

## (1) **Gabby’s Persona** 
**Hughie (he/they):** 46 years old, very dependent on technology for daily routine, has difficulty sleeping if they don’t feel productive that day 

### Hughie’s User Stories:
- As Hughie, I need to receive general, scheduled reminders so that I can maintain the daily routine.
- As Hughie, I want an attractive widget so that I feel attracted to interact with the app often.
- As Hughie, I need to reach a new milestone so that I feel ready to end the day and fall asleep.
- As Hughie, I have trouble staying asleep and would appreciate a time-out period where I don’t receive notifications. 

## (2) **Hyeyun’s Persona**
**Karen (she/her):** Karen is a 65-year-old retired middle school teacher who is not comfortable with using technology.  
She knows how to use basic functions on a laptop. She lives alone in a suburban area and is skeptical about technology. She needs to take medication twice a day for her disease, and she has doctor’s appointments regularly, once a month. 

### Karen’s User Stories:
- As Karen, I need a tool that gives me clear and loud reminders so that I can maintain my medication schedule.
- As Karen, I need a tool with a clear tutorial so that I can use and adapt to the application without being overwhelmed.
- As Karen, I need a simple option to check my medication adherence & condition each day so that I can report my health routines to my doctor.
- As Karen (who does not trust technology), I need to know fully what information the app is collecting so that I feel secure about my private information. 

## (3) **Mae’s Persona**
**Plankton (they/them)**: Plankton is a busy 19-year-old college student in their second semester of first year. They have not found a study method that works for them, a way to stay active throughout the day, or a way to avoid procrastination. They are photosensitive, so lights and contrasts influence the technology they use.  

### Plankton’s User Stories:
- As Plankton, I need to be able to use the product without it triggering my photosensitivity so that I can use it safely without harming my health.
- As Plankton, I need flexibility to try different study methods so that I can find ones that suit my learning needs and allow me to integrate them.
- As Plankton, I need gentle activity or movement reminders so that I can incorporate physical activity or easy movement in my busy lifestyle.
- As Plankton, I need a way to track small goals for a study session so I can stay motivated and avoid not completing my work.

## Light User

## (4) **Light User Persona** 

**Protos (he/him)**: Protos is a 20 year old chef who just wants a timer to do short breaks or quick tasks at work. He does not want to sign up for another app.

### Protos’ User Stories:
- As Protos, I need a basic timer and mindful alert so I can relax and focus on my break for quick breaks
- As Protos, I don't want to sign up for the app, and am not interested in the entirety of the app.
- As Protos, I need an easy way to pump the app instantly.


## Team User

## (5) **Candice’s Persona** 
**Emilio (he/him):** common user, 30 years old, Art gallery manager who is involved in a lot of gallery planning, communications, and personal art projects. Easily distracted, prefers a flexible work style, gets bored quickly. Emilion starts a wellness challenge with his coworkers in the gallery to stay healthy and avoid burnout.

### Emilio’s User Stories:
- As Emilio, I need a tool to help me focus, as I am easily distracted when I need to work.
- As Emilio, I need reminders to take some time to take care of myself amidst my hectic schedules.
- As Emilio, I need a time management tool that can be customized based on my schedule with high variability.
- As Emilio, I need the interface to be fun but concise so that I would feel motivated but not too distracted.
- As Emilio, I want to share my wellness goals and my progress with coworkers so that we can motivate each other.
- As Emilio, I want a shared board (like Duolingo) to connect with my team.
---
## Use cases

### Use case 1
- Actor: A new user unfamiliar with the app, tokenized collectible systems, and technology in general, primarily interested in the stopwatch and Pomodoro timers.
- Goal: any new user can trigger this case to successfully access and use the stopwatch and Pomodoro timer features.
- Trigger: The user launches the app for the first time and wants to use a time management feature.
- Precondition: The user has successfully installed the app on their device. Then, the user has navigated to the user manual upon first use and added the Elephant widget to their sidebar. The app is functioning correctly with no critical errors preventing access.
- Postcondition: The user can locate and use the stopwatch and Pomodoro timer and has a good understanding on how to start, pause, reset, and adjust settings for both features.
- Flow: The user first launches the app and the homepage appears with the an inquiry $i$ that guides the user to the manual.
Once familiarized with the manual, they are introduced to the main features, including the stopwatch and Pomodoro timer on the homepage. The user would select either two options: Stopwatch and Pomodoro Timer.
Taps on Stopwatch.

A large "Start" button appears, along with "Lap" and "Reset" buttons.
The user taps "Start," and the stopwatch begins counting.
The user taps "Lap" to mark intervals or "Stop" to pause.
Tapping "Reset" clears the stopwatch.

However, if the user decides to use the Pomodoro Timer, they navigate back to the Timers screen and tap on Pomodoro Timer.

A default 25-minute session with a 5-minute break is displayed.
The user taps "Start", and the timer begins.
A notification appears when the session ends, prompting the user to complete a wellness break.
The user can adjust session and break durations in settings as described in the user manual.

The user has now successfully interacted with either the stopwatch or Pomodoro timer and can return to the home screen or exit the app.
- Alternative flow:
   - Recoverable situation(s): At any point, if the user is unsure where to go, a Help $i$ button is visible on the home screen. Tapping $i$ brings up a quick tutorial or FAQ explaining timers, token collectible system, task and wellness checklist, etc. In the case a user is unsure what Pomodoro is, the small info button on the homepage directs us to: "Pomodoro Timer" and provides a short description: "Work in focused 25-minute sessions with 5-minute breaks. Customize work and break intervals with the toggle bars below: "

   - Non-recoverable situation: If the app crashes while using a timer, the system attempts to save the session state and reload it when reopened. If it fails to reload, a message appears: "We couldn’t recover your session. Please try again."
 
### Use case 2
- Actor: Users who want to customize their wellness checklist
- Goal: any user can trigger this use case, and this use case is connected to the stories of Hughie and Emilio
- Trigger: The user is unsatisfied with the default wellness tasks in the checklist, or would like to use the app for alternative purposes
- Precondition: The customized message needs to be characters supported by the system, and should not contain more than 10 tasks
- Postcondition: User successfully creates customized wellness message
- Flow 1: adding a task on the widget interface
  1. The user clicks on the sidebar, and the widget appears on top of the sidebar
  2. The user clicks on the bottom button in the list section of the widget that says "add new task."
  3. The user types in the customized task, or presses the speech-to-text button, and creates a new task verbally
- Flow 2: adding a task from the in-app settings
  1. User opens the app from the top right corner of the widget, or the applications list
  2. User clicks on the settings button in the upper-right corner and scrolls down to the section for customizing tasks
  3. User clicks on the "add new task" button in the list section
  4. The user types in the customized task or presses the speech-to-text button and creates a new task verbally
- Alternative flows:
  -   If the app crashes before the updated task can be saved, the user will need to re-add the task
  -   If the user fails to save the updated messages, the user will need to re-add the task
  -   Non-recoverable situation: If the app crashes, the system attempts to save the session state and reload it when reopened. If the system fails to do so, it will display the state of widget that was last saved in the system.

### Use case 3
- Actor: User(s) who want to change themes/mode settings due to visual accessibility needs or just preference. Users Plankton and Hughie would utilize these settings to accommodate their accessibility or visual preferences.
- Goal: Plankton would utilize this feature to ensure the visual aspect of the app is not harmful to their photosensitivity. Hughie would utilize these settings to adjust for their aesthetic preferences.
- Trigger: The user finds the app aesthetic/color choices to be negatively impacting their experience using the app.
- Preconditions: The settings page and app must support dark and light modes, along with various (at least a few) color schemes with contrast.
- Postconditions: Users can support their needs and wants regarding the theme and mode, and have fewer to no more negative experiences using the app.
- Flow: The User opens the app (manually or through the widget), and then navigates to the settings page using the icon in the top right corner. Once in the settings pages, the User can choose between light or dark mode, and the theme choices should be right below. Once the user has made these choices, changes on the app and widget should be applied immediately. To navigate back to the home page, the user will use the home icon in the top left.
- Alternative flow: The interface may not update immediately or after the User saves the settings. If it does not update, the User will have an option to report it, or the app will detect and ask the User to restart the app.

### Use case 4
- Actor: User(s) who want to utilize the app for the tokenized collectible system and practice improving their wellness habits in the process.
- Goal: we anticipate many users could fit in this case since the tokenized earning systems comes from doing wellness tasks so we do run the risk of users strictly trying to earn all the collectibles instead of focusing on completing wellness tasks.
- Trigger this use case? When a user engages with wellness tasks within the app, either out of intrinsic motivation to improve wellness habits or extrinsically to collect rewards.
- Preconditions: The tokenized collectible system must be active and accessible with a stable connection to Wifi. Wellness tasks must be available and properly logged upon completion. The app will have a way to track task completion and prevent excessive gamification that undermines actual wellness.
- Postconditions: Users successfully complete wellness tasks and receive tokenized collectibles based on genuine participation.
- Flow: The user opens the app and navigates to the wellness tasks section and selects a wellness task to complete (e.g., meditation, journaling, hydration tracking). Once done, the app logs the action and verifies completion criteria.
If the criteria are met, the user receives a token and can view collected tokens in their profile to track progress.
- Alternative flow:
   - Recoverable situation: If a task is completed but not logged due to a minor system issue, the user can refresh the app or manually write the task in for a token again.
   - Non-recoverable situation: If a user tries to rapidly complete tasks without meaningful engagement, the app detects this activity and either issues a warning or limits the token within a certain time frame beginning from the initial behavior detected.
   - User disengagement: If a user loses interest due to low reward frequency or difficulty, the app provides encouragement, alternative wellness challenges, or reminders to promote sustained engagement.

---
  
___

# 3. Nonfunctional Requirements
1. **Security & Privacy**: Since we are using people’s data, maintaining users' security and privacy is one of our top priorities. Our implementation assures our commitment to protect users’ information. We need to encrypt the user data and personal health information (such as medications) must be stored with HIPAA regulation [1].  
2. **Accessibility**: We need to make sure our app is free, available, and accessible to all (MacOS users) people, especially catering to specific features for people with disabilities. For example, we include screen readers, high-contrast mode for photosensitivity, or black/white versions. We also aim to support languages other than English to make it accessible to non-English speakers.
3. **Compatibility**: Since we are developing an app for MacBooks, we need to make it compatible with all macOS versions, not only the specific ones.

---

# 4. External Requirements
1. The product must be robust against errors that can reasonably be expected to occur, such as invalid user input
   - We need to implement structured/standardized error handling for errors such as invalid input, crashes, or connectivity problems.
   - The app should detect when the device is connected to or not connected to Wi-Fi. If it is, the app should function as is. If not, we want the app to inform the user (“Connection not found. Can't send notifications”) and only allow for a standard timer mode. We need to queue for the missed notifications upon reconnection.
   - The app should limit user input to a reasonable number of characters (i.e. 150+ is too many characters for a reminder).
   - A feature without bug-checking would not be included, even if it seems fine.
2. The product is a stand-alone application (AppStore), and we need to provide a reasonable means for others to easily download, install, and run it.
   - The app will be on the App Store, available for download for free.
   - However, our team is comprised of both people who own a MacBook and people who don’t. With this in mind, we are considering developing with universal users in mind.
3. The code should be well-documented to streamline the process of enhancements/updates without hassle.
4. The scope of the project must match the resources you have, the number of team members assigned, and the time available.
   - There are 4 people in our team, and we have one semester to develop this product. Given these constraints, our product should get to the stage of MVP (minimal viable product). In the case of our product, an MVP would be an App/Widget that pushes notifications to the user reminding and suggesting wellness breaks.
   - MVP should not take up more than 500 MB as a comparable product. Finch is around 477.6MB in the App Store [3].
   - This MVP should have a structured interface that meets the needs of different clients, with differences considered. The interface should be simple to understand, with the necessary features in an organized and aesthetic manner. Adding extra features such as compatibility with Apple accessories and token exchange with friends will be implemented as the product evolves, and if time is available.

---

# 5. Scope and Feature List 
1. Major features:
   - MacOS widget UI
      - Contain two main sections: the avatar section that displays the timer, and the list section that displays the wellness task list and the number of tokens users have
      - Avatars can be changed through the shop interface
      - Widget interface also includes a settings button that will open the settings page in the app
   - App interface
      - Buttons: exit, manual, settings, modes, shop
      - Shop: Users can unlock and set new avatars through the shop interface
   - Settings
      - Customizable size
      - Customizable color theme 
      - Dark/light mode support with high contrast options
      - Black/white mode
      - Turn on/off sound cues
      - Customize task lists
   - Notifications
      - Push notifications to remind users to take wellness breaks
      - If “Do-not-disturb scheduling”, hold the reminders
      - Customizable notification content and intervals (stopwatch mode only)
      - Offline notification queueing
    - Modes
      - Stopwatch mode: interface that includes the wellness task bulletin board, reminders, and a character on display
      - Pomodoro mode: incorporates an additional pomodoro timer in the interface, in which the user can customize work and break intervals
         - List rotating option: Users can construct two lists, one for work tasks and one for wellness breaks, for which the former will show up during the timer and the latter will show up during break time  
    - Token system
      - Users can obtain tokens if they complete wellness tasks
      - Users can obtain up to 10 tokens per day
      - Tokens can be exchanged for collectibles, which can be used as avatars in the widget
    - User manual
      - Pops up when the user first opens the app
      - Remains accessible through the app interface 

3. Stretch goals:
   - Compatibility with Apple Watch
    - Notification, Logging
  - Networking features such as friends and exchanging systems
    - Connect Friends
    - Share results (achievements, activities, etc.)
  - Additional collectibles: accessories to customize collectible characters
  - Keyboard shortcuts to allow navigation without a trackpad/mouse
  - Option for widget to exist as an independent window on the desktop instead of in the sidebar
    
3. Out of scope:
 - Sensing biometrics using Apple Watch and using that data.
 - Third-party app synchronization, such as calendar
 - Support Windows version
 - Complex algorithms to suggest an ideal wellness routine
 -  Mobile version 

---
# 6. Software Architecture

### System components
- Widget interface: interface that users mainly interact with, allows users to track work time, add tasks, and receive wellness reminders
- App interface: interface that allows users to modify settings, view and purchase new collectibles, and access the user manual
- Persistent storage: stores user settings, downloaded components such as collectibles, avatars, or themes
- External storage: stores client data and purchase records

### System architecture: MVC and Client-server model
  - In most use cases, the internet is not needed as data for the widget client end will be stored locally, including images, customized task lists, and settings, which can be visualized by the MVC model
<img width="963" alt="Elephant MVC model" src="https://github.com/user-attachments/assets/03494f1a-adaf-424a-ab9b-b5849f6ce997" />
  - Client will need to connect to the server to unlock new avatars or collectibles; in this way, the server tracks the client's data, including ID, downloads, and purchases, which can be visualized by the client-server model
<img width="831" alt="Elephant client-server model" src="https://github.com/user-attachments/assets/635d96b2-a5c3-4a13-82a2-5a07fa568f5f" />

# 7. Data Modeling

The ***Elephant*** App stores the following data: user information (Apple ID), user checklist(s), tokens, and collectibles.

Since the app has to store sensitive data, including but not limited to user information, user checklist(which can contain user's personal information and the health data (ex, eat medicine)), and token lists (including purchased tokens), we need to have a secure database to store these. So, we decided to use PostgreSQL. First, we can describe users, checklists (medication checklists), and token information with relationships. Moreover, it supports HIPAA compliance and AES-256 encryption [4]. PostgreSQL ensures data reliability and integrity by being  ACID-compliant [5].

## Database Scheme

Since Elephant needs real-time updates for the checklist and secure storage for user information, we use:
- PostgreSQL for storing data
- We will first focus on storing user data on the local machine rather than server.
- Firebase for real-time update/storage or storing images for the collectible shop [6] (This might be changed based on the funding situation of the Catalyst program; however, the free plan looks viable)
- An alternative to Firebase is **Supabase**, which has both PostgreSQL (Firebase is NoSQL) and real-time ability (real-time server). [7]

### Diagram

<img src="https://github.com/user-attachments/assets/b0d57f2a-594b-4f6e-95b7-90d2afb77ab3" style="width:50%;">

## Software Design

### 1. Definitions:
- **iOS App Development Environment**: Developed with SwiftUI/Xcode utilizing graphics and WidgetKit.
  - **Packages Utilized**:
    - 'SwiftUI' for the UI components for the app main page: settings (timer setting, app setting), and checklist storage
    - 'WidgetKit' for the widget, which is the place for all the major interactive jobs (like checking off the item)
    - 'Combine' for data handling, state updates, all the reactive works, and asynchronous data handling.
    - 'Foundation' for networking
    - 'Firebase SDK' real-time updates for checklists
    - 'PostgreSQL' (Backend API)- store checklist & user data
    - `Testing` and `XCTest` for the testing suite.

### 2. Component Responsibilities

#### 2.1 Frontend (SwiftUI)
- Purpose: Managing the user interface (what users see) for the app's main page, display, and authentication.
- Responsibilities:
  - Get historical checklist data from PostgreSQL when the app is launched.
  - Manage any changes in the app (settings, purchase, storing data)
- Primary Classes & Responsibilities (.swfit):
  -  MainView: Root view 
  -  SettingsView: User preferences
  -  TimerSettings: Controls Pomodoro/Stopwatch
  -  ChecklistControl: store the checklist that the user has added through the app screen via PostgreSQL and Firebase
  -  PurchaseControl: Apple Pay transaction.
  -  TokenControl: Controls all the tokens that the user has earned & used
  -  Collectibles: Update collectibes
- Interfaces:
  - Reads and writes checklists to PostgreSQL
  - Fetch real-time updates from Firebase
  - Reflect any changes in settings to the app
  - Provide checklist data to the widget

#### 2.2 Interactive Widget (WidgetKit)
- Purpose: Creating the interactive widget in the macOS widget bar (ex, check off items, pause, trigger real-time update).
- Responsibilities:
  - Display checklists (including interaction like checking off)
  - Allows users to check off completed items
  - Allows users to pause, resume, start Pomodoro, or a stopwatch
  - Allows users to add a new item to the checklist
  - Indicates how many tokens users have
  - Send updated checklist data to Firebase (real-time update), and sync with PostgreSQL.
 - Primary Classes:
  - ChecklistWidget: Display a checklist and allow check off and add a new task (and sync the newly added one to the checklist in ChecklistControl)
  - ChecklistDataProvider: Provide checklist data to the widget
- Interfaces:
  - Sends completed updates to Firebase, which updates PostgreSQL. 
#### 2.3 Firebase (Real-Time Update)
- Purpose: Real-time updates for the checklist and token (i.e., any tasks that need to be done in real-time)
- Responsibilities:
  - Storage for data that needs real-time updates (checklist) 
  - Instantly sync checklist completion from the widget
  - Trigger update in PostgreSQL
  - Sync token rewards/changes (subtraction if used)
- Interfaces:
  - real-time checklist and token updates to the app
  - Tell PostgreSQL when updates occur.
#### 2.4 PostgreSQL (Storage)
- Store all the data (user, purchase checklist securely)
- Responsibilities:
  - Store the checklist history
  - Sync  Firebase to keep the checklist updated
  - Save all the user information for the app
- Interfaces:
  - Read/write user data using API
  - Sync with Firebase (for real-time update)
#### 2.5  Testing
- **Testing**: Swift testing integrates with the Swift Package Manager testing workflow and supports:
  - Flexible test organization, allowing test functions to be defined almost anywhere with a single attribute.
  - Hierarchical grouping of related tests using Swift’s type system for clear organization.
  - Swift concurrency integration for robust and efficient asynchronous testing.
  - Parameterized test functions to cover a wide range of inputs efficiently.
  - Dynamic test enabling based on runtime conditions, enhancing flexibility.
  - In-process parallelization of tests for faster execution.
  - Test categorization using customizable tags for better traceability.
  - Direct association of bugs with the tests that verify their fixes or reproduce problems. [8]

- **XCTest**: An abstract base class for creating, managing, and executing tests. [9]

### 3. Data Flow
Data transfer within the program is structured to reduce coupling:
- **Interfaces**: The app uses `SwiftUI` as a bridge for interacting with both the app interface and the widget `WidgetKit`. 
- **Data Flow**: Components exchange minimal data to ensure modularity, focusing on user preferences like widget appearance settings (coloring, text size, themes) and widget updates.
  - Main App <--> PostgreSQL <--> Firebase
    - All the data in the Main app is stored in PostgreSQL
    - The real-time update is reflected in the checklist through Firebase, and Firebase triggers updates in PostgreSQL
    - The updated data in PostgreSQL is reflected in the Main app.
  - WidgetKKit<-->Firebase<-->PostgreSQL
    - Widget updates Firebase when the user checks off an item.
    - Widget gets updated checklist from Firebase (like a cache)
    - Firebase syncs the checklist update to PostgreSQL

---


---
# 8. References (ACM Format)
[1] Apple. 2024. Health App & Privacy. Apple Inc. Retrieved February 4, 2025, from https://www.apple.com/legal/privacy/data/en/health-app/#:~:text=Apple%20will%20maintain%20the%20Health,data%20you%20share%20with%20them. 

[2] Dejal Systems, LLC. 2024. Time Out (Version 2.9.7) [Mobile app]. App Store. Retrieved from https://apps.apple.com/us/app/time-out-break-reminders/id402592703?mt=12. 

[3] Finch Care Public Benefit Corporation. 2021. Finch: Self-Care Pet (Version 3.72.63) [Mobile app]. App Store. Retrieved from https://apps.apple.com/us/app/finch-self-care-pet/id1528595748. 

[4] TheCloudFleet. 2025. Your guide to HIPAA-compliant PostgreSQL databases. LinkedIn Pulse. Retrieved from https://www.linkedin.com/pulse/your-guide-hipaa-compliant-postgresql-databases-thecloudfleet-evb9c/.

[5] Eseme, S. 2025. ACID compliance in relational databases. Mastering Backend. Retrieved from https://publication.masteringbackend.com/acid-compliance-in-relational-databases-97091c6aae98.

[6] Google. 2025. Firebase pricing. Firebase. Retrieved from https://firebase.google.com/pricing.

[7] Supabase. 2025. Supabase database. Supabase. Retrieved from https://supabase.com/database.

[8] Swift Testing. Apple Inc. 2025. Retrieved from https://developer.apple.com/documentation/testing/.

[9] XCTest package. Apple Inc. 2025. Retrieved from https://developer.apple.com/documentation/xctest/

