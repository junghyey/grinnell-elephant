//
//  ElephantApp.swift
//  Elephant
//
//  Created by 陸卉媫 on 2/16/25.
//

import SwiftUI

@main
struct ElephantApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            SettingsView()
            ShopMainPageView()
        }
        .windowResizability(.contentSize)
        .defaultSize(width: 400, height: 600)
    }
}
