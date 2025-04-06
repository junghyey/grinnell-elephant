//
//  TaskModel.swift
//  Elephant
//
//  Created by Pruneda Turcios, Gabriela (Gabby) on 4/5/25.
//

import Foundation

struct TaskItem: Identifiable, Codable{
    let id: UUID
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false){
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
        
    }
}

struct TaskList: Codable{
    var tasks: [TaskItem]
}
