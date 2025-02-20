Initial Version (02/19)

# 1. Product Description 
These days people spend a lot of time on digital services such as Netflix, VSCode, Google Doc, etc. 
Most of the tasks are completed in front of computers. Sitting for a long-time using computers can lead to various health concerns such as eye dryness and back pain (bad posture). Elephant can help address these modern workplace wellness challenges with a motivating environment.   

***Elephant: A Wellness Trunk*** is an extension/widget for laptops that acts as a reminder for users to take wellness breaks amidst tasks. 
These breaks will remind the user to perform wellness tasks such as stretching, drinking water, meditation, walking breaks, etc. 
Our target audience is people whose working needs are not met by existing products (e.g. pomodoro, to-do list), are encouraged by an aesthetic or gamified system, and want to incorporate more wellness into their working routine.   
By performing wellness activities listed on the widget, users will gain tokens to draw new accessories and characters for their widget.
This widget is versatile and can cater to different needs related to time and health. 
Students may use this app to avoid just going on their phones during study breaks and office workers may use it to get some light exercise in. 
Overall, the purpose of this widget is to promote wellness in the lives of busy people working long hours in front of their computer screens. 

## Related Products: 

Finch: Self-care pet – mobile app that gamifies self-care through raising pets [3] 

 1. Features: provides instructions for self-care routines, users collect tokens from completing routines to raise a pet or customize it 
 2. Limitations: routines are general (e.g. breathing, reflections, acts of kindness), the mobile format might lead to distractions. Elephant can be integrated into the user’s work environment as a MacOS widget. 

Time Out: a minimalist customizable timer webapp [2] 

1. Features: allows customization of working and break intervals, detailed summaries on laptop use

## Minimal User Role:   

Elephant supports several different user roles to include different usage: 

- Standard User: For personal wellness routines with full access to notification, customization, token collectable system, two modes (default/timer modes)
- Light (Guest) User: For accessing the basic timer and reminder function without login.  

## Future User Role: 
- Team: For sharing wellness challenges with others.



# 2. User Personas and User stories (functional requirements) 

## (1) **Gabby’s Persona**
**Hughie (he/they):** 46 years old, very dependent on technology for daily routine, has difficulty sleeping if they didn’t feel productive that day 

### Hughie’s User Stories:
- As Hughie, I need to receive general, scheduled reminders so that I can maintain the daily routine.
- As Hughie, I want an attractive widget so that I feel attracted to interact with the app often.
- As Hughie, I need to reach a new milestone so that I feel ready to end the day and fall asleep.
- As Hughie, I have trouble staying asleep and would appreciate a time out period where I don’t receive notifications. 

## (2) **Candice’s Persona**
**Emilio (he/him):** common user 30 years old, Art gallery manager who is involved in a lot of gallery planning, communications, and personal art projects. Easily distracted, prefers flexible work style, gets bored quickly 

### Emilio’s User Stories:
- As Emilio, I need a tool to help me focus as I am easily distracted when I need to work.
- As Emilio, I need reminders to take some time to take care of myself amidst my hectic schedules.
- As Emilio, I need a time management tool that can be customized based on my schedule with high variability.
- As Emilio, I need the interface to be fun but concise so that I would feel motivated but not too distracted. 

## (3) **Hyeyun’s Persona**
**Karen (she/her):** Karen is a 65-year-old retired middle school teacher, who is not comfortable with using technology.  
She knows how to use basic functions in laptop. She lives alone in a suburban area and is skeptical about technology. She needs to take medication twice a day for her disease and she has doctor’s appointments regularly once a month. 

### Karen’s User Stories:
- As Karen, I need a tool that gives me clear and loud reminders so that I can maintain my medication schedule.
- As Karen, I need a tool with a clear tutorial so that I can use and adapt to the application without being overwhelmed.
- As Karen, I need a simple option to check my medication adherence & condition each day so that I can report my health routines to doctor.
- As Karen (who does not trust technology), I need to know fully what information the app is collecting so that I feel secure about my private information. 

## (4) **Mae’s Persona**
**Plankton (they/them)**: Plankton is a busy 19-year-old college student in their second semester of first year. They have not found a study method that works for them, a way to stay active throughout the day, or a way to avoid procrastination. They are photosensitive so lights and contrasts influence the technology they use.  

### Plankton’s User Stories:
- As Plankton, I need to be able to use the product without it triggering my photosensitivity so that I can use it safely without harming my health.
- As Plankton, I need flexibility to try different study methods so that I can find ones that suit my learning needs and allow me to integrate it.
- As Plankton, I need gentle activity or movement reminders so that I can incorporate physical activity or easy movement in my busy lifestyle.
- As Plankton, I need a way to track small goals for a study session so I can stay motivated and avoid not completing my work.

--
# 3. Nonfunctional Requirements
1. **Security & Privacy**: Since we are using people’s data, security and privacy are concerning. There must be some ways to protect users’ information. We need to encrypt the user data and personal health information (such as medications) must be stored with HIPAA regulation [1].  
2. **Accessibility**: We need to make sure our app is free, available and accessible to all (MacOS user) people regardless of their background including people with disabilities. For example, screen readers high-contrast mode for photosensitivity, or black/white versions. We also aim to support languages other than English to make it accessible to non-English speakers. 
3. **Compatibility**: Since we are developing an app for MacBooks, we need to make it compatible with all MacOS versions not only the specific ones. 

--
# 4. External Requirements
1. The product must be robust against errors that can reasonably be expected to occur, such as invalid user input
   - We need to implement structured/standardized error handling for errors such as invalid input, crashes or connectivity problems.
   - The app should detect when the device is connected to or not connected to the Wi-Fi. If it is, the app should function as is. If not, we want the app to inform the user (“Connection not found. Can't sent notifications”) and only allow a timer mode. We need to queue for the missed notifications upon reconnection.
   - The app should limit user input to a reasonable number of characters (i.e. 150+ is too many characters for a reminder).
   - A feature without bug-checking would not be included even if it seems fine.
2. The product is a stand-alone application (AppStore), we need to provide a reasonable means for others to easily download, install, and run it.
   - The app will be on the AppStore available for download for free.
   - However, our team is comprised of both people who own a MacBook and people who don’t. With this in mind, we are considering developing with universal users in mind
3. The code should be well-documented to streamline the process of enhancements/updates without hassle.
4. The scope of the project must match the resources you have, the number of team members assigned, and the time available.
   - There are 4 people in our team, and we have one semester to develop this product. Given these constraints, our product should get to the stage of MVP (minimal viable product). In the case of our product, an MVP would be an App/Widget that pushes notifications to the user reminding and suggesting wellness breaks.
   - MVP should not take up more than 500 MB as comparable product. Finch is around 477.6MB in the app store [3].
   - This MVP should have a structured interface that meets the needs of different clients with differences considered. The interface should be simple to understand with the necessary features in an organized and aesthetic manner.  Adding extra features such as compatibility with Apple accessories and token exchange with friends will be implemented as the product evolves and if time is available.

--

# 5. Scope and Feature List 
1. Major features:
   - MacOS widget UI
      - Customizable size
      - Dark/light mode support with high contrast options
      -  Black/white mode for those with color blindness
   - Push notifications to remind users to take wellness breaks
      - If “Do-not-disturb scheduling”, hold the reminders
      - Offline notification queueing
    - Customization of reminder notifications and wellness breaks
    - Tokens that can be exchanged for collectibles
    - Two modes:
     - Default mode: interface that includes the wellness task bulletin board, reminders, and a character on display
     - Timer mode: incorporates an additional pomodoro timer in the interface in which user can customize work and break intervals 
2. Stretch goals:
   - Compatibility with Apple Watch
    - Notification, Logging
  - Networking features such as friends and exchanging systems
    - Connect Friends
    - Share results (achievements, activities, etc.)
  - Additional collectibles: accessories to customize collectible characters 
3. Out of scope: 
- Sensing biometrics using Apple Watch and using that data.
- Third party app synchronization such as calendar
- Support Windows version
- Complex algorithms to suggest ideal wellness routine
- Mobile version 

--

# 6. References (ACM Format)
[1] Apple. 2024. Health App & Privacy. Apple Inc. Retrieved February 4, 2025, from https://www.apple.com/legal/privacy/data/en/health-app/#:~:text=Apple%20will%20maintain%20the%20Health,data%20you%20share%20with%20them. 

[2] Dejal Systems, LLC. 2024. Time Out (Version 2.9.7) [Mobile app]. App Store. Retrieved from https://apps.apple.com/us/app/time-out-break-reminders/id402592703?mt=12. 

[3] Finch Care Public Benefit Corporation. 2021. Finch: Self-Care Pet (Version 3.72.63) [Mobile app]. App Store. Retrieved from https://apps.apple.com/us/app/finch-self-care-pet/id1528595748. 
