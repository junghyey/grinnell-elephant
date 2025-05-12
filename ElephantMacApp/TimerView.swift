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

    var body: some View {
        VStack{
            HStack {
                Spacer()
                ToHomePageButton() // Button to homepage
                ToSettingsPageButton() // Button to settings page
                ToManualPageButton() // Button to manual page
            }
            .padding([.top, .trailing], 15)

            Spacer()
            Image(curAvatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            if timerMode == "pomodoro"{
                PomodoroView()
            } else {
                StopwatchView()
            }
            ElephantText(displayText: "Current mode: \(timerMode)")
        }
        .environmentObject(themeManager)
        .background(themeManager.curTheme.background)
        .accessibilityIdentifier("timerView")
        .frame(alignment: .center)
    }
    
}

#Preview {
let themeManager = ThemeManager()
    TimerView()
    .environmentObject(themeManager)
}
