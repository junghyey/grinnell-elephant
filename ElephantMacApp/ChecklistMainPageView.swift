//
//  ChecklistMainPageView.swift
//  Elephant
//
//  Created by Medhashree Adhikari on 5/3/25.
//

import SwiftUI

struct ChecklistMainPageView: View {
    @State private var isPressed = false
    @State private var showingChecklist = false //default set to false until user opens the checklist
    @State private var curChecklistId: UUID? = nil
    @State private var showingNewList = false
    @State private var newListName = ""
    @State private var editingListId: UUID? = nil
    @State private var editListName = ""
    @State private var showDeletion = false
    @State private var deleteListId: UUID? = nil
    
    @EnvironmentObject var storage: TaskListStorage //local storage for checklist
    @EnvironmentObject var themeManager: ThemeManager // theme manager
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
                    // to go back to the homepage
                    NavigationLink(destination: ContentView()) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(themeManager.curTheme.main_color_2)
                            .frame(width: 50, height: 30)
                            .overlay(
                                Text("Back").foregroundColor(themeManager.curTheme.background)
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .font(.system(.title3, design: .rounded).weight(.semibold))
                    .padding([.top, .leading], 10)
                    .frame(maxWidth: .infinity, alignment: .leading) // right align
                    .background(themeManager.curTheme.main_color_1)
                    .accessibilityIdentifier("checklistsMainPage_back")
                    
                    Text("Checklists")
                        .kerning(2) // keep space between letters for better readability
                        .font(.system(.largeTitle, design: .rounded).weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading) // right align
                        .padding(.leading, 15)
                    
                   //Displays all existing checklists
                    ForEach(storage.checklists){ checklist in
                        checklistButton(for: checklist)
                        
                    }
                    
                    //new list button
                    Button(action: {
                        showingNewList = true
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(themeManager.curTheme.main_color_2)
                            Text("New Checklist")
                                .font(.system(.title3, design: .rounded).weight(.medium))
                                .foregroundColor(themeManager.curTheme.main_color_2)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(themeManager.curTheme.background))

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.top, 10)
                    //checklistSection
                    
                    // TODO: if new checklist is made, show below already existing lists (so here)
                    
                    // TODO: add the create a new list button here
//                    Button(action: {
//                        // TODO: add new list function
//                    }) {
//                        Text("New Checklist")
//                            .font(.system(.title3, design: .rounded).weight(.medium))
//                            .foregroundStyle(.black)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading) // right align
//                    .padding(.leading, 15)
//                    .background(themeManager.curTheme.main_color_1)
                } // page VStack
            } // ZStack
        } // ScrollView / TODO: edit pop up for multiple checklist views CONTINUE FROM HERE
        .sheet(isPresented: $showingChecklist) { //custom list pop-up
            NavigationView {
                CheckListView() //calls on CheckList view to appear on user command
                    .environmentObject(storage)
            }
            .frame(width: 500, height: 500) //frames pop-up sheet
        }
        .padding()
        .preferredColorScheme(themeManager.Mode ? .dark : .light) //based on user selection
        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.background))
        .background(themeManager.curTheme.main_color_1) //based on user selection
        .frame(width: 500, height: 500) //frames scroll view
        .accessibilityIdentifier("checklistsMainPage")
    } // main body
    
    //Button for add new custom checklist
    private var checklistSection: some View {
        VStack(alignment: .leading) {
            ElephantButton(buttonText: "New list", action: {
                showingChecklist = true
            }, color: themeManager.curTheme.main_color_2)
        }
    }
} // ChecklistsPageView struct

//ChecklistView for custom checklist
struct CheckListView: View {

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
                    .foregroundColor(themeManager.textColor(for: themeManager.curTheme.main_color_1))
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
        .preferredColorScheme(themeManager.Mode ? .dark : .light) //based on user selection
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


