//
//  ElephantMacApp.swift
//  Elephant
//
//  Created by 陸卉媫 on 4/14/25.
//

import SwiftUI

@main
struct ElephantMacApp: App {
    @StateObject private var taskListStorage = TaskListStorage()
    @StateObject var themeManager = ThemeManager()

    init() {
        NotificationView.shared.requestNotificationPermission()
       }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskListStorage)//defines storage for task list upon app build
                .environmentObject(themeManager)//sets settings mode and theme background upon app build
        }
        .windowResizability(.contentSize)
        .defaultSize(width: 500, height: 500)
    }
}
