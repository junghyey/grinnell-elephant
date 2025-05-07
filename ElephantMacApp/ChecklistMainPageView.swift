//
//  ChecklistMainPageView.swift
//  Elephant
//
//  Created by Medhashree Adhikari on 5/3/25.
//
import SwiftUI

struct ChecklistMainPageView: View {
    @State private var isPressed = false
    @State private var showingChecklist = false
    @State private var curChecklistId: UUID? = nil
    @State private var selectedChecklist: Checklist? = nil
    @State private var showingNewList = false
    @State private var newListName = ""
    @State private var editingListId: UUID? = nil
    @State private var editListName = ""
    @State private var showDeletion = false
    @State private var deleteListId: UUID? = nil
    
    @State private var displayedTasks: [TaskItem] = []
    
    @EnvironmentObject var storage: TaskListStorage
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        ScrollView {
            VStack {
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "house.fill")
                        .font(.title2)
                        .foregroundColor(themeManager.curTheme.main_color_3)
                        .accessibilityIdentifier("homeButton")
                        .allowsHitTesting(true)
                        //nopadding
                }//NavigationLink
                .buttonStyle(PlainButtonStyle())
                .font(.system(.title3, design: .rounded).weight(.semibold))
                .padding([.top, .leading], 10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .accessibilityIdentifier("checklistsMainPage_back")
                
                Text("Checklists")
                    .kerning(2)
                    .font(.system(.largeTitle, design: .rounded).weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                
                // Display all existing checklists
                ForEach(storage.checklists) { checklist in
                    checklistButton(for: checklist)
                        .onTapGesture {
                            selectedChecklist = checklist
                        }
                }
                
                // New list button
                ElephantButton(
                    buttonText: "New Checklist",
                    buttonImage: "plus.circle.fill",
                    action: {
                        showingNewList = true
                    },
                    color: themeManager.curTheme.main_color_2
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.top, 10)
            }
        }
        .sheet(item: $selectedChecklist){ checklist in
            NavigationView {
                CheckListView(
                    checklistId: checklist.id,
                    checklistName: checklist.name,
                    initialTasks: checklist.tasks
                )
                .environmentObject(storage)
                .environmentObject(themeManager)
            }
            .frame(width: 500, height: 500)
        }
        .alert("Create New Checklist", isPresented: $showingNewList) {
            TextField("Checklist Name", text: $newListName)
            
            Button("Cancel", role: .cancel) {
                newListName = ""
            }
            
            Button("Create") {
                let trimmedName = newListName.trimmingCharacters(in: .whitespaces)
                if !trimmedName.isEmpty {
                    storage.addChecklist(name: trimmedName)
                    newListName = ""
                }
            }
        }
        .alert("Rename Checklist", isPresented: Binding(get: {
            editingListId != nil
        }, set: {
            if !$0 { editingListId = nil }
        })) {
            TextField("New name", text: $editListName)
            
            Button("Cancel", role: .cancel) {
                editingListId = nil
                editListName = ""
            }
            
            Button("Rename") {
                if let id = editingListId {
                    let trimmedName = editListName.trimmingCharacters(in: .whitespaces)
                    if !trimmedName.isEmpty {
                        storage.renameChecklist(id: id, newName: trimmedName)
                        editingListId = nil
                        editListName = ""
                    }
                }
            }
        }
        .alert("Delete Checklist", isPresented: $showDeletion) {
            Button("Cancel", role: .cancel) {
                deleteListId = nil
            }
            
            Button("Delete", role: .destructive) {
                if let id = deleteListId {
                    storage.removeChecklist(id: id)
                    deleteListId = nil
                }
            }
        } message: {
            Text("Are you sure you want to delete this checklist? This action cannot be undone :(")
        }
        .padding()
        .preferredColorScheme(themeManager.Mode ? .dark : .light)
        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.background))
        .background(themeManager.curTheme.main_color_1)
        .frame(width: 500, height: 500)
        .accessibilityIdentifier("checklistsMainPage")
    }
    
    private func checklistButton(for checklist: Checklist) -> some View {
        HStack {
            
                HStack {
                    Text(checklist.name)
                        .font(.system(.title3, design: .rounded).weight(.medium))
                        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.background))
                    
                    Spacer()
                    
                    Text("\(checklist.tasks.filter { $0.isCompleted }.count)/\(checklist.tasks.count)")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.background).opacity(0.7))
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(themeManager.curTheme.main_color_2)
                )
            
            
            // Edit button
            ElephantButton(
                buttonText: "Edit",
                buttonImage: "pencil",
                action: {
                    editingListId = checklist.id
                    editListName = checklist.name
                },
                color: themeManager.curTheme.main_color_3)
            
            // Delete button
            ElephantButton(
                buttonText: "Delete",
                buttonImage: "trash",
                action: {
                    deleteListId = checklist.id
                    showDeletion = true
                },
                color: themeManager.curTheme.main_color_2)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
    }
}

// CheckListView
struct CheckListView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var storage: TaskListStorage
    @EnvironmentObject var themeManager: ThemeManager
    
    let checklistId: UUID
    @State private var checklistName: String
    @State private var isEditing: Bool = false
    @State private var changedName: String = ""
    @State private var newTask: String = ""
    

    @State private var localTasks: [TaskItem]
    @State private var hasChanged: Bool = false
    
    // Pass initial tasks through init to avoid fetching during view creation
    init(checklistId: UUID, checklistName: String, initialTasks: [TaskItem]) {
        self.checklistId = checklistId
        self._checklistName = State(initialValue: checklistName)
        self._localTasks = State(initialValue: initialTasks)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Checklist title with edit functionality
            HStack {
                if isEditing {
                    TextField("Checklist Name", text: $changedName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .padding(.horizontal)
                    
                    ElephantButton(
                        buttonText: "Save",
                        action: saveChecklistName,
                        color: themeManager.curTheme.main_color_2
                    )
                    .padding(.trailing)
                } else {
                    Text(checklistName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            taskList
            
            Spacer()
            
            actionButtons
        }
        .padding()
        .cornerRadius(12)
        .padding()
    }
    
    private var taskList: some View {
        List {
            if localTasks.isEmpty {
                Text("No tasks yet!")
                    .foregroundColor(themeManager.curTheme.main_color_2)
                    .padding(10)
                    .listRowBackground(themeManager.curTheme.background)
            } else {
                ForEach(localTasks) { task in
                    taskRow(for: task)
                }
                .onDelete { indexSet in
                    localTasks.remove(atOffsets: indexSet)
                    hasChanged = true
                }
            }
            
            // Add new task row
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
    
    // Extract task row to its own function for better organization
    private func taskRow(for task: TaskItem) -> some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                .foregroundColor(task.isCompleted ? themeManager.curTheme.main_color_2 : themeManager.curTheme.main_color_3)
                .onTapGesture {
                    if let index = localTasks.firstIndex(where: { $0.id == task.id }) {
                        localTasks[index].isCompleted.toggle()
                        hasChanged = true
                    }
                    //toggleTask(task)
                }
            
            Text(task.title)
                .strikethrough(task.isCompleted)
                .foregroundColor(task.isCompleted ? themeManager.curTheme.main_color_2 : themeManager.curTheme.main_color_3)
        }
    }
    
    private var actionButtons: some View {
        HStack(spacing: 20) {
            ElephantButton(
                buttonText: "Cancel",
                action: { dismiss() },
                color: themeManager.curTheme.main_color_2
            )
            
            ElephantButton(
                buttonText: "Save",
                action: saveChanges,
                color: themeManager.curTheme.main_color_1
            )
        }
        .padding(.bottom)
    }
    
    // Extract save logic to a dedicated function
    private func saveChanges() {
        //let incompleteTasks = localTasks.filter{$0.isCompleted}
        // Only save if changes were made to reduce unnecessary operations
        if hasChanged{
            storage.updateTasks(for: checklistId, tasks: localTasks)
        }
        
        // Save name change if needed
        if !changedName.isEmpty && checklistName != changedName {
            storage.renameChecklist(id: checklistId, newName: checklistName)
        }
        
        dismiss()
    }
    
    private func addNewTask() {
        let trim = newTask.trimmingCharacters(in: .whitespaces)
        guard !trim.isEmpty else { return }
        
        let newItem = TaskItem(title: trim)
        localTasks.append(newItem)
        hasChanged = true
        
        // Use main thread for UI updates
        DispatchQueue.main.async {
            self.newTask = ""
        }
    }
    
    private func saveChecklistName() {
        let trimmedName = changedName.trimmingCharacters(in: .whitespaces)
        if !trimmedName.isEmpty {
            checklistName = trimmedName
            storage.renameChecklist(id: checklistId, newName: trimmedName)
            hasChanged = true
        }
        isEditing = false
    }
}

