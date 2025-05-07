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
    // @Environment(\.presentationMode) var presentationMode
    @AppStorage("curAvatar") private var curAvatar = "mammal-elephant"
    @AppStorage("timerMode") private var timerMode = "pomodoro"

    var body: some View {
        VStack{
            HStack {
                Spacer()
                // home button, taken from ManualView
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "house.fill")
                        .font(.title2)
                        .foregroundColor(themeManager.curTheme.main_color_3)
                        .accessibilityIdentifier("homeButton")
                        .allowsHitTesting(true)
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
            }
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
