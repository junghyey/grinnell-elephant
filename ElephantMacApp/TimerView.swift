//
//  TimerView.swift
//  Elephant
//
//  Created by 陸卉媫 on 5/5/25.
//

import Foundation
import SwiftUI

struct TimerView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @AppStorage("curAvatar") private var curAvatar = "mammal-elephant"
    @AppStorage("timerMode") private var timerMode = "pomodoro"
    
    @EnvironmentObject var storage: TaskListStorage //for checklist access
    @EnvironmentObject var tokenLogic: TokenLogic //to modify tokens
    
    //checklist variables
    @State private var selectedChecklist: Checklist? = nil
    @State private var showingChecklist = false
    @State private var selectedTasks: [TaskItem] = []
    @State private var newTask: String = ""
    
    private func addNewTask() {
        let trimmed = newTask.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        
        // Make sure we have a valid checklist to add to
        if let checklist = storage.curChecklist {
            storage.addTask(to: checklist.id, title: trimmed)
            newTask = "" // clear input after adding
        }
    }

    var body: some View {
        VStack{
            HStack {
                Text("Current mode: \(timerMode)")
                    .padding(.leading, 20)
                    .font(.subheadline)
                    .font(.system(size: 10, design: .rounded))
                    .foregroundStyle(themeManager.curTheme.main_color_2)
                Spacer()
                ToHomePageButton() // Button to homepage
                ToSettingsPageButton() // Button to settings page
                ToManualPageButton() // Button to manual page
            }
            .padding([.top, .trailing], 15)

            Image(curAvatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 170)
            
            if timerMode == "pomodoro"{
                PomodoroView()
            } else {
                StopwatchView()
            }
            
            ScrollView{
                VStack(spacing: 15){
                    if storage.checklists.isEmpty  {
                        Text("No checklists available..")
                            .foregroundColor(themeManager.Mode ? themeManager.textColor(for: themeManager.curTheme.background).opacity(0.7) : themeManager.textColor(for: themeManager.curTheme.main_color_1).opacity(0.7))
                            .padding()
                    } else {
                        if let checklist = storage.curChecklist {                            
                            VStack(alignment: .leading, spacing: 10) {
//                                Text("\(checklist.name)")
//                                    .font(.system(.title2, design: .rounded).weight(.bold))
//                                    .foregroundColor(themeManager.Mode ? themeManager.textColor(for: themeManager.curTheme.background) : themeManager.textColor(for: themeManager.curTheme.main_color_1))
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .padding(.leading, 15)
                                ForEach(checklist.tasks.indices, id: \.self) { index in
                                    let task = checklist.tasks[index]
                                    
                                    HStack {
                                        Image(systemName: task.isCompleted
                                              ? "checkmark.square.fill"
                                              : "square")
                                        .foregroundColor(
                                            task.isCompleted
                                            ? themeManager.curTheme.main_color_2
                                            : themeManager.curTheme.main_color_3
                                        )
                                        .onTapGesture {
                                            // Make a mutable copy of tasks
                                            var updatedTasks = checklist.tasks
                                            // Flip the isCompleted boolean
                                            updatedTasks[index].isCompleted.toggle()
                                            // Persist the change back into storage
                                            storage.updateTasks(for: checklist.id,
                                                                tasks: updatedTasks)
                                            // If now completed, give the user a token
                                            if updatedTasks[index].isCompleted {
                                                tokenLogic.addToken()
                                            }
                                        }
                                        Text(task.title)
                                        // Strikethrough if completed
                                            .strikethrough(task.isCompleted)
                                            .foregroundColor(
                                                task.isCompleted
                                                ? themeManager.curTheme.main_color_2
                                                : themeManager.curTheme.main_color_3
                                            )
                                    }
                                }
                                //additional new task row
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundColor(themeManager.curTheme.main_color_1)
                                    TextField("Add new task...", text: $newTask)//, onCommit: addNewTask)// <- new task creation on '+'
                                    //creates new task on enter
                                        .onSubmit {
                                            addNewTask()
                                        }
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.main_color_1))
                                }
                            }
                            .padding(.horizontal, 40)
                        }
                    }
                }
            }
            .padding(.bottom, 20)
        }
        .environmentObject(themeManager)
        .background(themeManager.curTheme.background)
        .accessibilityIdentifier("timerView")
        .frame(alignment: .center)
        .frame(width: 400, height: 500)
        .onAppear{
            if storage.curChecklistId == nil, let firstChecklist = storage.checklists.first {
                storage.curChecklistId = firstChecklist.id
            }
        }
    }
    }
    
//    private func checklistButton(for checklist: Checklist) -> some View {
//            
//        Button(action: {
//            selectedChecklist = checklist
//        }) {
//            VStack {
//                Text(checklist.name) //displays checklist name
//                    .font(.system(.title3, design: .rounded).weight(.medium))
//                    .foregroundColor(themeManager.textColor(for: themeManager.curTheme.main_color_1))
//                
//                Spacer()
//                
//                Text("\(checklist.tasks.filter { $0.isCompleted }.count)/\(checklist.tasks.count)") //displays number of completed tasks/total tasks
//                    .font(.system(.subheadline, design: .rounded))
//                    .foregroundColor(themeManager.textColor(for: themeManager.curTheme.main_color_1).opacity(0.7))
//            }
//            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(themeManager.curTheme.main_color_1))
//            .fixedSize()
//        }
//        .buttonStyle(PlainButtonStyle())
//    }
//    
//}

#Preview {
let themeManager = ThemeManager()
    TimerView()
    .environmentObject(themeManager)
    .environmentObject(TaskListStorage())
    .environmentObject(TokenLogic())
}
