//
//  SettingsView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//

import SwiftUI

struct SettingsView: View {

    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("ThemeSelection") private var selectedTheme: ThemeSelection = .def
    @AppStorage("colorTheme") var colorTheme: String = "classic" // classic as the default value
    @AppStorage("mode") var mode: String = "pomodoro"
    @AppStorage("mode")  private var Mode: Bool = false //default light mode, toggle for dark mode
    
    @State private var selectedWorkTime: Double = 25 //default for pomodoro
    @State private var selectedBreakTime: Double = 5 //default for pomodoro
    @State private var selectedReminderTime: Double = 30 //default for stopwatch
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                // Todo:
                    // figure out what are the settings and the buttons and things
                    // figure out where to store the info being changed, maybe a json with all the configurations
                    // figure out how to update settings when user clicks a configuration buttons
                Spacer()      
                //Back button Navigation back to initial app view page
                ElephantButton(buttonText: "Back", action: {
                    presentationMode.wrappedValue.dismiss()
                }, color: selectedTheme.colors.first ?? DefaultColors.main_color_1)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                
               //Mode Selection between light and dark mode is displayed    
                VStack(alignment: .leading, spacing: 20){
                    Text("Modes")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    ModeSelection()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Theme")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 15){
                    ForEach(ThemeSelection.allCases){
                        theme in Button(action:{
                            selectedTheme = theme //updates Theme
                        }){
                            Text(theme.rawValue.capitalized)
                                .font(.headline)
                                .foregroundColor(selectedTheme == theme ? . white: .black)
                                .padding()
                                .frame(minWidth:100)
                                .background(selectedTheme == theme ? DefaultColors.background: Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                
                    //Include Black & White theme along with colorful palettes
                
                Text("Checklist")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //add customizable list addition
                CheckListView()//displays ChecklistView to the user
                    .padding()
                
                Text("Time Settings")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Pomodoro")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Work Duration")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                customSlider(selectedTime: $selectedWorkTime, minTime:20, maxTime:60, interval: 5)
                
                Text("Short Break Duration")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                customSlider(selectedTime: $selectedBreakTime, minTime:5, maxTime:30, interval: 5)
                
                Text("Stopwatch")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text("Reminder Intervals")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                customSlider(selectedTime: $selectedReminderTime, minTime:20, maxTime: 120, interval: 10)

                Spacer()
            }
        }
        .padding()
        .preferredColorScheme(Mode ? .dark : .light)
        .background(selectedTheme.colors.first ?? DefaultColors.background)
        .frame(width: 400, height: 600)
    }
}//bottom of SettingsView

//enum for ThemeSelection
enum ThemeSelection: String, CaseIterable, Identifiable{
    case def
    case bw
    case benny
    
    var id: String{self.rawValue}
    
    //different color themes and access DefaultColors in Utils
    var colors:[Color]{
        switch self{
        case .def:
            return [DefaultColors.main_color_1, DefaultColors.main_color_2, DefaultColors.main_color_3, DefaultColors.background, DefaultColors.shadow_1, DefaultColors.shadow_2]
        case .bw:
            return[Color(hex: "343434"), Color(hex: "FFFFFF"), Color(hex: "000000"), Color(hex: "C0C0C0")]
        case .benny:
            return [Color(hex: "094F98"), Color(hex: "4B90CD"), Color(hex: "B8D2F0"), Color(hex: "F3A3B5"), Color(hex: "19171A"), Color(hex: "F0CC34")]
            
        }
    }
    
}

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

struct CheckListView: View{
    @State private var newTaskTitle: String = ""
    @State private var taskList: [TaskItem] = []
    
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
                Spacer()
                Text("\(Int(maxTime)) min")
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
