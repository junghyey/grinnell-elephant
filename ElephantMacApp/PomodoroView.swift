//
//  PomodoroView.swift
//  Elephant
//
//  Created by Pruneda Turcios, Gabriela, modified by Candice Lu
//  Not yet working because I can't test it - Candice

import SwiftUI

struct PomodoroView: View{
    @EnvironmentObject var themeManager: ThemeManager
    
    // pomodoro break time variables
    @State private var selectedWorkTime: Int = 25 //default for pomodoro
    @State private var shortBreakTime: Int = 5 //default for pomodoro
    @State private var longBreakTime: Int = 15//default for pomodoro
    
    // whether timer is running
    @State private var isRunning: Bool = false
    // timer start time
    @State private var startTime: Date = Date()
    // how many seconds has passed
    @State private var elapsedTime: Double = 0.0
    // how many seconds is remaining
    @State private var remainingTime: Double = 0.0
    // string to display on timer
    @State private var timerString: String = "00:00:00"
    // timer that updates everysecond and triggers re-render
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // track breaks
    @State private var breakCount: Int = 0
    @State private var isBreak: Bool = false
    
    // use user defaults to ensure generalizability to widget
    let timerValues = UserDefaults(suiteName: "group.elephant.widget")
    
    // returns a formatted string based on how many seconds have passed
    func formatTime(secs: Int) -> String {
        let hours = Int(secs) / 3600
        let minutes = (Int(secs) % 3600) / 60
        let seconds = Int(secs) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    // updates timer as long as timer is running
    func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            timerString = formatTime(secs: Int(remainingTime))
        } else {
            // if timer ends, start new session
            isRunning = false
            startNewCycle()
        }
    }
    
    func startNewCycle() {
        // if it's break
        if isBreak {
            isBreak = false
            timerString = formatTime(secs: selectedWorkTime*60)
            remainingTime = Double(selectedWorkTime*60)
        } else {
            isBreak = true
            breakCount += 1
            // long break if three breaks have passed
            if breakCount % 4 == 0 {
                timerString = formatTime(secs: longBreakTime*60)
                remainingTime = Double(selectedWorkTime*60)
            } else {
                timerString = formatTime(secs: shortBreakTime*60)
                remainingTime = Double(selectedWorkTime*60)
            }
        }
    }
    
    var body: some View{
        ScrollView{
            Text(timerString)
                .font(Font.system(.largeTitle, design: .monospaced))
                .onReceive(timer) { _ in
                                if isRunning {
                                    updateTimer()
                                }
                            }
            HStack{
                ElephantButton(
                    buttonText: "Start",
                    action: {
                        isRunning = true
                        startNewCycle()
                    },
                    color: themeManager.curTheme.main_color_2)
                ElephantButton(
                    buttonText: "Reset",
                    action: {
                        isRunning = false
                        elapsedTime = 0.0
                        breakCount = 0
                        isBreak = false
                        remainingTime = Double(selectedWorkTime*60)
                        timerString = formatTime(secs: 0)
                    },
                    color: themeManager.curTheme.main_color_2)
                ElephantButton(
                    buttonText: "Pause",
                    action: {
                        let now = Date()
                        // store how long the timer has ran so we can resume later
                        elapsedTime += now.timeIntervalSince(startTime)
                        isRunning = false
                    },
                    color: themeManager.curTheme.main_color_2)
            }
        }
        .frame(width: 500, height: 500)
        .padding(10)
        .accessibilityIdentifier("shopMainPageView")
        .background(themeManager.curTheme.background)
    }
}

#Preview {
    PomodoroView()
}
