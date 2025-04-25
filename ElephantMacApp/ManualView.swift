//
//  ManualView.swift
//  Elephant
//
//  Authors: Hyeyun(creating manual content), Mae(creater of this file)
//

/*
 https://developer.apple.com/documentation/swiftui/font
 
 */
import SwiftUI

/*
 This is a template structure for each page in the manual
 
 
 References:
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
 */

/**
 `ManualTemplateView` is a reusable SwiftUI component that defines a consistent layout for pages
 within the Elephant app’s interactive manual. It provides a scrollable content area, navigation
 controls, and an optional home button — making it ideal for onboarding flows or multi-step guides.

 ## Purpose:
 - Provide a consistent and styled layout wrapper for manual/help pages.
 - Support step-based navigation and return-to-home functionality.

 ## Behavior:
 - Displays a scrollable content view passed as a closure.
 - Shows a home button if `homePage` is provided.
 - Shows back/next navigation buttons if `backPage` or `nextPage` are provided.
 - Automatically applies accessibility identifiers and dynamic theming.

 ## Parameters:
 - `currentPageIdentifier`: A unique string identifier for accessibility and view recognition.
 - `content`: A closure that returns the SwiftUI view displayed in the content area.
 - `backPage`: An optional view to navigate back to the previous manual page.
 - `nextPage`: An optional view to navigate forward to the next manual page.
 - `homePage`: An optional view that serves as a return point to the app’s homepage.

 ## Preconditions:
 - `content` must be a valid SwiftUI `View`.
 - `currentPageIdentifier` must be unique within the manual flow.

 ## Postconditions:
 - The rendered page includes:
    - A header with an optional home button.
    - Scrollable manual content.
    - Navigation buttons (if applicable) for linear page traversal.
 */
struct ManualTemplateView<Content: View>:  View {
    @AppStorage("mode") private var Mode: Bool = false
    @Environment(\.dismiss) private var dismiss
    //Variables
    var currentPageIdentifier: String
    var content: Content
    var backPage: AnyView?
    var nextPage: AnyView?
    var homePage: AnyView?
    
    //Initializer (similar to this in java)
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
            // Main layout stack
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
                
                // Scrollable content area
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
                .background(DefaultColors.background)
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
            }
            .preferredColorScheme(Mode ? .dark : .light)
            .frame(width: 500, height: 500)
            .background(Mode ? Color.black : Color.white)
        }//VStack
  
}//ManualTemplateView

// FirstPage
struct ManualView:View{
    var body: some View {
  
            ManualTemplateView(
                currentPageIdentifier: "manualFirstPage",
                content: {
                    // First Page Content Stack
                    VStack(alignment: .leading, spacing: 20) {
                       Text("Welcome to Elephant...")
                            .font(.title)
                            .fontWeight(.bold)
                            .lineSpacing(4)
                        
                        Text(
                            "Are you ready to incorporate wellness tasks into your work routine with us? Let’s get started!"
                        )
                        .font(.title3)
                        .fontWeight(.medium)
                        .lineSpacing(6)
                        
                        // Stopwatch section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Stopwatch Mode")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(
                                " * Receive wellness reminders at customized time intervals.\n * Turn on when you start working and off when you’re done."
                            )
                            .font(.body)
                            .lineSpacing(4)
                        }//Vstack
                        
                        // Pomodoro section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Pomodoro Mode")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(
                                "* Integrate Pomodoro method with wellness tasks \n * Customize the time intervals"
                            )
                            .font(.body)
                            .lineSpacing(4)
                        }//Vstack
                        
                        // Token earning section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Earn Tokens")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(
                                "* Earn tokens by completing tasks on checklist that you can exchange for collectibles to customize your widget!"
                            )
                            .font(.body)
                            .lineSpacing(4)
                        }//Vstack
                    }//Vstack
                }//content
                ,
                nextPage: AnyView(SecondPageView()),
                homePage: AnyView(ContentView())
                
            )//ManualTemplateView
            .frame(maxWidth: .infinity, alignment: .leading)
         
    }//body
}//ManualView

// SecondPage
struct SecondPageView:View{
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "manualSecondPage",
            content: {
                // Second Page Content Stack
                VStack(alignment: .leading, spacing: 24) {
                    Text("How To ")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Stopwatch Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("StopWatch")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(
                      """
                      Start the stopwatch to begin & be notified at custom intervals.
                      """
                        )
                        .font(.body)
                        .lineSpacing(4)
                        
                    }//Vstack
                    
                    // Pomodro Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Pomdoro")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(
                      """
                      You get 4 instances of work time with a short break following the first 3 instances and a long break break after the 4th round
                      """
                        )
                        .font(.body)
                        .lineSpacing(4)
                        
                    }//Vstack
                    
                    // Tokens & Collectibles Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Tokens & Collectibles")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(
                      """
                      After each wellness task or checklist item is completed, you will earn a token.\n Once you have tokens, you can start collecting acatars for the collectible reward!\n (but be warned... you need to have enough tokens to get a collectible).
                      """
                        )
                        .font(.body)
                        .lineSpacing(5)
                        
                    }//Vstack
                }//Vstack
                .frame(maxWidth: .infinity, alignment: .leading)
              
            }//content
            ,
            backPage: AnyView(ManualView()),
            nextPage: AnyView(ThirdPageView()),
            homePage: AnyView(ContentView())
            
        )//ManualTemplateView
    }//body
}//firstPageView



/*
Each item inside the checklist
 */
struct ChecklistItem: Identifiable {
    let id = UUID()
    let label: String
    let isChecked: Bool
}//ChecklistItem

/*
 CbeckBoxView Template View
 
 References:
 https://www.hackingwithswift.com/quick-start/swiftui/building-a-menu-using-list
 */
struct CheckBoxView: View {
    let isChecked: Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .foregroundColor(isChecked ?  DefaultColors.main_color_3: Color.secondary)
    }//var body
}//CheckBoxView
/*
 ChecklistView struct template
 
 References:
 https://developer.apple.com/documentation/swiftui/foreach
 */

struct ChecklistView: View {
    let items: [ChecklistItem]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(items) { item in
                HStack {
                    Text(item.label)
                    CheckBoxView(isChecked: item.isChecked)
                    
                }//Hstack
            }//ForEach
        }//Vstack
    }//var body
}//ChecklistView

// ThirdPage
struct ThirdPageView:View{
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "manualThirdPage",
            content: {
                // Third Page Content Stack
                VStack(alignment: .leading, spacing: 24) {
                    Text("Customize Elephant to your need!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Stopwatch Section Example Sam
                    VStack(alignment: .leading, spacing: 8) {
                        Text(
                      """
                      Sam is a software engineer that sits in front of his computer for long hours. Sam gets so immersed that they forget to eat or rest.
                      """
                        )
                        .font(.body)
                        .lineSpacing(4)
                        Text("Here is how Sam uses Elephant as Wellness Reminders")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Mode: Stopwatch")
                            .italic()
                        ChecklistView(items: [
                            ChecklistItem(label: "Take a 10min walk", isChecked: true),
                            ChecklistItem(label: "Grab a coffee", isChecked: false),
                            ChecklistItem(label: "Eat an apple", isChecked: true)
                        ])
                        
                        
                        
                    }//Vstack
                    
                    // Example Cam Pomodro Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text(
                        """
                        Cam is a college student that finds it hard to stay on top of class and extracurriculars. Cam wants some motivation to get the tasks done.
                        """
                        )
                        .font(.body)
                        .lineSpacing(4)
                        Text("Here is how Cam uses Elephant as Task Manage")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Mode: Pomodoro")
                            .italic()
                        ChecklistView(items: [
                            ChecklistItem(label: "2 Paragraphs for Political Science Paper", isChecked: true),
                            ChecklistItem(label: "Meet Advisor", isChecked: true),
                            ChecklistItem(label: "Email Follow-Ups", isChecked: false)
                        ])
                        
                        
                    }//Vstack
                }//VStack
                .frame(maxWidth: .infinity, alignment: .leading)
               
            }//content
            ,
            backPage: AnyView(SecondPageView()),
            nextPage: AnyView(FourthPageView()),
            homePage: AnyView(ContentView())
            
        )//ManualTemplateView
    }//var body
}//ThirdPageView

// FourthPage
struct FourthPageView:View{
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "manualFourthPage",
                      content: {
                          // Fourth Page Content Stack
                          VStack(alignment: .leading, spacing: 24) { // Fourth Page Content Stack
                              Text("Add Widget to Widget Bar")
                                  .font(.title)
                                  .fontWeight(.bold)

                              VStack(alignment: .leading, spacing: 10) { // Steps block
                                  Text("(1) Open Notification Center, click the date and \n time in the menu bar or swipe left with two fingers from the right edge of the trackpad. ")
                                  Text("(2) Scroll down to “Edit Widgets”")
                                  (
                                      Text("(3) In the widget gallery, search for a widget. Or click: ") +
                                      Text("“ElephantMacApp”").bold() +
                                      Text(" as a widget")
                                  )
                                  Text("(4) Enjoy!")
                              }
                              .font(.body)
                              .lineSpacing(5)
                          }
                          .frame(maxWidth: .infinity, alignment: .leading)
                         
                      }//content
                ,
                      backPage: AnyView(ThirdPageView()),
                      homePage: AnyView(ContentView())
                  )//ManualTemplateView
              }//var body
}//FourthPageView

#Preview {
    ManualView()
}
