# Sprint Journal 2

## Part 4: Software Design

### Definitions:
- **iOS App Development Environment**: Developed with SwiftUI/Xcode utilizing graphics and WidgetKit.
  - **Packages Utilized**: 
    - `WidgetKit` and `SwiftUI` for the app's widget components.
    - `Testing` and `XCTest` for the testing suite.

### Component Responsibilities
- **WidgetKit**: package we utilize for the widget implementation of Elephant; enables data updates and interactivity for the widget displayed in the macOS laptop widget bar.
- **SwiftUI**: syntax that builds the app’s UI for both the app and widget component. Responsible for custom designs and rendering interfaces.
- **Testing**: Swift testing integrates with the Swift Package Manager testing workflow and supports:
  - Flexible test organization, allowing test functions to be defined almost anywhere with a single attribute.
  - Hierarchical grouping of related tests using Swift’s type system for clear organization.
  - Swift concurrency integration for robust and efficient asynchronous testing.
  - Parameterized test functions to cover a wide range of inputs efficiently.
  - Dynamic test enabling based on runtime conditions, enhancing flexibility.
  - In-process parallelization of tests for faster execution.
  - Test categorization using customizable tags for better traceability.
  - Direct association of bugs with the tests that verify their fixes or reproduce problems.

~ [Testing Documentation Source](https://developer.apple.com/documentation/testing/)

- **XCTest**: An abstract base class for creating, managing, and executing tests.

~ [XCTest Documentation Source](https://developer.apple.com/documentation/xctest)

### Interfaces Between Components
Data transfer within the program is structured to reduce coupling:
- **Interfaces**: The app uses `SwiftUI` as a bridge for interacting with both the app interface and `WidgetKit`. 
- **Data Flow**: Components exchange minimal data to ensure modularity, focusing on user preferences like widget appearance settings (coloring, text size, themes) and widget updates.
- **Efficiency**: Testing components (`Testing` and `XCTest`) interface exclusively with app logic and ensure consistent behavior without directly interacting with the UI components.

---

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

#### Epic 1: Core UI Development
- **Description**: Create the primary app interface and design themes.
- **Dependencies**: None.
- **Effort Estimate**: 6 person-weeks.
- **Subtasks**:
  - Implement UI navigation.
  - Develop app theme manager within settings
  - Unit testing for UI elements.

#### Epic 2: WidgetKit Integration
- **Description**: Build and integrate macOS widget extension.
- **Dependencies**: Core UI Development.
- **Effort Estimate**: 4 person-weeks.
- **Subtasks**:
  - Design the widget layout with collectible integration
  - Implement data syncing for widget updates and offline contingency planning
  - Test widget functionality on macOS.

#### Epic 3: Collectible Database
- **Description**: Set up a database to manage collectible art graphics.
- **Dependencies**: Core UI Development.
- **Effort Estimate**: 5 person-weeks.
- **Subtasks**:
  - Create database schema.
  - Populate initial collectible art based on biomes.
  - Integrate with app and widget appearance.

#### Epic 4: Accessibility Features
- **Description**: Add essential accessibility options like various light themes and customizable text size and font type.
- **Dependencies**: Core UI Development.
- **Effort Estimate**: 3 person-weeks.
- **Subtasks**:
  - Implement light/dark modes.
  - Introduce dynamic text resizing.
  - Test and refine features with feedback.

---

### 5.3 Product Roadmap

| **Epic**                 | **Start Date** | **Completion Date** |
|--------------------------|----------------|----------------------|
| Core UI Development      | 02-24-2025     | 03-19-2025          |
| WidgetKit Integration    | 03-13-2025     | 03-19-2025          |
| Collectible Database     | 03-13-2025     | 03-23-2025          |
| Accessibility Features   | 2025-04-18     | 05-02-2025          |

---

### 5.4 Documentation Plan

Planned Documentation Deliverables:
1. **User Manual**: To assist end-users in navigating the app and widgets. Appears to first time users upon download and can be accessed later in Setting
2. **Developer Guide**: Covers system architecture, setup, and contributions for developers.
3. **Help Menu/Settings**: Embedded help within the app, including FAQs and troubleshooting.
4. **Repo**: Centralized knowledge base for the project, hosted on the repository.

**Action Plan**:
1. **Task Assignment**
   - Assign a specific page or feature from the product backlog to each team member based on their expertise and current workload.
   - Divide documentation tasks (e.g., user guides, developer guides, admin guides) among team members to ensure coverage and accountability.

2. **Database Implementation**
   - Create a database for wellness tasks and ensure it is documented thoroughly in the developer guide. Include schema designs and data flow diagrams.
   - Develop a database for collectible images, detailing the organization and tagging system for seamless integration into the app.

3. **Feature Integration**
   - Document the process for connecting different pages and creating a cohesive navigation flow across the app.
   - Include instructions and implementation details for the settings page, such as color changes, text formatting options, and customizable checklists.

4. **Functionality Development**
   - Implement and document the working Pomodoro function with detailed explanations of its logic and usage.
   - Also, implement and document the working stopwatch function, focusing on its interaction with the UI and backend.

5. **Token System**
   - Develop and document the token system, explaining its purpose, technical implementation, and interaction within the app environment.
   - Highlight any future enhancements or scalability considerations in documentation.

6. **Milestone Establishment**
   - Break down each feature or page into milestones, ensuring a clear progression from initial design to final implementation.
   - Define documentation milestones to ensure that drafts are reviewed and iterated upon throughout the sprint.

7. **Iterative Reviews**
   - Perform iterative reviews with the team during sprint retrospectives to evaluate progress on features and documentation.
   - Gather feedback and update the documentation accordingly to reflect the most current implementation details.

8. **Final Documentation Integration**
   - Finalize user guides, developer guides, and help menus into a cohesive documentation package.
   - Ensure the product's functionality is well-documented for both end-users.

---
