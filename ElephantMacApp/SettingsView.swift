//
//  SettingsView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//  Authored by Gabriela Pruneda Turcios

import SwiftUI

struct SettingsView: View {

    @Environment(\.presentationMode) var presentationMode //navigating to different presentation based on command
    @EnvironmentObject var storage: TaskListStorage
    @State private var showingChecklist = false
    
    @AppStorage("ThemeSelection") private var selectedTheme: ThemeSelection = .Default
    @EnvironmentObject var themeManager: ThemeManager
    //utilizing dark mode state withing ThemeManager
    private var Mode: Bool{
        themeManager.isDarkModeEnabled()
    }
    @AppStorage("colorTheme") var colorTheme: String = "classic" // classic as the default value
    @AppStorage("mode") var mode: String = "pomodoro"
    
    @AppStorage("workDuration") private var selectedWorkTime: Double = 25 //default for pomodoro
    @AppStorage("shortBreakTime") private var shortBreakTime: Double = 5 //default for pomodoro
    @AppStorage("longBreakTime") private var longBreakTime: Double = 15//default for pomodoro
    @AppStorage("reminderTime") private var selectedReminderTime: Double = 30 //default for stopwatch
    
    
        // Todo:
            // figure out what are the settings and the buttons and things
            // figure out where to store the info being changed, maybe a json with all the configurations
            // figure out how to update settings when user clicks a configuration buttons (make settings global)
            //add dynamic text changse and make sure checklist view works
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                /*dismisses current Settings View for previous view of homepage, navigating back to ContentView*/
                ElephantButton(buttonText: "< Back", action:{ presentationMode.wrappedValue.dismiss()}, color: themeManager.curTheme.background, textColor: themeManager.textColor(for: themeManager.curTheme.background))
                
                //Utilized ElephantButton struct from Utils
                sectionTitle(text: "Modes")
                ElephantButton(buttonText: Mode ? "Dark Mode" : "Light Mode", action:{ themeManager.toggleDarkMode()}, color: Mode ? .gray.opacity(0.6) : .gray.opacity(0.3), textColor: Mode ? .white : .black)

                sectionTitle(text: "Themes")
                HStack(spacing: 15){//make changes to theme selection with ThemeManager
                    ForEach(ThemeSelection.allCases){
                        theme in ElephantButton(buttonText: theme.rawValue.capitalized, action: {
                            selectedTheme = theme //initializes the selectedTheme based on user selection
                            //update Theme globally with ThemeManager in ColorSettings
                            switch theme{ //switch cases for user selection
                            case .Default:
                                themeManager.setTheme(named: "default")
                            case .BW:
                                themeManager.setTheme(named: "blackWhite")
                            case .Benny:
                                themeManager.setTheme(named: "benny")
                            }
                        }, color: selectedTheme == theme ? themeManager.curTheme.background : Color.gray.opacity(0.2), textColor: selectedTheme == theme ? themeManager.textColor(for: themeManager.curTheme.background) : (Mode ? .white : .black))//sets the selectedTheme as the current page theme
                        
                    }
                    
                }
                
                /*Button navigation to sheet that shows larger custom checklist*/
                sectionTitle(text: "Checklist")
                ElephantButton(buttonText: "Custom list", action: { showingChecklist = true
                }, color: themeManager.curTheme.main_color_2, textColor: themeManager.textColor(for: themeManager.curTheme.main_color_2)) //navigates to showingChecklist at the bottom of ScrollView
                
                
               sectionTitle(text: "Time Settings", centered: true)
            
                timeSection(title: "Pomodoro" , sliders: [ //Pomodoro slider timers
                    ("Work Duration", $selectedWorkTime, 20, 60, 5),
                    ("Short Break Duration", $shortBreakTime, 5, 30, 5),
                    ("Long Break Duration" , $longBreakTime, 15, 30, 5)
                ])
                
                timeSection(title: "Stopwatch", sliders: [ //Stopwatch slider reminders
                    ("Reminder Intervals", $selectedReminderTime, 20, 120, 10)
                ])
                
                Spacer()
            }
        }//end of ScrollView
        .sheet(isPresented: $showingChecklist){ //once add custom checklist has been selected, showingChecklist = true
            NavigationView{
                CheckListView()//navigates to checklist view further down
                    .environmentObject(storage) //stores task list into local taskList
            }
            .frame(width: 500, height: 500) //sheet size
            .presentationDetents([.height(500)])
            
        }
        
        .padding()
        .preferredColorScheme(Mode ? .dark : .light)
        .background(themeManager.curTheme.background)
        .frame(width: 500, height: 500)
    }
    
    //seperate sectionTitle function for setting headliners
    func sectionTitle(text: String, centered: Bool = false) -> some View{
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .padding()
            .frame(maxWidth: .infinity, alignment: centered ? .center : .leading)
    }
    
    //seperate timeSection frame to condense lines of code
    func timeSection(title: String, sliders: [(String, Binding<Double>, Double, Double, Double)]) -> some View{
        VStack(alignment: .leading, spacing: 10){
            sectionTitle(text: title)// Pomodoro or Stopwatch
            ForEach(0..<sliders.count, id: \.self){ index in
                let time_set = sliders[index] //time settings array
                HStack{
                    Text(time_set.0) //Work Duration, Short break duration, and reminder intervals
                        .font(.title3)
                        .fontWeight(.thin)
                        .fontDesign(.rounded)
                    
                    Spacer()
                    //displays currently selected time to user
                    Text("Current Setting: \(Int(time_set.1.wrappedValue)) min")
                        .font(.headline)
                        .foregroundColor(themeManager.curTheme.main_color_2)
                }
                customSlider(selectedTime: time_set.1, minTime: time_set.2, maxTime: time_set.3, interval: time_set.4)
                //creates custom slider given the selected time section
            }
        }
    }
}//bottom of SettingsView


//only utilized for selectedTheme within SettingsView, ThemeManager is utilized for everything else
enum ThemeSelection: String, CaseIterable, Identifiable{
    case Default //default theme setting
    case BW //Black and White theme setting
    case Benny //Benny character theme setting
    
    var id: String{self.rawValue} //initializes var id for theme selection
    
    //different color themes and access DefaultColors in Utils
    var colors:[Color]{
        switch self{
        case .Default:
            return [DefaultColors.main_color_1, DefaultColors.main_color_2, DefaultColors.main_color_3, DefaultColors.background, DefaultColors.shadow_1, DefaultColors.shadow_2]
        case .BW:
            return[Color(hex: "343434"), Color(hex: "FFFFFF"), Color(hex: "000000"), Color(hex: "C0C0C0")]
        case .Benny:
            return [Color(hex: "4B90CD"),Color(hex: "094F98"), Color(hex: "B8D2F0"), Color(hex: "F3A3B5"), Color(hex: "19171A"), Color(hex: "F0CC34")]
            
        }
    }
    
}

//Mode Selection button between light and dark mode
struct ModeSelection: View{
    @AppStorage("mode") private var Mode: Bool = false //sets default mode
    
    var body: some View{
        Button(action:{
            Mode.toggle() //to select dark mode
        }){
            HStack{
                Image(systemName: Mode ? "moon.fill": "sun.max.fill")
                    .foregroundColor(Mode ? .yellow : .blue)
                Text(Mode ? "Dark Mode" : "Light Mode")
                    .foregroundColor(Mode ? .white : .black)
                    .fontWeight(.medium)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Mode ? Color.gray.opacity(0.3) : Color.gray.opacity(0.1)))
            
        }
    }
}

//Checklist struct that appears for users to make a local taskList within Settings and stored locally
// use in the widget functionality for task completion, adding to overall tokens
struct CheckListView: View{
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var storage: TaskListStorage
    @EnvironmentObject var themeManager: ThemeManager
    @State private var newTask: String = "" //initial string Task
    @State private var localTasks: [TaskItem] = [] //create a list of tasks stored locally
    @State private var hasChanged: Bool = false //tracks if any changes were made to the checklist
    
    
    var body: some View {
            VStack(spacing: 16) {
                Spacer()
                //First Checklist
                Text("Checklist #1") //section title for the checklist
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)

                List{
                    //Displays current task list
                    if localTasks.isEmpty {
                        Text("No tasks yet!")//Default message for empty task list
                            .foregroundColor(themeManager.curTheme.main_color_2)
                            .padding(10)
                            .listRowBackground(themeManager.curTheme.background)
                    }else{//if there aren't any initialized tasks
                        ForEach(localTasks){ task in
                            HStack{//Allows user to check off their tasks within settings
                                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")//checkboxes for tasks within user view
                                    .foregroundColor(task.isCompleted ? themeManager.curTheme.main_color_2: themeManager.curTheme.main_color_3)
                                    .onTapGesture { //calls on function to complete task
                                        if let index = localTasks.firstIndex(where: {$0.id == task.id}){
                                            localTasks[index].isCompleted.toggle() //marks completed task as such
                                            hasChanged = true //tracks changes made to task list
                                        }
                                    }
                                Text(task.title) //Adds task to the current custom list, saves upon user 'Save'
                                    .strikethrough(task.isCompleted)
                                    .foregroundColor(task.isCompleted ? themeManager.curTheme.main_color_2: themeManager.curTheme.main_color_3)
                            }
                            
                        }
                        //once the user checks off/strikes through a task, that task is removed from the local server
                        .onDelete{ indexSet in
                            indexSet.forEach{ index in
                                localTasks.remove(at: index)
                                hasChanged = true
                            }
                        }
                    }
                    //Adding a new task prompt, regenerates after user input
                    HStack{
                        Image(systemName: "plus")
                            .foregroundColor(themeManager.curTheme.main_color_1)
                        TextField("Add new task...", text: $newTask)
                            .textFieldStyle(PlainTextFieldStyle())
                            .onSubmit{
                                addNewTask() //adds new task to the localtask list and displays it on user end
                            }
                    }
                }
                .listStyle(PlainListStyle())
                    
                Spacer()

                //Cancel & Save button at the bottom of the checklist sheet
                HStack(spacing: 20) {
                    ElephantButton(
                        buttonText: "Cancel",
                        action: {
                            dismiss() }, //makes no changes to the list, cancel means that all work is lost
                        color: themeManager.curTheme.main_color_2,
                        textColor: themeManager.textColor(for: themeManager.curTheme.main_color_2)
                    )


                    ElephantButton(
                        buttonText: "Save",
                        action: {
                            for task in storage.taskList.tasks{
                                storage.removeTask(task: task) //checks for all striked through tasks and removes them
                            }
                            
                            for task in localTasks{
                                if !task.isCompleted{ //if that task is not yet marked
                                    storage.addTask(title: task.title) //add the new task
                                    
                                    if task.isCompleted{ //if that task has been marked completed, then we mark it as such
                                        if let addedTask = storage.taskList.tasks.last{
                                            storage.markTastCompleted(task: addedTask)
                                        }
                                    }
                                }
                            }
                            storage.saveTasks()
                            dismiss()
                        },
                        color: themeManager.curTheme.main_color_1,
                        textColor: themeManager.textColor(for: themeManager.curTheme.main_color_2)
                    )
                }
                .padding(.bottom)
            }
            .padding()
            .cornerRadius(12)
            .padding()
            .onAppear{
                localTasks = storage.taskList.tasks //upon re-opening of the custom list, all incomplete tasks are saved in storage
            }
        }

    //adds new task made from the user to TaskListsStorage and stores in
    //TaskLists.json
    private func addNewTask() {
        let trim = newTask.trimmingCharacters(in: .whitespaces)
        guard !trim.isEmpty else { return }
        //adds to each local users custom checklist
        let newItem = TaskItem(title: trim)
        localTasks.append(newItem)
        hasChanged = true
        
        //Clears the input field
        DispatchQueue.main.async{
            self.newTask = ""
        }
    }
    
}


//Slider customizable between minimum, maximum and break time intervals between work breaks
struct customSlider: View{ //Custom slider struct
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var selectedTime: Double
    let minTime: Double
    let maxTime: Double
    let interval: Double
    
    var body: some View{
        VStack(spacing: 8){
            //builds slider for various settings
            Slider(value: $selectedTime, in: minTime...maxTime, step: interval)
                .accentColor(themeManager.curTheme.main_color_2)
                .padding(.vertical, 8)
            
            HStack{
                Text("\(Int(minTime)) min")
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(themeManager.curTheme.main_color_3)
                Spacer()
                Text("\(Int(maxTime)) min")
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(themeManager.curTheme.main_color_3)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

//SettingsView preview
#Preview {
    SettingsView()
        .environmentObject(TaskListStorage())
}
