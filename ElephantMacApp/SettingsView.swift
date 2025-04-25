//
//  SettingsView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//  Authored by Gabriela Pruneda Turcios

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode //navigating to different presentation based on command
    @EnvironmentObject var storage: TaskListStorage //local storage for checklist
    @State private var showingChecklist = false //default set to false until user opens the checklist
    
    @EnvironmentObject var themeManager: ThemeManager //found within ColorSettings, manages global theme settings
    @AppStorage("mode") private var Mode: Bool = false // default light mode
    
    @AppStorage("mode") var mode: String = "pomodoro" //set default to pomodoro
    
    //Default time settings for Pomodoro and Stopwatch widget integration
    @AppStorage("workDuration") private var selectedWorkTime: Double = 25
    @AppStorage("shortBreakTime") private var shortBreakTime: Double = 5
    @AppStorage("longBreakTime") private var longBreakTime: Double = 15
    @AppStorage("reminderTime") private var selectedReminderTime: Double = 30
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                backButton // Back button
                
                modeSection // Mode selection
                
                themeSection // Theme selection
                
                checklistSection // Checklist button
                
                sectionTitle(text: "Time Settings", centered: true)
                // Pomodoro time settings
                pomodoroTimeSection
                // Stopwatch time settings
                stopwatchTimeSection
                
                Spacer()
            }
        }
        .sheet(isPresented: $showingChecklist) { //custom list pop-up
            NavigationView {
                CheckListView() //calls on CheckList view to appear on user command
                    .environmentObject(storage)
            }
            .frame(width: 500, height: 500) //frames pop-up sheet
        }
        .padding()
        .preferredColorScheme(Mode ? .dark : .light) //based on user selection
        .background(themeManager.curTheme.background) //based on user selection
        .frame(width: 500, height: 500) //frames scroll view
    }
    
    //re-usable back button, calls presentationMode to go "back" to previous
    private var backButton: some View {
        ElephantButton(buttonText: "Back", action: {
            presentationMode.wrappedValue.dismiss()
        }, color: themeManager.curTheme.main_color_1)
    }
    
    //mode section Button that chooses between light and dark mode, applying the mode globally
    private var modeSection: some View {
        VStack(alignment: .leading) {
            sectionTitle(text: "Modes")
            ElephantButton(buttonText: Mode ? "Dark Mode" : "Light Mode", action: {
                Mode.toggle()
            }, color: Mode ? .gray.opacity(0.7) : .gray.opacity(0.2))
        }
    }
    
    //Includes all current theme options
    //Utilizes ElephantButton from Utils for theme selection
    private var themeSection: some View {
        VStack(alignment: .leading) {
            sectionTitle(text: "Themes")
            HStack(spacing: 15) {
                // Create buttons for each theme
                //Default elephant theme
                ElephantButton(
                    buttonText: "Default",
                    action: { themeManager.setTheme(named: "defaultElephant") },
                    color: themeManager.curThemeKey == "defaultElephant" ?
                    themeManager.curTheme.main_color_1 : Color.gray.opacity(0.2))
                //Black and White theme
                ElephantButton(
                    buttonText: "Black & White",
                    action: { themeManager.setTheme(named: "blackWhite") },
                    color: themeManager.curThemeKey == "blackWhite" ?
                    themeManager.curTheme.main_color_1 : Color.gray.opacity(0.2))
                //Benny the Cow theme
                ElephantButton(
                    buttonText: "Benny",
                    action: { themeManager.setTheme(named: "benny") },
                    color: themeManager.curThemeKey == "benny" ?
                    themeManager.curTheme.main_color_1 : Color.gray.opacity(0.2))
            }
        }
    }
    
    //Button for add new custom checklist
    private var checklistSection: some View {
        VStack(alignment: .leading) {
            sectionTitle(text: "Checklist")
            ElephantButton(buttonText: "Custom list", action: {
                showingChecklist = true
            }, color: themeManager.curTheme.main_color_2)
        }
    }
    
    // Displays Pomodoro time settings and sliders
    private var pomodoroTimeSection: some View {
        timeSection(title: "Pomodoro", sliders: [
            ("Work Duration", $selectedWorkTime, 20, 60, 5),
            ("Short Break Duration", $shortBreakTime, 5, 30, 5),
            ("Long Break Duration", $longBreakTime, 15, 30, 5)
        ])
    }
    
    //displays stopwatch time settings for reminder intervals
    private var stopwatchTimeSection: some View {
        timeSection(title: "Stopwatch", sliders: [
            ("Reminder Intervals", $selectedReminderTime, 20, 120, 10)
        ])
    }
    
    //reusable sectionTitle for various section headers
    func sectionTitle(text: String, centered: Bool = false) -> some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .padding()
            .frame(maxWidth: .infinity, alignment: centered ? .center : .leading)
    }
    //displays time section for both pomodoro and stopwatch settings
    func timeSection(title: String, sliders: [(String, Binding<Double>, Double, Double, Double)]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            sectionTitle(text: title)
            ForEach(0..<sliders.count, id: \.self) { index in
                let time_set = sliders[index]
                HStack {
                    Text(time_set.0)
                        .font(.title3)
                        .fontWeight(.thin)
                        .fontDesign(.rounded)
                    
                    Spacer()
                    //displays user currently selected time above each slider
                    Text("Current Setting: \(Int(time_set.1.wrappedValue)) min")
                        .font(.headline)
                        .foregroundColor(themeManager.curTheme.main_color_2)
                }//calls customSlider based on interval ranges
                customSlider(selectedTime: time_set.1, minTime: time_set.2, maxTime: time_set.3, interval: time_set.4)
            }
        }
    }
}//bottom of SettingsView

//ChecklistView for custom checklist
struct CheckListView: View {
    @AppStorage("mode") private var Mode: Bool = false // default light mode
    //variables for task list storage and array of task items defined
    @Environment(\.dismiss) private var dismiss //used for dismissing current presentation
    @EnvironmentObject var storage: TaskListStorage //defined storage
    @EnvironmentObject var themeManager: ThemeManager //defined within scope for theme changes
    @State private var newTask: String = "" //default empty task
    @State private var localTasks: [TaskItem] = [] //array of locally stored tasks
    @State private var hasChanged: Bool = false //checks if the task list has any changes
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            //displays first default checklist
            Text("Checklist #1")
                .font(.title2)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

            taskList //calls taskList appearance
            
            Spacer()
            
            actionButtons //calls for Cancel and Save buttons appearance
        }
        .padding()
        .cornerRadius(12)
        .padding()
        .onAppear {
            localTasks = storage.taskList.tasks //displays currently incomplete tasks
        }
    }
    
    //tasklist displays the custom checklist for user within SettingsView
    private var taskList: some View {
        List {
            if localTasks.isEmpty { //if no tasks are currently set
                Text("No tasks yet!")
                    .foregroundColor(themeManager.curTheme.main_color_2)
                    .padding(10)
                    .listRowBackground(themeManager.curTheme.background)
            } else { //for each incomplete tasks
                ForEach(localTasks) { task in
                    HStack { //ability to check off tasks once completed
                        Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                            .foregroundColor(task.isCompleted ? themeManager.curTheme.main_color_2 : themeManager.curTheme.main_color_3)
                            .onTapGesture { //marks tasks as completed based on user input
                                if let index = localTasks.firstIndex(where: { $0.id == task.id }) {
                                    localTasks[index].isCompleted.toggle()
                                    hasChanged = true
                                }
                            }
                        // strikes through completed tasks
                        Text(task.title)
                            .strikethrough(task.isCompleted)
                            .foregroundColor(task.isCompleted ? themeManager.curTheme.main_color_2 : themeManager.curTheme.main_color_3)
                    }
                }//removes tasks once they've been marked as completed
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        localTasks.remove(at: index)
                        hasChanged = true
                    }
                }
            }
            //section for adding a new task within custom list view
            //whether the user hits enter for a new task or clicks the plus sign, they can add a new task
            HStack {
                Image(systemName: "plus")
                    .foregroundColor(themeManager.curTheme.main_color_1)
                TextField("Add new task...", text: $newTask, onCommit: addNewTask)
                    .textFieldStyle(PlainTextFieldStyle())
            }
        }
        .listStyle(PlainListStyle())
    }
    
    //Actionable buttons within custom checklist view
    private var actionButtons: some View {
        HStack(spacing: 20) {
            ElephantButton(
                buttonText: "Cancel",
                action: { dismiss() }, //does not save any changes on cancel
                color: themeManager.curTheme.main_color_2)
            
            ElephantButton(
                buttonText: "Save",
                action: {
                    for task in storage.taskList.tasks {
                        storage.removeTask(task: task) //removes any completed tasks
                    }
                    //for locally created tasks,
                    for task in localTasks {
                        if !task.isCompleted { //first checks if they're are incomplete tasks in the list
                            storage.addTask(title: task.title) //adds any newly created task
                            
                            //once the task has been marked complete
                            if task.isCompleted {
                                if let addedTask = storage.taskList.tasks.last {
                                    storage.markTastCompleted(task: addedTask)
                                } //stores completed task within storage
                            }
                        }
                    }
                    storage.saveTasks() //updates tasks
                    dismiss()
                },
                color: themeManager.curTheme.main_color_1)
        }
        .padding(.bottom)
        .preferredColorScheme(Mode ? .dark : .light) //based on user selection
    }
    //seperate function for adding a new task in real time currently within SettingsView only
    private func addNewTask() {
        let trim = newTask.trimmingCharacters(in: .whitespaces)
        guard !trim.isEmpty else { return }
        //allows for an additional task to be added within custom list view
        let newItem = TaskItem(title: trim)
        localTasks.append(newItem) //adds new task to local tasks array
        hasChanged = true
        //Clears the input field
        DispatchQueue.main.async {
            self.newTask = ""
        }
    }
}
 /*Custom slider for various time settings for pomodoro and stopwatch.
  Slider customizable between minimum, maximum and break time intervals between work breaks*/
struct customSlider: View {
    @AppStorage("mode") private var Mode: Bool = false // default light mode
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var selectedTime: Double
    let minTime: Double
    let maxTime: Double
    let interval: Double
    
    var body: some View {
        VStack(spacing: 8) { //builds slider for various settings
            Slider(value: $selectedTime, in: minTime...maxTime, step: interval)
                .accentColor(themeManager.curTheme.main_color_2)
                .padding(.vertical, 8)
            
            HStack {
                Text("\(Int(minTime)) min") //displays lowest interval in the range
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(themeManager.curTheme.main_color_3)
                Spacer()
                Text("\(Int(maxTime)) min") //displays highest interval in the range
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(themeManager.curTheme.main_color_3)
            }
            .padding(.horizontal)
        }
        .padding()
        .preferredColorScheme(Mode ? .dark : .light) //based on user selection
    }
}

//SettingsView preview
#Preview {
    SettingsView()
        .environmentObject(TaskListStorage())
}
