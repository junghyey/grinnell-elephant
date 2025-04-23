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
    @AppStorage("colorTheme") var colorTheme: String = "classic" // classic as the default value
    @AppStorage("mode") var mode: String = "pomodoro"
    @AppStorage("mode")  private var Mode: Bool = false //default light mode, toggle for dark mode
    
    @State private var selectedWorkTime: Double = 25 //default for pomodoro
    @State private var shortBreakTime: Double = 5 //default for pomodoro
    @State private var longBreakTime: Double = 15//default for pomodoro
    @State private var selectedReminderTime: Double = 30 //default for stopwatch
    
        // Todo:
            // figure out what are the settings and the buttons and things
            // figure out where to store the info being changed, maybe a json with all the configurations
            // figure out how to update settings when user clicks a configuration buttons (make settings global)
            //add dynamic text changse and make sure checklist view works
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                /*dismisses current Settings View for previous view of homepage, navigating back to ContentView*/
                ElephantButton(buttonText: "< Back", action:{ presentationMode.wrappedValue.dismiss()}, color: themeManager.curTheme.background)
                
                
                
                //Utilized ElephantButton struct from Utils
                sectionTitle(text: "Modes")
                ElephantButton(buttonText: Mode ? "Dark Mode" : "Light Mode", action:{ Mode.toggle()}, color: Mode ? .gray.opacity(0.6) : .gray.opacity(0.3))

                sectionTitle(text: "Themes")
                HStack(spacing: 15){//make changes to theme selection with ThemeManager
                    ForEach(ThemeSelection.allCases){
                        theme in ElephantButton(buttonText: theme.rawValue.capitalized, action: {
                            selectedTheme = theme
                            //update Theme globally with ThemeManager in ColorSettings
                            switch theme{
                            case .Default:
                                themeManager.setTheme(named: "default")
                            case .BW:
                                themeManager.setTheme(named: "blackWhite")
                            case .Benny:
                                themeManager.setTheme(named: "benny")
                            }
                        }, color: selectedTheme == theme ? themeManager.curTheme.background : Color.gray.opacity(0.2))
                        
                    }
                    
                }
                
                /*Button navigation to sheet that shows larger custom checklist*/
                sectionTitle(text: "Checklist")
                ElephantButton(buttonText: "Add new custom list", action: { showingChecklist = true
                }, color: selectedTheme.colors.first ?? themeManager.curTheme.main_color_2)
                
                
               sectionTitle(text: "Time Settings", centered: true)
                
                timeSection(title: "Pomodoro" , sliders: [
                    ("Work Duration", $selectedWorkTime, 20, 60, 5),
                    ("Short Break Duration", $shortBreakTime, 5, 30, 5),
                    ("Long Break Duration" , $longBreakTime, 15, 30, 5)
                ])
                
                timeSection(title: "Stopwatch", sliders: [
                    ("Reminder Intervals", $selectedReminderTime, 20, 120, 10)
                ])
                
                Spacer()
            }
        }
        .sheet(isPresented: $showingChecklist){
            NavigationView{
                CheckListView()
                    .environmentObject(storage)
                    .frame(width: 500, height: 500)
            }
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
                Text(time_set.0) //Work Duration, Short break duration, and reminder intervals
                    .font(.title3)
                    .fontWeight(.thin)
                    .fontDesign(.rounded)
                    .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                customSlider(selectedTime: time_set.1, minTime: time_set.2, maxTime: time_set.3, interval: time_set.4)
                //creates custom slider given the selected time section
            }
        }
    }
    @State private var newTask = ""
}//bottom of SettingsView


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

//Checklist struct that utilizes pathway to TaskLists.json
struct CheckListView: View{
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var storage: TaskListStorage
    @EnvironmentObject var themeManager: ThemeManager
    @State private var newTask: String = "" //initial string Task
    @State private var taskList: [TaskItem] = [] //create a list of TaskItems
    
    var body: some View {
            VStack(spacing: 16) {
                //First Checklist
                Text("Checklist #1")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)

                //Displays current task list
                if storage.taskList.tasks.isEmpty {
                    Spacer()
                    Text("No tasks yet!")//Default message for empty task list
                        .foregroundColor(themeManager.curTheme.main_color_2)
                        .padding(10)
                } else { //Once tasks have been added by the user
                    List {
                        ForEach(storage.taskList.tasks) { task in
                            HStack {//Allows user to check off their tasks within settings
                                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                                    .foregroundColor(task.isCompleted ? themeManager.curTheme.shadow_1 : themeManager.curTheme.shadow_2)
                                    .onTapGesture { //calls on function to complete task
                                        storage.markTastCompleted(task: task)
                                    }

                                //Writes our user task
                                Text(task.title)
                                    .strikethrough(task.isCompleted)
                                    .foregroundColor(task.isCompleted ? themeManager.curTheme.shadow_1 : themeManager.curTheme.shadow_2)
                            }
                        }//once the user checks off a task as complete, that task will be removed
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let task = storage.taskList.tasks[index]
                                storage.removeTask(task: task)
                            }
                        }


                        // Add new task row at the end
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.secondary)


                            TextField("Add new task...", text: $newTask, onCommit: addNewTask)
                                .textFieldStyle(PlainTextFieldStyle())
                        }
                    }
                    .listStyle(PlainListStyle())
                }

                Spacer()

                //Cancel & Save button at the bottom of the checklist sheet
                HStack(spacing: 20) {
                    ElephantButton(
                        buttonText: "Cancel",
                        action: { dismiss() },
                        color: .gray.opacity(0.3)
                    )


                    ElephantButton(
                        buttonText: "Save",
                        action: {
                            storage.saveTasks()
                            dismiss()
                        },
                        color: themeManager.curTheme.main_color_2
                    )
                }
                .padding(.bottom)
            }
            .padding()
            .cornerRadius(12)
            .padding()
        }

    //adds new task made from the user to TaskListsStorage and stores in
    //TaskLists.json
    private func addNewTask() {
        let trim = newTask.trimmingCharacters(in: .whitespaces)
        guard !trim.isEmpty else { return }
        storage.addTask(title: trim)
        newTask = ""
    }
    
}


//Slider customizable between minimum, maximum and break time intervals between work breaks
struct customSlider: View{ //Custom slider struct
    @Binding var selectedTime: Double
    let minTime: Double
    let maxTime: Double
    let interval: Double
    
    var body: some View{
        VStack{
            Slider(value: $selectedTime, in: minTime...maxTime, step: interval)
                .accentColor(.black)
                .padding()
            
            HStack{
                Text("\(Int(minTime)) min")
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                Spacer()
                Text("\(Int(maxTime)) min")
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
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
