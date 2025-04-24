## Developments for Sprint 4

#### Working widget and basic interface setup

**Scope:** 8-10 hours
**Verification:** When previewing the widget extension, user can now see the sections of the widget and placeholders for affordances. The code is on GitHub and is approved through code reviews.

#### Working logic for stopwatch and pomodoro functions
**Scope:** 6-8 hours
**Verification:** When viewing the preview pages of each file, user can now interact with the buttons and stop, pause, or reset the timers. The code is on GitHub and is approved through code reviews.
**Further improvements:**
- The timers are yet to be integrated with the widget

#### Global theme setting mechanism through ThemeManager
**Scope:** 6-8 hours
**Verification:** When viewing the preview page of the shopPage user can see the color changes. The code is on GitHub and is approved through code reviews.
**Further improvements:**
- The theme setting mechanism is only experimented with the shopPage and is yet to be integrated with other pages in the main app, as well as the widget.
- More setting options can be added, such as font, font size, etc

##  External Documentation and Stakeholder Meetings

### Meeting 1
#### Who you met with
##### Name, occupation, and other relevant information about the stakeholder
- Hannah Kim, student biology major & statistics concentration. Not a long time mac user.
- Reviewed paper prototype
##### Date and time of the stakeholder meeting
- 04/22/2025 02:30pm - 3:00pm
##### Description of the test session and feedback
##### What was their behavior of interacting with the documentation?
1. Navigation to the app: When she opened the app, I told her to navigate to the manual/help page.
2. Navigation to the settings page: In the home screen, told her to navigate to the settings page
3. Changing themes in settings page: Prompted to change the themes
4. Purchasing Avatar in the collectible shop: Asked to navigate to collectible shop and try purchasing the avatar.
5. Read through the manual: Asked her to read all pages the manual till the end using the buttons
6. Adding to Widget: Asked her to add the elephant app to the widget bar just by manual explanation.
##### Did they succeed or get stuck?
- She succeeded in all 1-5, but since it was not clear what the widget bar is and there were no photos on how to add (and she is new to mac), so she could not success the task 6. 
##### What feedback did they provide about documentation?
- She said a picture or video of how to add widget to the widget bar would be helpful. The tester did not know what even widget bar is.
##### What questions did you ask, and what were the stakeholder's answers?
- I asked the if there is any buttons or other parts confusing
  - She said except for widget description everything was straightforward.
  - Additionally, she told us the time changing scroll in the settings page is not intuitivie. It does not show what time she is currently setting to if she scrolls.
- Is design suitable for readability and accesibility?
  - She said themes needed to be changed because only the background color changes and the font colors dont change. This makes letters hard to read
- Any other feedback
  - The homebutton crashes in the settings page.
  - The back button crashes in collectible shop for MacApp scheme.   


### Meeting 2



### Meeting 3

## Documentation Lab

**Note: Since we are small group (4 people only), we collaborated on code before. Therefore, our subgroups already shared knowledge on what we were working on and we used the same langauge. However, there was still room for imporvement in terms of documentation**


### Subgroup 1: Medhashree & Hyeyun

1. Teammate A: Medhashree, Teammate B: Hyeyun

ContentView, entire file

Teammate A (Medhashree) needs to adjust the header to include the main author(s) of the file, a description of the file, dependencies, and resources used when developing. Furthermore, the documentation in the code should include a small description of the scope of the code within "{...}

Teammate A made sure to include a description at the end of larger blocks of code within "{...}" that showed the responsibilities of the buttons. The inclusion of "TODO" comments were helpful as it is easy to find and has a note of what needs to be done.

Commit hash:
Github link:

2. Teammate A: Hyeyun, Teammate B: Medhashree

ManualView.swift, entire file

Teammat A (Mae) suggested: Adding description of the file, more documnation on the purpose of the function, documentation on what is happening (a line is sufficent) before each code block for each UI,
                          Add Todo for aesthetics part so that others can see what I have to work on/ and it is easily navigatble for others.
                          Spacing consistnet -- devleoper guideline on formaning (needed to be added).
                          You can put other referneces in each function on top and write where each used.

Helpful: Resources/References on the top & before each function (wehre we used it), comment after each "}" helpful to navigate the scope, but it would be more helpful to add what vstack belongs to (is it for button or not?) since
we have multiple vstacks.


Commit hash:
Github link:

### Subgroup 2: Candice & Gabby

1. Teammate A: Gabby, Teammate B: Candice

2. Reviewed SetingsView.swift file, 
- code snippet: ~lines 10-114~ within ~SettingsView~
- For sections where Gabby didn't give very descriptive or detailed documentation, she added more helpful comments that explained thoroughly how each part of the SettingsView was implemented. She included more description about where certain functions defined in the lower lines of the snippet (88-112) are coming from and how this compacting of functions at the end of SettingsView allowed for greater readability within the main SettingsView view.

Helpful: There were larger comments before long snippets of code that explained the functionality of the following lines, but for some lines where there wasn't enough description for a longer code line, we made changes to this by making sure those lines were descriptive enough.

Commit hash:
Github link:

3. Teammate A: Candice, Teammate B: Gabby

4. Review Utils.swift file, entire file

- Candice worked on re-usable functions and stucts, including Default Colors for theme changes as well as a default ElephantButton that can be used across various files. We discussed adding more documentation to the file for more descriptive explanations of each function and which files it mostly interacts with, like SettingsView.

Helpful: There are initial comment descriptions for each utility, describing what that utility performs as well as helpful function definitions describing what use that function/struct performs.

Commit hash:
Github link:

## Generative AI Experiment 
***Answer Following Questions***
1. In CSC 324, which uses of AI have the potential to advance product development and how?
2. In CSC 324, which uses of AI have the potential to support student learning and how?
3. In CSC 324, which uses of AI have the potential to undermine student learning and how?
4. What are some ethical considerations of using AI in CSC 324?

### Hyeyun
Hyeyun's Prompt: **I am doing a project for the Wellness app called Elephant. I am in charge of Manual Page. I am using swift. I have a template struct for each page. Can you create a documentation (like purpose, pre,post conditions) for this struct so that others can understand? Also, suggest internal documentations too:** I attached the code block of ***struct ManualTemplateView***.

AI gave me both top-level documentation (3p) and suggested inline comments. The top level documentation looks like:

/// `ManualTemplateView` is a reusable SwiftUI view component used to create consistent layout pages
/// in the Elephant wellness app's Manual section. It supports navigation between sequential manual pages,
/// and optionally provides a return to the home page.
///
/// - Purpose:
///   - To provide a consistent layout wrapper for individual manual pages with navigation and styling support.
///
/// - Pre-conditions:
///   - `content` must be a valid SwiftUI view.
///   - `currentPageIdentifier` must be a unique string identifier used for accessibility.
///
/// - Post-conditions:
///   - The rendered view will include:
///     - A home button (if `homePage` is provided)
///     - A scrollable content view area with the supplied `content`
///     - Optional navigation buttons to `backPage` and `nextPage`
///
/// - Parameters:
///   - `currentPageIdentifier`: A unique string used for accessibility and view identification.
///   - `content`: A closure that returns the SwiftUI View representing the main content of the page.
///   - `backPage`: An optional view to navigate to the previous page.
///   - `nextPage`: An optional view to navigate to the next page.
///   - `homePage`: An optional view to return to the home screen.


The inline suggesntions were: 
1. Adding Example usage:
/// ## Example Usage:
/// ```swift
/// ManualTemplateView(currentPageIdentifier: "welcomePage") {
///     Text("Welcome to the Elephant App!")
/// } backPage: {
///     AnyView(IntroPageView())
/// } nextPage: {
///     AnyView(SetupPageView())
/// } homePage: {
///     AnyView(HomeScreenView())
/// }
/// ```
2. Make consistent and aligned

#### Questions
1. In CSC 324, which uses of AI have the potential to advance product development and how?
   - The documentation generation would save some time if the intention of the app is clear.
   - Moreover, debugging the git issue could be also helpful for entry-level developers not used to github
   - If students have stress, they can use it for venting or suggest ways to how to talk about this issue with other peers.
2. In CSC 324, which uses of AI have the potential to support student learning and how?
   - Since there are so many resources out there, using AI that provides sources/references to the answers can support student learning by providing what sources they should look for.
   - Moreover, there can be languages that are unpopular, so if a student wants to learn, there may be limited resources. AI can help with the learning by helping students to learn unpopular langauge through LLM model.
3. In CSC 324, which uses of AI have the potential to undermine student learning and how?
   - The worrying part is that AI hallucinations. It is possible that student trust the unverified information and apply that to their understanding. This could harm the student's learning overall.
   - Moreover, generating the entire code is not helpful since the student won't learn anything.
4. What are some ethical considerations of using AI in CSC 324?
   - Since most of students are developing an app, user cases are important. It is possible that there can be bias in the model due to their training data. We should be careful with the answers we get and make sure our app is not biased.
   - In terms of fairness, it would be unfair for a groupmate to use AI for their entire work while others try hard and learn. That would undermine others' work.

### Mae


### Candice
1. In CSC 324, which uses of AI have the potential to advance product development and how?
   - Use of AI is particularly helpful for collaboration, such as summarizing updates or creating documentations. This can potentially avoid us overlooking certain details that we may have updated (or serve as a double check).
   - The existence of AI as a last resort alleviates stress when encountering deadlines or tough situations, making it feel more okay to spend more time experimenting and debugging.
   - Use of AI is helpful for debugging and can help us save time, particularly when the bug is rather minor and has little value for learning
2. In CSC 324, which uses of AI have the potential to support student learning and how?
   - Use of AI saves time looking up online sources, as keyword searches may not be as effective and may require prior knowledge. For example, without knowing the term "persistent storage", it might take me more time to find out that swift uses @AppStorage and UserDefaults to store variables across interfaces. AI bridges that gap by taking in longer descriptions that might be less accurate and respond based on plausible guesses.
   - Asking right questions can also yield helpful information, for example, asking AI to compare the similarities and differences between UserDefaults and @AppStorage can be helpful in learning when to use which.
   - Asking AI for hints or pseudocode can help students think and move forward with development without completely get stuck because they do not have the knowledge to know where to begin with.
3. In CSC 324, which uses of AI have the potential to undermine student learning and how?
   - Giving AI a description and asking AI to generate source code, as this hinders students' opportunities to think through the task and goals and write the code themselves.
   - Asking AI to generate documentation without considering formats may hinder collaboration, for example, a team may agree on a specific format and requirements, but an AI might not be aware and will not be able to meet that expectation.
4. What are some ethical considerations of using AI in CSC 324?
   - Overreliance on AI might hinder learning.
   - There is always the possibility that the code AI creates has undesirable side effects and potentially inefficient, especially if the user is not double checking the AI's output.
   - AI output is also potentially biased.
   - Some additional controversies of AI lies in how AI are trained on online materials that are not necessarily approved by original owners, raising problems of consent and copyright infringements.

### Gabby
   
