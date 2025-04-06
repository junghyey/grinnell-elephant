//
//  StopwatchLogic.swift
//  Elephant
//
//  Created by 陸卉媫 on 4/6/25.
//
import SwiftUI

// source:
// https://medium.com/@pwilko/how-not-to-create-stopwatch-in-swift-e0b7ff98880f
// https://stackoverflow.com/questions/71910830/create-a-stopwatch-in-swift-using-timeintervalsince
// https://medium.com/@iOSchandra0/how-to-create-a-stopwatch-in-swift-5-viewcontroller-viewmodel-swiftui-cefa5c5e3d0
// https://developer.apple.com/documentation/widgetkit/appintenttimelineprovider
// https://developer.apple.com/documentation/widgetkit/appintenttimelineprovider/placeholder(in:)
// https://developer.apple.com/documentation/widgetkit/appintenttimelineprovider/snapshot(for:in:)
// https://developer.apple.com/documentation/widgetkit/appintenttimelineprovider/timeline(for:in:)

@available(macOS 15.0, *)
struct StopwatchView: View {
    @AppStorage("isRunning", store: UserDefaults(suiteName: "group.elephant.widget"))
    var isRunning: Bool = false
    
    @AppStorage("startTime", store: UserDefaults(suiteName: "group.elephant.widget"))
    var startTime: Date = Date()
    
    @AppStorage("elapsedTime", store: UserDefaults(suiteName: "group.elephant.widget"))
    var elapsedTime: Double = 0.0
    
    func formatTime(_ time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d.%02d", hours, minutes, seconds)
    }
    
    var body: some View{
        VStack {
            if(isRunning) {
                let now = Date()
                let runningTime = now.timeIntervalSince(startTime) + elapsedTime
                ElephantText(displayText: formatTime(runningTime))
            } else {
                ElephantText(displayText: formatTime(elapsedTime))
            }
            
            HStack{
                ElephantButton(
                    buttonText: "Start",
                    action: {
                        startTime = Date()
                        isRunning = true
                    },
                    color: DefaultColors.main_color_2)
                ElephantButton(
                    buttonText: "Reset",
                    action: {
                        startTime = Date()
                        isRunning = false
                        elapsedTime = 0.0
                    },
                    color: DefaultColors.main_color_2)
                ElephantButton(
                    buttonText: "Pause",
                    action: {
                        let now = Date()
                        elapsedTime += now.timeIntervalSince(startTime)
                        isRunning = false
                    },
                    color: DefaultColors.main_color_2)
            }
        }
    }
}
