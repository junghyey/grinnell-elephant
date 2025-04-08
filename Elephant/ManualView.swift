//
//  ManualView.swift
//  Elephant
//
//  Authors: Hyeyun(creating manual content), Mae(creater of this file)
//
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
       
            VStack(spacing: 0) {
                HStack {
                    Spacer()//expands leftward
                    if let homePage = homePage {
                        NavigationLink(destination: homePage) {
                            Image(systemName: "house.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                                .accessibilityIdentifier("homeButton")
                                .allowsHitTesting(true)
                                //nopadding
                        }//NavigationLink
                    }//homepage
                }//HStack
               
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        content
                        Spacer(minLength: 80) // space above the nav buttons
                    }//VStack
                    .padding()
                    .background(
                        Color.clear
                            .accessibilityElement(children: .combine)
                            .accessibilityIdentifier(currentPageIdentifier)
                    )
                    .id(currentPageIdentifier) 
                }//ScrollView
                
                HStack {
                    if let backPage = backPage {
                        NavigationLink(destination: backPage) {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                                .accessibilityIdentifier("backButton")
                                .allowsHitTesting(true)
                        }
                    }
                    
                    Spacer()//expands leftward
                    
                    if let nextPage = nextPage {
                        NavigationLink(destination: nextPage) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                                .accessibilityIdentifier("nextButton")
                                .allowsHitTesting(true)
                        }//NavigationLink
                    }//nextPage
                }//HStack
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .preferredColorScheme(Mode ? .dark : .light)
            .frame(width: 500, height: 500)
            .background(Mode ? Color.black : Color.white)
        }//VStack
  
}//ManualTemplateView

// FirstPage
struct ManualView:View{
    var body: some View {
        NavigationStack {
            ManualTemplateView(
                currentPageIdentifier: "manualFirstPage",
                content: {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Welcome to Elephant: A Wellness Trunk!")
                            .font(.title)
                            .fontWeight(.bold)
                            .lineSpacing(4)
                        
                        Text(
                            "Are you ready to incorporate wellness tasks into your work routine with us? Let’s get started!"
                        )
                        .font(.title3)
                        .fontWeight(.medium)
                        .lineSpacing(6)
                        
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
        }
    }//body
}//ManualView

// SecondPage
struct SecondPageView:View{
    var body: some View {
        ManualTemplateView(
            currentPageIdentifier: "manualSecondPage",
            content: {
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
            .foregroundColor(isChecked ? Color.blue : Color.secondary)
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
                VStack(alignment: .leading, spacing: 24) {
                    Text("Customize Elephant to your need!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Stopwatch Section
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
                    
                    // Pomodro Section
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
                .padding(.bottom, 40) 
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
                VStack(alignment: .leading, spacing: 20) {
                    Text("Add Widget to Widget Bar")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("(1) Navigate to the widget bar")
                    Text("(2) Scroll down to “Edit Widget”")
                    Text("(3) Add **“Elephant: A Wellness Trunk”** as a widget")
                    Text("(4) Enjoy! ")
                    
                    //insert video for tutorial?
                }//Vstack
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
