//
//  ElephantApp.swift
//  Elephant
//
//  Created by 陸卉媫 on 2/16/25.
//

import SwiftUI

@main
struct ElephantApp: App {
    @StateObject private var taskListStorage = TaskListStorage()
    @StateObject private var settingsModel = SettingsModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskListStorage)//defines storage for task list upon app build
                .environmentObject(settingsModel)//sets settings mode and theme background upon app build
        }
        .windowResizability(.contentSize)
        .defaultSize(width: 500, height: 500)
    }
}
