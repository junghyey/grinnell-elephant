# Sprint 5 Journal

## Adoption Plan
#### Date: April 30, 2025
#### Is your product ready for adoption?

#### Current State of Product Development
Describe the current state of your product's development at the time of writing this journal entry.

So far, Elephant is in a prototype stage, with only the user interface (UI) components completed. Users can interact with the homepage functionalities, such as the manual, changing themes in settings. Moreover, users can add a widget to the widget bar. However, no functional pomodoro or stopwatch is working at this point. Moreover, users can experience adding a checklist, but there is no backend data structure to store it. The main app UI exists, but core features like timer settings, purchasing avatars are not available. No backend or data storage beyond this UI mockup is currently available.


#### Risk/Benefit Analysis
Give a comprehensive risk/benefit analysis of your product by stating at least 5 risks or benefits of using your product

##### Benefits
For the current version, the benefits are:
1. The app has a visually appealing and intuitive interface, which helps users navigate the app easily.
2. For the widget, users can see what the widget will look like and where it will show on their laptop
3. We can get feedback from stakeholders through the current UI-focused prototype and fix it before the backend. (Our backend is straightforward since we store data locally)
4. For the current state, by using this product, we can finalize the UI structure early to reduce the possible waste of time that does not go well with the front-end
5. Having a working UI in the current state allows developers to get direct experience of what users are facing.

If the app is fully developed, then:
1. (If the app is fully developed) Users can achieve wellness and work balance.
2. Users can motivate themselves by checking off the task and earning tokens
3. Features like customizable themes, timers, and avatars make the app fun and personal, increasing engagement.
4. Widget-based interactions will allow a distraction-free experience.
5. Shared team boards can support social motivation and group productivity.


##### Risk
(If fully developed)
1. Users can become too  reliant on the app.
2. There can be abuse of tokens.
3. There can be possible privacy & data concerns since this is integrated into Apple (since it's an Apple app).
4. There can be stress & guilt for users if they cannot do tasks, --> could dismotivate users.
5. The notifications can be distracting and disrupt focus.

##### Is it right to encourage people to adopt your product in its current state? Or will you continue developing instead? Explain your decision.
No, it is not right to encourage people to adopt our prduct in its current state because we do not have working functionalities. For example, we do not have stopwatch, pomodoro, widget integrations except for basic UIs. So, it is not appropriate. Therefore, we will continue developing instead to have working pomodoro and stopwatch function with widget.

#### Adoption plan (if ready for adoption)

We have received support from Reslife, so our initial product will be targeted towards incoming freshman students who will be juggling both college academics and social scenes. For example, we will have a default wellness checklist that includes fun wellness tasks students can do to take a break while exploring Grinnell, such as getting ice cream at Dari Barn, getting snacks from DSA, or chilling on the hammocks and watching the sunset. We have also received funding from the Catalyst, so once the product is completed and tested, we will host it on Firebase and release it on the App Store, allowing students to download it for free. For promotion, we will introduce it to incoming students during New Student Orientation, and we also plan to table in the coming semester to promote it to other students. It is also possible that we work with Reslife to further incentivize students to use the product, such as gift card draws or offering free Dari Barn coupons.

We hope that the app will serve as a reminder to students that academics and socialization are equally important. Even when work gets overwhelming, taking time off for oneself and sharing some time with friends is not a waste of time, but necessary to ensure wellness and productivity. Not only does the app serve as a productivity management tool, but it also reminds students of all the fun things they can do at Grinnell. While most promotions will focus on freshman students, we believe that all students can benefit from using the app while they are working. We hope that students will have the widget on their sidebar when working on assignments, and depending on their working style, use either the pomodoro timer or the stopwatch to record how much time has passed, and set up notifications to remind them to take breaks.

In the long term, if we receive good feedback from the campus community, we plan on promoting it to users outside of Grinnell. There are two potential ways to achieve this. Firstly, we can promote to residential life departments in other institutions, particularly other liberal arts colleges known for rigorous academics. Another option is to promote it to general users who work long hours in front of their computers, including students, researchers, office workers, etc. To promote it to these users, we can share it with our family and friends, or pay influencers to try it out and recommend it to others. The app will be accessible as we will release it on the App Store, and it will be free for everyone.

#### Continued development plan (if not ready for adoption)

Given our current state of development, we have been working to produce an MVP to demonstrate in class, but unfortunately is not yet ready to publish to the app store. For several reasons, we have decided that the time left for development is enough for beta testers to operate the Elephant's functions. As for the collectible database for our widget avatars, we still need data (drawings of characters commissioned by local artists) since we have only been recently approved for funding and are working more towards the functionality of the app and the widget's general features before initial release. Another reason that we're limited from releasing an MVP to the app store is given plans for initial deployment with the Wilson Catalyst Center and ResLife as previously mentioned have been chronologically set as ongoing projects in collaboration with Grinnell students specific needs and task list items that we also plan to incorporate in a suggested checklist that is currently undergoing implementation as well. This future work, while progressively scalable given all of our contributions, takes diligent work that we would need more time to realize with our team's partnership with the school, as well as reaching across various demographics in our beta testers before initial release. 

Many of our reach goals across various sprints in our final development include: dynamic text resizing and font changes within settings, incorporating sets of widget avatars in our database (consistent manual updating), and learning how to store various users' sensitive data (such as their custom checklists) for retrieval upon user request (deleted task lists), for instance, and eventually transition the entire app over to Kotlin for Android users. The eventually reachable goals, at least for the macOS laptop version, include the dynamic text changes as well as incorporating more customizable themes (eventually allowing for users to set their color palettes based on input) would be a stretch goal but at this time we're prioritizing the basic functionality of the app and widget so we have yet to implement these accessibility and customizable changes to the app's aesthetic layout. Another is storing checklist data and widget avatar sets not only on a local server, but also learning how to store these for individual users hosted by Firebase and using PostgreSQL for our storage. If we had more time, our team could've integrated more of these features into the MVP, but we were hindered by access to necessary funding for artist commissions as well as payment for these storage databases that require subscriptions for use. Our largest reach goal is eventually programming Elephant: A Wellness Trunk again in Kotlin so that it would be open for Windows and Android users, reimagining the widget integration portion of the app for these devices to be contained all within Elephant itself. This reach goal is our most 'out-of-scope' from the current project since we'd have to learn the language and reconfigure all of the changes to be available for Android users, and with the same financial constraints.

#### Carry Out Plan
Following the plan we outlined earlier this sprint, we focused on working on fuctional and core features. We worked on checklist feature. It is successfully working, but the widget integration is not working due to apple limitation of the widget (refresh time fixed). We have working timer for both pomodoro and stop watch. Notification system is also working. While we did not reach the full deployment state, we made signficant progress toward an MVP for class demonstration. We also talked with ResLife with potential collaboration. For the stock images, we used temporary free images and we have plan for commissioning artwork funded by Catalyst program. We found out the limitation of the widget that the refreshing number is set per day. Therefore, we decided to move stopwatch and pomodoro funtionalities (time sensitive ones) to the home page. We made the UI's more consistent across the app.

## Bug Logging
Links to Bug Reports
  1. Hyeun - EnvironmentObject view error - https://trello.com/c/dKSCkfOa
  3. Gabby - Checklist adding new task bug - https://trello.com/c/wxcFwKiB
  4. Medhashree - Mode Selection - https://trello.com/c/D6T4kXTW
  5. Candice - Array persistent storage - https://trello.com/c/1z73OmtY
     
## License
Software license for the product, and include the license. We chose MIT license.

## Wrap-up work
Team Elephant worked hard to make this repository presentable to future audiences. 


## Final Presentation
Demo Reproduction Steps: git clone the final release and (on the mac) open in the xcode. Then follow the guideline in readme "Pulling From Main" part. Then, build the project using "How to Build" section part.
