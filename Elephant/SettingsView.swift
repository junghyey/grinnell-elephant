//
//  SettingsView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//

import SwiftUI

struct SettingsView: View {

    @Environment(\.presentationMode) var presentationMode //navigating to different presentation based on command
    @EnvironmentObject var storage: TaskListStorage
    @State private var showingChecklist = false
    
    @AppStorage("ThemeSelection") private var selectedTheme: ThemeSelection = .Default
    @AppStorage("colorTheme") var colorTheme: String = "classic" // classic as the default value
    @AppStorage("mode") var mode: String = "pomodoro"
    @AppStorage("mode")  private var Mode: Bool = false //default light mode, toggle for dark mode
    
    @State private var selectedWorkTime: Double = 25 //default for pomodoro
    @State private var selectedBreakTime: Double = 5 //default for pomodoro
    @State private var selectedReminderTime: Double = 30 //default for stopwatch
    
        // Todo:
            // figure out what are the settings and the buttons and things
            // figure out where to store the info being changed, maybe a json with all the configurations
            // figure out how to update settings when user clicks a configuration buttons
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                Spacer()      
                //Back button Navigation back to initial app view page
                ElephantButton(buttonText: "Back", action: {
                    presentationMode.wrappedValue.dismiss()
                }, color: selectedTheme.colors.first ?? DefaultColors.main_color_1)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                
                //Utilized ElephantButton struct from Utils
                sectionTitle(text: "Modes")
                ElephantButton(buttonText: Mode ? "Dark Mode" : "Light Mode", action:{ Mode.toggle()}, color: Mode ? .gray.opacity(0.6) : .gray.opacity(0.3))

                sectionTitle(text: "Themes")
                HStack(spacing: 15){
                    ForEach(ThemeSelection.allCases){
                        theme in ElephantButton(buttonText: theme.rawValue.capitalized, action: {selectedTheme = theme}, color: selectedTheme == theme ? DefaultColors.background : Color.gray.opacity(0.2))
                    }
                }
                
                    //Include Black & White theme along with colorful palettes
                
                sectionTitle(text: "Checklist")
                    
                    //add customizable list addition
                CheckListView()//displays ChecklistView to the user
                    .padding()
                
               sectionTitle(text: "Time Settings", centered: true)
                
                timeSection(title: "Pomodoro" , sliders: [
                    ("Work Duration", $selectedWorkTime, 20, 60, 5),
                    ("Short Break Duration", $selectedBreakTime, 5, 30, 5)
                ])
                
                timeSection(title: "Stopwatch", sliders: [
                    ("Reminder Intervals", $selectedReminderTime, 20, 120, 10)
                ])
                
                Spacer()
            }
        }
        .padding()
        .preferredColorScheme(Mode ? .dark : .light)
        .background(selectedTheme.colors.first ?? DefaultColors.background)
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

//enum for ThemeSelection
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
    @State private var newTaskTitle: String = "" //initial string Task 
    @State private var taskList: [TaskItem] = [] //create a list of TaskItems
    
    //initialize path for task list to TasksList.json
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("TaskLists.json")
    
    var body: some View{
        /* Create individual checklist titles*/
        VStack(alignment: .leading){
            ForEach(taskList.indices, id: \.self){
                index in HStack{
                    Button(action:{taskList[index].isCompleted.toggle()
                        saveTasks()
                    }){
                        Image(systemName: taskList[index].isCompleted ? "checkmark.circle.fill":"circle")
                            .foregroundStyle(taskList[index].isCompleted ? .green: .gray)
                        }
                    Text(taskList[index].title)
                        .strikethrough(taskList[index].isCompleted)
                        .foregroundColor(taskList[index].isCompleted ? .gray: .primary)
                        .padding(.leading, 5)
                }
                .padding(.vertical, 4)
            }//appears once tasks have been added
            HStack{
                TextField("new task", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action:{
                    guard !newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty else {return}
                    let newTask = TaskItem(title: newTaskTitle)
                    taskList.append(newTask)
                    newTaskTitle = ""
                    saveTasks()
                }){
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(DefaultColors.background)
                    
                }
            }//type in customizable tasks, appended to taskList in .json file and visible to the user
            .padding(.top)
        }
        .onAppear(perform: loadTasks)
    }
    //displays the current task list, otherwise displays default in TasksLists.json
    func loadTasks(){
        do{
            let data = try Data(contentsOf: path)
            let decoded = try JSONDecoder().decode(TaskList.self, from: data)
            self.taskList = decoded.tasks
        }catch{
            print("Unable to load tasks, default list shown")
            self.taskList = []
        }
    }
    
    //saves new tasks to the taskList encoding through the defined path
    func saveTasks(){
        do{
            let encoded = try JSONEncoder().encode(TaskList(tasks: taskList))
            try encoded.write(to: path)
        }catch{
            print("Failed to save tasks")
        }
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
}
