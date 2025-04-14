//
//  TaskListStorage.swift
//  Elephant: A Wellness Trunk
//
//  Created by Pruneda Turcios, Gabriela (Gabby) on 4/6/25.
//
import SwiftUI
import Foundation

//TaskListStorage stores tasks objects to file TaskLists.json
class TaskListStorage: ObservableObject{
    private let filename = "TaskLists.json"
    
    @Published var taskList = TaskList(tasks: []){ //saves current task list
        didSet{
            saveTasks()//updates tasks
        }
    }
    
    init(){
        loadTasks() //loads tasks for user view
    }
    
    private func getFile() -> URL? { //retrieves the TaskLists.json file and creates a direct path to append new tasks
        guard let direct = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{
            return nil
        }
        return direct.appendingPathComponent(filename) //returns direct path to file
    }
    
    func loadTasks(){ //shows task list to the user in settings
        guard let file = getFile() else {return} //exits if the file is not accesed
        
        do{
            let data = try Data(contentsOf: file)
            let decodedList = try JSONDecoder().decode(TaskList.self, from: data)
            taskList = decodedList
        } catch {
            print("Error loading tasks, default list shown")
        }
    }
    
    //saves new tasks to the taskList encoding through the defined path
    func saveTasks(){
        guard let file = getFile() else {return} //exits if the file is not accesed
        
        do{
            let data = try JSONEncoder().encode(taskList)
            try data.write(to: file)
        }catch{
            print("Error: failed to save tasks")
        }
    }

  //updates a new task to the taskList
    func addTask(title: String){
        let newTask = TaskItem(title: title)
        taskList.tasks.append(newTask)
        saveTasks()
    }

  //marks task as completed once the user selects
    func markTastCompleted(task: TaskItem){
        if let ix = taskList.tasks.firstIndex(where: {$0.id == task.id}){
            taskList.tasks[ix].isCompleted.toggle()
            saveTasks()
        }
    }

  //removes task from checklist once it's been completed
    func removeTask(task: TaskItem){
            taskList.tasks.removeAll{ $0.id == task.id }
            saveTasks()
    }
}
