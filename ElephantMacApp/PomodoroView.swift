//
//  PomodoroView.swift
//  Elephant
//
//  Created by Pruneda Turcios, Gabriela
//

import SwiftUI

struct PomodoroView: View{
    @EnvironmentObject var themeManager: ThemeManager
    
    @State private var selectedWorkTime: Double = 25 //default for pomodoro
    @State private var shortBreakTime: Double = 5 //default for pomodoro
    @State private var longBreakTime: Double = 15//default for pomodoro
    
    var body: some View{
        ScrollView{
            //to-do: pomodoro implementation
        }
        .background(themeManager.curTheme.background)
    }
}

