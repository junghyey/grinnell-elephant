//
//  TimerIntents.swift
//  Elephant
//
//  Created by 陸卉媫 on 5/2/25.
//

// resource: https://developer.apple.com/documentation/widgetkit/adding-interactivity-to-widgets-and-live-activities
import WidgetKit
import AppIntents

struct StartTimerIntent: AppIntent {
    static var title: LocalizedStringResource = "Start"

    func perform() async throws -> some IntentResult {
        // get variables
        let timerDefaults = UserDefaults(suiteName: "group.elephant.widget")
        let isRunning = timerDefaults?.bool(forKey: "isRunning") ?? false
        let elapsedTime = timerDefaults?.double(forKey: "elapsedTime") ?? 0.0

        // set variables
        if (isRunning != true) {
            timerDefaults?.set(Date().addingTimeInterval(-elapsedTime), forKey: "startTime")
            timerDefaults?.set(true, forKey: "isRunning")
        }

        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}

struct ResetTimerIntent: AppIntent {
    static var title: LocalizedStringResource = "Reset"

    func formatTime(secs: Int) -> String {
        let hours = Int(secs) / 3600
        let minutes = (Int(secs) % 3600) / 60
        let seconds = Int(secs) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    func perform() async throws -> some IntentResult {
        // get variables
        let timerDefaults = UserDefaults(suiteName: "group.elephant.widget")

        // set variables
        timerDefaults?.set(0.0, forKey: "elapsedTime")
        timerDefaults?.set(false, forKey: "isRunning")
        timerDefaults?.set(formatTime(secs: 0), forKey: "timerString")

        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}

struct PauseTimerIntent: AppIntent {
    static var title: LocalizedStringResource = "Pause"

    func perform() async throws -> some IntentResult {
        // get variables
        let timerDefaults = UserDefaults(suiteName: "group.elephant.widget")
        let isRunning = timerDefaults?.bool(forKey: "isRunning") ?? false
        let elapsedTime = timerDefaults?.double(forKey: "elapsedTime") ?? 0.0
        let startTime = timerDefaults?.object(forKey: "startTime") as? Date ?? Date()
        let now = Date()

        // set variables
        if isRunning {
            // store how long the timer has ran so we can resume later
            timerDefaults?.set(elapsedTime + now.timeIntervalSince(startTime), forKey: "elapsedTime")
            timerDefaults?.set(false, forKey: "isRunning")
        }

        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}

struct RefreshTimerIntent: AppIntent {
    static var title: LocalizedStringResource = "Refresh"

    func perform() async throws -> some IntentResult {
        let timerDefaults = UserDefaults(suiteName: "group.elephant.widget")

        timerDefaults?.set("hi", forKey: "timerString")

        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}
