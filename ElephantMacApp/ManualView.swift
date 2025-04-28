/*
 `ManualView.swift`
  
  File Description: This file defines the manual and onboarding views for the Elephant app.
  It introduces users to the core functionalities (Stopwatch Mode, Pomodoro Mode, Token System, and Widget Setup) through an interactive multi-page guide.
 
 ## Components:
 - `ManualTemplateView`: A reusable SwiftUI template providing navigation, layout, and dynamic styling for each page in manual pages.
 - `ManualView`, `SecondPageView`, `ThirdPageView`, `FourthPageView`: Specific manual pages for each feature
 - `ChecklistItem`, `CheckBoxView`, `ChecklistView`: Supporting views for displaying example checklists and user stories.
 ## Features:
 - Scrollable, styled content sections with clear headings.
 - The first page contains all the link to other pages for navigation.
 - Navigation controls (Back, Next, Home buttons) for linear walkthrough.
 - Accessibility identifiers for UI testing and improved accessibility.
 
 ## References:
 https://developer.apple.com/documentation/swiftui/font
 https://stackoverflow.com/questions/24002092/what-is-the-difference-between-let-and-var-in-swift
 https://developer.apple.com/documentation/swiftui/anyview
 https://medium.com/@jaberi.mohamedhabib/understanding-some-view-and-anyview-in-swiftui-erased-and-opaque-return-types-2c7a69903335
 https://www.swiftbysundell.com/tips/creating-custom-swiftui-container-views/
 https://sarunw.com/posts/custom-back-button-action-in-swiftui/
 https://developer.apple.com/documentation/swiftui/navigationstack
 https://developer.apple.com/documentation/swiftui/navigationlink
 https://www.swiftyplace.com/blog/better-navigation-in-swiftui-with-navigation-stack
 https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/
 https://stackoverflow.com/questions/55213078/what-is-the-difference-between-swift-structs-and-objective-c-structs
 https://makeapppie.com/2019/10/23/checklists-in-swift-ui/
 https://developer.apple.com/documentation/swiftui/state
 https://www.hackingwithswift.com/quick-start
 https://developer.apple.com/documentation/swiftui/plainbuttonstyle
 https://www.avanderlee.com/xcode/xcode-mark-line-comment/
 */
import SwiftUI


// MARK: - Manual Template
// ====================================================
// Manual Template
// ----------------------------------------------------
// Template for each manual page
// ====================================================

/*
 `ManualTemplateView` is a reusable SwiftUI component for layout for pages for each manual page

 ## Purpose:
 - Provide a consistent and reusable layout wrapper for manual/help pages.
 - It prevents from manually configuring each page.

 ## Behavior:
 - It contains scrollable area where content goes
 - It has options to add next,back button and home button is automatically added 

 ## Parameters:
 - `currentPageIdentifier`: A unique string identifier for each page
 - `content`: Content to display 
 - `backPage`: Navigate back button to go back to page (optional)
 - `nextPage`: Navigate forward button to go front (optional)
 - `homePage`: Navigate home button to go to main page of the app.

 ## Preconditions:
 - `content` must be a valid SwiftUI `View`.
 - `currentPageIdentifier` must be unique for each page
 - There needs to be an identifier for main page. 

 ## Postconditions:
 - The rendered manual includes
    - Scrollable manual content.
    - Navigation buttons (if applicable).
 */
struct ManualTemplateView<Content: View>:  View {
    @AppStorage("mode") private var Mode: Bool = false
    @Environment(\.dismiss) private var dismiss
   
    //--------------------------
    // Variable Initializiation
    //--------------------------
    var currentPageIdentifier: String
    var content: Content
    var backPage: AnyView?
    var nextPage: AnyView?
    var homePage: AnyView?
    
 
    init(
        currentPageIdentifier: String,
        content: () -> Content,
        backPage: AnyView? = nil,
        nextPage: AnyView? = nil,
        homePage: AnyView? = nil
    )
    {
        self.currentPageIdentifier = currentPageIdentifier
        self.content = content()
        self.backPage = backPage
        self.nextPage = nextPage
        self.homePage = homePage
    }//init
    
    var body: some View {
            
        //--------------------
        // Main Layout Start
        //--------------------
            VStack(spacing: 0) {
                HStack {// Header stack with home button
                    Spacer()//expands leftward
                    if let homePage = homePage {
                        NavigationLink(destination: homePage) {
                            Image(systemName: "house.fill")
                                .font(.title2)
                                .foregroundColor(DefaultColors.main_color_3)
                                .accessibilityIdentifier("homeButton")
                                .allowsHitTesting(true)
                                //nopadding
                        }//NavigationLink
                        .buttonStyle(PlainButtonStyle()) // get rid of the white box behind
                    }//homepage
                }//HStack
                
                .padding()
            
                .background(DefaultColors.main_color_1)
                
                //-------------------
                // Content Area Start
                //-------------------
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {// Content stack inside scroll
                        content
                        Spacer(minLength: 80) // space above the nav buttons
                    }//VStack
                    .padding()
                    .background(
                        Color.clear
                            .accessibilityElement(children: .combine)
                            .accessibilityIdentifier(currentPageIdentifier)
                            .shadow(color: DefaultColors.shadow_1.opacity(0.2), radius: 8, x: 0, y: 4)
                    )
                    .id(currentPageIdentifier)
                }//ScrollView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(DefaultColors.background)
                //---------------------------------------------------------------
                //--------------------
                // Button Stack Starts
                //--------------------
                // Footer stack with navigation buttons
                HStack {
                    if let backPage = backPage {
                        NavigationLink(destination: backPage) {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.title)
                                .foregroundColor(DefaultColors.main_color_2)
                                .accessibilityIdentifier("backButton")
                                .allowsHitTesting(true)
                        }//NavigationLink
                        .buttonStyle(PlainButtonStyle()) // get rid of the white box behind
                    }// if backPage
                    
                    Spacer()//expands leftward
                    
                    if let nextPage = nextPage {
                        NavigationLink(destination: nextPage) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.title)
                                .foregroundColor(DefaultColors.main_color_2)
                                .accessibilityIdentifier("nextButton")
                                .allowsHitTesting(true)
                        }//NavigationLink
                        .buttonStyle(PlainButtonStyle()) // get rid of the white box behind
                    }//nextPage
                }//HStack
                .padding(.horizontal)
                .padding(.bottom, 20)
                .background(DefaultColors.background)
              
                //---------------------------------------------------------------
            }//vstack
     
        
            .preferredColorScheme(Mode ? .dark : .light)
            .frame(width: 500, height: 500)
            .background(Mode ? Color.black : Color.white)
        }// var body
  
}//ManualTemplateView


// MARK: - Main OverView Page
// ====================================================
// OverView
// ----------------------------------------------------
// First page of the manual.
// Shows a brief overview and links to sections.
// ====================================================

struct ManualView:View{
    var body: some View {
            ManualTemplateView(
                currentPageIdentifier: "manualFirstPage",
                content: {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Welcome to Elephant!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(
                       "Are you ready to incorporate wellness tasks into your work routine with us? Let’s get started!"
                                                )
                        Text("Balance you work and wellness routine through Elephant")
                        NavigationLink(destination: StopwatchPageView()) {
                            
                                               Text("Stopwatch Mode")
                                                   .font(.title2)
                                                   .fontWeight(.semibold)
                                                   .frame(maxWidth: .infinity, alignment: .leading)
                                                   .padding()
                                                   .background(DefaultColors.main_color_1)
                                                   .cornerRadius(10)
                                                   
                                           }// NavigationLink stopwatch
                        .buttonStyle(PlainButtonStyle())

                                           NavigationLink(destination: PomodoroPageView()) {
                                               Text("Pomodoro Mode")
                                                   .font(.title2)
                                                   .fontWeight(.semibold)
                                                   .frame(maxWidth: .infinity, alignment: .leading)
                                                   .padding()
                                                   .background(DefaultColors.main_color_1)
                                                   .cornerRadius(10)
                                                 
                                           }//NavigationLink pomodoro
                                           .buttonStyle(PlainButtonStyle())

                                           NavigationLink(destination: TokensPageView()) {
                                               Text("Earn Tokens")
                                                   .font(.title2)
                                                   .fontWeight(.semibold)
                                                   .frame(maxWidth: .infinity, alignment: .leading)
                                                   .padding()
                                                   .background(DefaultColors.main_color_1)
                                                   .cornerRadius(10)
                                                   
                                           }//NavigationLink tokenspageview
                                           .buttonStyle(PlainButtonStyle())

                                           NavigationLink(destination: ExamplesPageView()) {
                                               Text("Example User Cases")
                                                   .font(.title2)
                                                   .fontWeight(.semibold)
                                                   .frame(maxWidth: .infinity, alignment: .leading)
                                                   .padding()
                                                   .background(DefaultColors.main_color_1)
                                                   .cornerRadius(10)
                                                   
                                           }//NavigationLink examplespage
                                           .buttonStyle(PlainButtonStyle())

                                           NavigationLink(destination: WidgetSetupPageView()) {
                                               Text("Set Up Widget")
                                                   .font(.title2)
                                                   .fontWeight(.semibold)
                                                   .frame(maxWidth: .infinity, alignment: .leading)
                                                   .padding()
                                                   .background(DefaultColors.main_color_1)
                                                   .cornerRadius(10)
                                                   
                                           }//NavigationLink widgetsetup
                                           .buttonStyle(PlainButtonStyle())
                                       }//vstack
//                    // First Page Content Stack
//                    VStack(alignment: .leading, spacing: 20) {
//                       Text("Welcome to Elephant...")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .lineSpacing(4)
//                        
//                        Text(
//                            "Are you ready to incorporate wellness tasks into your work routine with us? Let’s get started!"
//                        )
//                        .font(.title3)
//                        .fontWeight(.medium)
//                        .lineSpacing(6)
//                        
//                        // Stopwatch section
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Stopwatch Mode")
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                            Text(
//                                "* Receive wellness reminders at customized time intervals.\n * Turn on when you start working and off when you’re done."
//                            )
//                            .font(.body)
//                            .lineSpacing(4)
//                        }//Vstack
//                        
//                        // Pomodoro section
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Pomodoro Mode")
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                            Text(
//                                "* Integrate Pomodoro method with wellness tasks \n * Customize the time intervals"
//                            )
//                            .font(.body)
//                            .lineSpacing(4)
//                        }//Vstack
//                        
//                        // Token earning section
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Earn Tokens")
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                            Text(
//                                "* Earn tokens by completing tasks on checklist that you can exchange for collectibles to customize your widget!"
//                            )
//                            .font(.body)
//                            .lineSpacing(4)
//                        }//Vstack
//                    }//Vstack
                }//content
                ,
                //nextPage: AnyView(SecondPageView()),
                homePage: AnyView(ContentView())
                
            )//ManualTemplateView
            .frame(maxWidth: .infinity, alignment: .leading)
    }//body
}//ManualView

// MARK: - StopwatchPageView
// ====================================================
// Stopwatch Mode
// ----------------------------------------------------
// Page for explaining stopwatch
// ====================================================
// Stopwatch Page
struct StopwatchPageView: View {
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "stopwatchPage",
            content: {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Stopwatch Mode")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Turn on the stopwatch when you start working. Receive wellness reminders at custom intervals, and turn it off when you're done.")
                        .font(.body)
                    
                    //probably insert something for settings on how to use
                }// vstack
                .padding()
            },
            backPage: AnyView(ManualView()), // back to home
            homePage: AnyView(ContentView())
        )//ManualTemplateView
    }//var body
}//StopwatchPageView

// MARK: - PomodoroPageView
// ====================================================
// Pomodoro Mode
// ----------------------------------------------------
// Page for explaining pomodoro
// ====================================================
// Stopwatch Page

struct PomodoroPageView: View {
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "pomodoroPage",
            content: {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Pomodoro Mode")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Work in focused intervals with short breaks in between. After four work sessions, enjoy a longer break to recharge!")
                        .font(.body)
                    //probably insert something for settings on how to use
                }//Vstack
            },
            backPage: AnyView(ManualView()),
            homePage: AnyView(ContentView())
        )//ManualTemplateview
    }//var body
}//pomodoropage

// MARK: - TokensPageView
// ====================================================
// Tokens Page
// ----------------------------------------------------
// Page for explaining token
// ====================================================
struct TokensPageView: View {
    // TODO: add example when the widget is completed
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "tokensPage",
            content: {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Earn Tokens")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Complete wellness tasks to earn tokens. Redeem tokens to collect fun avatars and customize your experience!")
                        .font(.body)
                    Text("Every time you complete the task, you earn one token. The tokens can be used to purchase avatar in the collectible shop.")
                        .font(.body)
                    
                    Text("Daily limit: 5 ")
                        .font(.body)
                }//vstack
            },
            backPage: AnyView(ManualView()),
            homePage: AnyView(ContentView())
        )//ManualTemplateView
    }// body
}// TokensPageView


//// SecondPage
//struct SecondPageView:View{
//    var body: some View {
//        ManualTemplateView(
//            currentPageIdentifier: "manualSecondPage",
//            content: {
//                // Second Page Content Stack
//                VStack(alignment: .leading, spacing: 24) {
//                    Text("How To ")
//                        .font(.title)
//                        .fontWeight(.bold)
//                    
//                    // Stopwatch Section
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("StopWatch")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                        Text(
//                      """
//                      Start the stopwatch to begin & be notified at custom intervals.
//                      """
//                        )
//                        .font(.body)
//                        .lineSpacing(4)
//                        
//                    }//Vstack
//                    
//                    // Pomodro Section
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("Pomdoro")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                        Text(
//                      """
//                      You get 4 instances of work time with a short break following the first 3 instances and a long break break after the 4th round
//                      """
//                        )
//                        .font(.body)
//                        .lineSpacing(4)
//                        
//                    }//Vstack
//                    
//                    // Tokens & Collectibles Section
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("Tokens & Collectibles")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                        Text(
//                      """
//                      After each wellness task or checklist item is completed, you will earn a token.\n Once you have tokens, you can start collecting acatars for the collectible reward!\n (but be warned... you need to have enough tokens to get a collectible).
//                      """
//                        )
//                        .font(.body)
//                        .lineSpacing(5)
//                        
//                    }//Vstack
//                }//Vstack
//                .frame(maxWidth: .infinity, alignment: .leading)
//              
//            }//content
//            ,
//            backPage: AnyView(ManualView()),
//            nextPage: AnyView(ThirdPageView()),
//            homePage: AnyView(ContentView())
//            
//        )//ManualTemplateView
//    }//body
//}//firstPageView



/*
Each item inside the checklist
 */
struct ChecklistItem: Identifiable {
    let id = UUID()
    let label: String
    var isChecked: Bool //applying feedback about allowing the check demo
}//ChecklistItem

/*
 CbeckBoxView Template View
 
 References:
 https://www.hackingwithswift.com/quick-start/swiftui/building-a-menu-using-list
 */
struct CheckBoxView: View {
    @Binding var isChecked: Bool  // <-- binding to allow toggling

    // Action after the check mark
    var body: some View {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundColor(isChecked ? DefaultColors.main_color_3 : Color.secondary)
                .onTapGesture {
                    isChecked.toggle() // if checked toggle
                }//.onTapGesture
        }// var body
}//CheckBoxView
/*
 ChecklistView struct template
 
 References:
 https://developer.apple.com/documentation/swiftui/foreach
 */

struct ChecklistView: View {
    @State var items: [ChecklistItem]   // <-- @State to allow updates
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach($items) { $item in
                HStack {
                    Text(item.label)
                    CheckBoxView(isChecked: $item.isChecked)
                }//Hstack
            }//ForEach
        }//Vstack
    }//var body
}//ChecklistView

// MARK: - ExamplesPageView
// ====================================================
// ExamplesPageView
// ----------------------------------------------------
// Page for showing sample suercases
// ====================================================

struct ExamplesPageView: View {
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "examplesPage",
            content: {
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Customize Elephant to Your Needs!")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    //example sam's story
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sam's Story")
                            .font(.headline)
                            .fontWeight(.semibold)

                        Text("Sam is a software engineer that sits in front of his computer for long hours. Sam gets so immersed that they forget to eat or rest.")
                            .font(.body)

                        Text("Here is how Sam uses Elephant as Wellness Reminders")
                            .font(.headline)

                        Text("Mode: Stopwatch")
                            .italic()

                        ChecklistView(items: [
                            ChecklistItem(label: "Take a 10min walk", isChecked: true),
                            ChecklistItem(label: "Grab a coffee", isChecked: false),
                            ChecklistItem(label: "Eat an apple", isChecked: true)
                        ])//checklistview
                    }//vstack sam
                    
                    //Cam Story Vstack

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Cam's Story")
                            .font(.headline)
                            .fontWeight(.semibold)

                        Text("Cam is a college student that finds it hard to stay on top of class and extracurriculars. Cam wants some motivation to get the tasks done.")
                            .font(.body)

                        Text("Here is how Cam uses Elephant for Task Management")
                            .font(.headline)

                        Text("Mode: Pomodoro")
                            .italic()

                        ChecklistView(items: [
                            ChecklistItem(label: "2 Paragraphs for Political Science Paper", isChecked: true),
                            ChecklistItem(label: "Meet Advisor", isChecked: true),
                            ChecklistItem(label: "Email Follow-Ups", isChecked: false)
                        ])// checklistview
                    }//vstack cam
                }//vstack
            },//conetent
            backPage: AnyView(ManualView()),
            homePage: AnyView(ContentView())
        )//ManualTemplateView
    }//body
}//ExamplesPageView

// MARK: - ExamplesPageView
// ====================================================
// WidgetSetupPageView
// ----------------------------------------------------
// Page for showing the instruction of how to set
// up widget
// ====================================================
struct WidgetSetupPageView: View {
    // TODO: add vidoe link?
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "widgetSetupPage",
            content: {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Add Elephant to Widget Bar")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("""
                    (1) Open Notification Center by clicking the date/time in the menu bar of the mac book (Desktop) or swiping left from the right side of the trackpad.
                    (2) Scroll to 'Edit Widgets'.
                    (3) Search for 'ElephantMacApp'.
                    (4) Add and enjoy quick access to your wellness reminders!
                    """)
                        .font(.body)
                        .lineSpacing(5)
                }
            },
            backPage: AnyView(ManualView()),
            homePage: AnyView(ContentView())
        )
    }
}


//
//// ThirdPage
//struct ThirdPageView:View{
//    var body: some View {
//        ManualTemplateView(
//            currentPageIdentifier: "manualThirdPage",
//            content: {
//                // Third Page Content Stack
//                VStack(alignment: .leading, spacing: 24) {
//                    Text("Customize Elephant to your need!")
//                        .font(.title)
//                        .fontWeight(.bold)
//                    
//                    // Stopwatch Section Example Sam
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text(
//                      """
//                      Sam is a software engineer that sits in front of his computer for long hours. Sam gets so immersed that they forget to eat or rest.
//                      """
//                        )
//                        .font(.body)
//                        .lineSpacing(4)
//                        Text("Here is how Sam uses Elephant as Wellness Reminders")
//                            .font(.headline)
//                            .fontWeight(.semibold)
//                        Text("Mode: Stopwatch")
//                            .italic()
//                        ChecklistView(items: [
//                            ChecklistItem(label: "Take a 10min walk", isChecked: true),
//                            ChecklistItem(label: "Grab a coffee", isChecked: false),
//                            ChecklistItem(label: "Eat an apple", isChecked: true)
//                        ])
//                        
//                        
//                        
//                    }//Vstack
//                    
//                    // Example Cam Pomodro Section
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text(
//                        """
//                        Cam is a college student that finds it hard to stay on top of class and extracurriculars. Cam wants some motivation to get the tasks done.
//                        """
//                        )
//                        .font(.body)
//                        .lineSpacing(4)
//                        Text("Here is how Cam uses Elephant as Task Manage")
//                            .font(.headline)
//                            .fontWeight(.semibold)
//                        Text("Mode: Pomodoro")
//                            .italic()
//                        ChecklistView(items: [
//                            ChecklistItem(label: "2 Paragraphs for Political Science Paper", isChecked: true),
//                            ChecklistItem(label: "Meet Advisor", isChecked: true),
//                            ChecklistItem(label: "Email Follow-Ups", isChecked: false)
//                        ])
//                        
//                        
//                    }//Vstack
//                }//VStack
//                .frame(maxWidth: .infinity, alignment: .leading)
//               
//            }//content
//            ,
//            backPage: AnyView(SecondPageView()),
//            nextPage: AnyView(FourthPageView()),
//            homePage: AnyView(ContentView())
//            
//        )//ManualTemplateView
//    }//var body
//}//ThirdPageView
//
//// FourthPage
//struct FourthPageView:View{
//    var body: some View {
//        ManualTemplateView(
//            currentPageIdentifier: "manualFourthPage",
//                      content: {
//                          // Fourth Page Content Stack
//                          VStack(alignment: .leading, spacing: 24) { // Fourth Page Content Stack
//                              Text("Add Widget to Widget Bar")
//                                  .font(.title)
//                                  .fontWeight(.bold)
//
//                              VStack(alignment: .leading, spacing: 10) { // Steps block
//                                  Text("(1) To open Notification Center, click the date and \n time in the menu bar or swipe left with two fingers from the right edge of the trackpad. ")
//                                  Text("(2) Scroll down to “Edit Widgets”")
//                                  (
//                                      Text("(3) In the widget gallery, search for a widget. Or click: ") +
//                                      Text("“ElephantMacApp”").bold() +
//                                      Text(" as a widget")
//                                  )
//                                  Text("(4) Enjoy!")
//                              }
//                              .font(.body)
//                              .lineSpacing(5)
//                          }
//                          .frame(maxWidth: .infinity, alignment: .leading)
//                         
//                      }//content
//                ,
//                      backPage: AnyView(ThirdPageView()),
//                      homePage: AnyView(ContentView())
//                  )//ManualTemplateView
//              }//var body
//}//FourthPageView

#Preview {
    ManualView()
}
