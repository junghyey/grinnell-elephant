//
//  PomodoroView.swift
//  Elephant
//
//  Created by Pruneda Turcios, Gabriela, modified by Candice Lu

import SwiftUI

struct PomodoroView: View{
    @EnvironmentObject var themeManager: ThemeManager
    
    // pomodoro break time variables
    @AppStorage("workDuration") private var selectedWorkTime = 25
    @AppStorage("shortBreakTime") private var shortBreakTime = 5
    @AppStorage("longBreakTime") private var longBreakTime = 15

    
    // whether timer is running
    @State private var isRunning: Bool = false
    // whether timer is paused
    @State private var isPaused: Bool = false
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
            if isBreak {
                isBreak = false
                timerString = formatTime(secs: selectedWorkTime*60)
                remainingTime = Double(selectedWorkTime*60)
            } else {
                isBreak = true
                if breakCount % 4 != 3 {
                    timerString = formatTime(secs: shortBreakTime*60)
                    remainingTime = Double(shortBreakTime*60)
                }   else {
                    timerString = formatTime(secs: longBreakTime*60)
                    remainingTime = Double(longBreakTime*60)
                }
            }
            // startNewCycle()
        }
    }
    
    // resets timer and starts a new cycle
    // Developed under assistance of ChatGPT
    func startNewCycle() {
        // if it's not break: start a timer for work
        if !isBreak {
//            isBreak = false
            timerString = formatTime(secs: selectedWorkTime*60)
            remainingTime = Double(selectedWorkTime*60)
        } else {
            // if break: start a timer for break and increment break
//            isBreak = true
            breakCount += 1
            // long break if three breaks have passed
            if breakCount % 4 != 3 {
                timerString = formatTime(secs: shortBreakTime*60)
                remainingTime = Double(shortBreakTime*60)
            }   else {
                timerString = formatTime(secs: longBreakTime*60)
                remainingTime = Double(longBreakTime*60)
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
                // start button:
                // if timer is already running, do nothing
                // if timer not running:
                    // if paused: resume
                    // if not paused:
                        // if we just finished a break cycle: reset to work interval and start new cycle
                        // if we just finished a work cycle: reset to break interval
                ElephantButton(
                    buttonText: "Start",
                    action: {
                        // only do something if it's not already running
                        if !isRunning {
                            if !isPaused {
                                startNewCycle()
                            }
                            isRunning = true
                        }
                    },
                    color: themeManager.curTheme.main_color_2)
                ElephantButton(
                    buttonText: "Reset",
                    // resets remaining time to selected work time
                    action: {
                        isRunning = false
                        elapsedTime = 0.0
                        breakCount = 0
                        isBreak = false
                        remainingTime = Double(selectedWorkTime*60)
                        timerString = formatTime(secs: selectedWorkTime * 60)
                    },
                    color: themeManager.curTheme.main_color_2)
                ElephantButton(
                    buttonText: "Pause",
                    action: {
                        let now = Date()
                        // store how long the timer has ran so we can resume later
                        elapsedTime += now.timeIntervalSince(startTime)
                        isRunning = false
                        isPaused = true
                    },
                    color: themeManager.curTheme.main_color_2)
                // strings for clarity and testing purpose
            }
            // testing!
//            ElephantText(displayText: "break count: \(breakCount)")
//            ElephantText(displayText: "is break?: \(isBreak)")
        }
        .environmentObject(themeManager)
        .padding(10)
        .accessibilityIdentifier("pomodoroView")
        .background(themeManager.curTheme.background)
    }
}

#Preview {
    let themeManager = ThemeManager()
    PomodoroView()
        .environmentObject(themeManager)
}
