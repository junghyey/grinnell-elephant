# Sprint Journal 2

## Part 2: Software Architecture

**Use of External Storage**
- We decided to have an external storage to reduce the size of the client end, which will be used to (1) track records that are only important to developers, such as purchase records, and (2) store images that clients can download by connecting to the internet.
   - Alternatively, we can store everything locally, which will minimize the need for external storage. However, as developers, we might still need to track user data in some way, such as purchase records, which means external storage may still be needed.

**Use of Two Different Interfaces**
- We decided to have two interfaces, the app and the widget interface, as we believe it is redundant and unnecessary to have the widget hold all functionalities. Having an app component separated from the widget component also allows us to separate the main function (widget tool) from other functions (adjust settings, view achievements and purchases, etc).

## Part 5: Project Risks and Management

### 5.1 Risk Assessment

1. **Scope of Completion**: Our main project risks involve the scope of the project being completed in the limited time we have available, given that we want to publish a fully functioning app/widgetkit to the app store by the end of the course.
   - **Likelihood**: High
   - **Impact**: High
   - **Evidence**: Limited time for project completion and testing phase.
   - **Mitigation Plan**: Define and prioritize MVP (Minimum Viable Product) features, strictly adhering to deadlines. Monitor progress in daily stand-ups.
   - **Detection**: Weekly review of progress against the roadmap.

2. **Collectible Database Implementation**: There's also the limitation that we may experience with programming to complete the collectible database as we are still in the collecting phase and may have to limit our initial grouping by biome implementation for a more obtainable database of collectible art that will be accredited to our artists and graphic partners.
   - **Likelihood**: Medium
   - **Impact**: Medium
   - **Evidence**: Still in the collection phase, may require scaling down from the intended scope.
   - **Mitigation Plan**: Begin with a simplified implementation based on a single biome, expanding as time allows. Collaborate closely with artists to streamline inputs.
   - **Detection**: Regular assessments of data availability and scope adjustments during sprints.

3. **Accessibility Features**: Another risk we may run into is implementing all accessibility features as the widget is already limited by being solely available on macOS devices, we commit to our various goals of having different light/appearance modes as well as different text, but a reach goal for us in this implementation, for example, was the speech to text feature that we received feedback would be more helpful in collaboration with Siri's voice to text feature, however, this may not get to our final implementation given the scope of our project.
   - **Likelihood**: Medium
   - **Impact**: High
   - **Evidence**: Limited to macOS-only platform; scope includes challenging features like Siri speech-to-text.
   - **Mitigation Plan**: Commit to critical accessibility features first (text modes, appearance modes). Revisit voice features post-launch as enhancements.
   - **Detection**: Feedback from targeted user testing and peer/stakeholder reviews.

---

### 5.2 Epics and Subtasks

#### Epic 1: Initial Structure
- **Description**: Establish core UI structure & themes so that we have smooth navigation and a better user experience.
- **Dependencies**: None.
- **Effort Estimate**: 3 weeks
- **Subtasks**:
  - Implement main navigation for home, settings, and checklist views.
  - Develop app theme, text, and customizable lists manager within settings
  - Develop a user manual within the settings
  - Conduct unit testing for UI elements.

#### Epic 2: WidgetKit Integration
- **Description**: Build and integrate macOS widget extension.
- **Dependencies**: Epic 1 & Epic 5
- **Effort Estimate**: 4 weeks 
- **Subtasks**:
  - Design the widget layout with collectible integration
  - Implement real-time checklist updates using Firebase/PostgreSQL (Firebase not be used since we will try to store data locally).
  - Develop when the app is offline
  - Test widget functionality on macOS.

#### Epic 3: Collectible Database
- **Description**: Set up a database to manage collectible art graphics.
- **Dependencies**: Epic1 & Epic5
- **Effort Estimate**: 5 weeks, including the timeline of the initial UI development
- **Subtasks**:
  - Create database schema on SQL (probably store this in the Firebase, since it is being)
  - Populate initial collectible art, and biome categorizing will progress throughout the collection
  - Integrate with app and widget appearance.
  - Ensure collectibles sync correctly with the widget and the main app.
  - Develop backend  for displaying collectibles in the app.

#### Epic 4: Accessibility Features
- **Description**: Add accessibility options like various light themes and customizable text size and font type.
- **Dependencies**: Epic 1
- **Effort Estimate**: 3 weeks, including the timeline of the initial UI development
- **Subtasks**:
  - Implement light/dark modes.
  - Introduce dynamic text resizing.
  - Test and refine features with feedback.
    
#### Epic 5: Storing User Data
- **Description**: Set up a database to collect and store user data and a pipeline for storing data
- **Dependencies**:  Epic 1 
- **Effort Estimate**: 2 weeks to create a secure database with updates throughout app development.
- **Subtasks**:
  - Learn PostgreSQL 
  - Create a database & pipeline using PostgreSQL.
  - Integrate Firebase or Supabase for real-time updates or server-side.
  - Encryption for sensitive information such as medication.
  - Perform security testing and check compliance with data protection policies.

#### Epic 6: Token System
- **Description**: Implement the token collection system to incentivize
- **Dependencies**:  Epic 3 
- **Effort Estimate**: 3 weeks
- **Subtasks**:
   - Define logic for earning & spending tokens (example: daily limit)
   - Implement UI for displaying token count

---

### 5.3 Product Roadmap

| **Epic**                 | **Start Date** | **Completion Date** |
|--------------------------|----------------|----------------------|
| Core UI Development      | 02-16-2025     | 03-21-2025          |
| WidgetKit Integration    | 03-13-2025     | 03-21-2025          |
| Collectible Database     | 03-13-2025     | 03-23-2025          |
| Accessibility Features   | 03-13-2025     | 05-02-2025          |

---

### 5.4 Documentation Plan

Planned Documentation Deliverables:
1. **User Manual**: To assist end-users in navigating the app and widgets. Appears to first-time users upon download and can be accessed later in Settings
2. **Developer Guide**: Covers system architecture, setup, and contributions for developers.
3. **Help Menu/Settings**: Embedded help within the app, including user guide examples, FAQs, and troubleshooting.
4. **Repo**: Centralized knowledge base for the project, hosted on the repository.

**Action Plan**:
1. **Task Assignment**
   - Assign each team member a specific page or feature from the product backlog based on their expertise and current workload.
   - Divide documentation tasks (sprint journal, user guides, developer guides) among team members to ensure coverage and accountability.

2. **Database Implementation**
   - Create a database for wellness tasks and ensure it is documented thoroughly in the repo. Include designs and data flow diagrams.
   - Develop a database for collectible images, detailing the organization and tagging system for seamless integration into the app.

3. **Feature Integration**
   - Document the process for connecting different pages and creating a cohesive navigation flow across the app.
   - Include instructions and implementation details for the settings page, such as color changes, text formatting options, and customizable checklists.

4. **Functionality Development**
   - Implement and document the working Pomodoro function with detailed explanations of its logic and usage.
   - Also, implement and document the working stopwatch function, focusing on its interaction with the UI and backend.

5. **Token System**
   - Develop and document the token system, explaining its purpose, technical implementation, and interaction within the app environment.
   - Highlight any future enhancements or scalability considerations in the documentation.

6. **Milestone Establishment**
   - Break down each feature or page into milestones, ensuring a clear progression from initial design to final implementation.
   - Define documentation milestones to make sure our drafts are reviewed and worked on throughout the sprint.

7. **Iterative Reviews**
   - Do iterative reviews with the team during sprint retrospectives to evaluate progress on features and documentation.
   - Gather feedback and update the documentation accordingly to reflect the most current implementation details.

8. **Final Documentation Integration**
   - Finalize user manual, developer documentation in repo, and settings layout into a cohesive documentation package.
   - Ensure the product's functionality is well-documented for both end-users.

---

### Part 6: Test Plan

#### Test Library
For this app, we'll be utilizing XCTest

#### Justification
Our program is developed using Swift on XCode thus we would need a compatible test library. In our case, XCTest will efficiently complete tests due to its direct integration with Xcode.  

#### Continuous Integration (CI) Service
Our team will utilize GitHub Actions as the CI service that is linked to our project repository

#### Justification
GitHub Actions is a developer-friendly and efficient service that would allow seamless merge of team updates. To learn more about the developer's relationship with testing and CI, please navigate to the Developer Guidelines located in README.md.

---

### Part 7: CI

Successful results (can be viewed in Actions). The following are (some) screenshots showing our test worked.

<img src="https://github.com/user-attachments/assets/422e11a7-114e-4568-b37e-622f07527919"  height= "300" />

Recent Test worked:

<img src="https://github.com/user-attachments/assets/3e815de0-785a-4f2a-8bf0-d6bee00d2648"  height="300" />

---

