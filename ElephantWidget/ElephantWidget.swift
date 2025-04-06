//
//  ElephantWidget.swift
//  ElephantWidget
//
//  Created by 陸卉媫 on 2/16/25.
//

import WidgetKit
import SwiftUI
import AppIntents

struct DummyIntent: AppIntent {
    static var title: LocalizedStringResource = "Dumb"
    func perform() async throws -> some IntentResult {
        .result()
    }
}

struct Provider: AppIntentTimelineProvider {
    typealias Intent = DummyIntent
    typealias Entry = SimpleEntry
    
    static var recommendedWidgets: [IntentRecommendation<DummyIntent>] {
        [
            IntentRecommendation(intent: DummyIntent(), description: "Default Stopwatch")
        ]
    }
    
    // when widget is in static state
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), isRunning: false, startTime: Date(), elapsedTime: 0.0)
    }

    // displays data at any given time
    func snapshot(for configuration: DummyIntent, in context: Context) async -> SimpleEntry {
        return readCurrentState()
    }
    
    // return entry
    func timeline(for configuration: DummyIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let entry = readCurrentState()
        return Timeline(entries: [entry], policy: .never)
    }
    
    // reads data from UserDefaults
    func readCurrentState() -> SimpleEntry {
            let defaults = UserDefaults(suiteName: "group.com.yourname.stopwatch")!
            let isRunning = defaults.bool(forKey: "isRunning")
            let startTime = defaults.object(forKey: "startTime") as? Date ?? Date()
            let elapsedTime = defaults.double(forKey: "elapsedTime")
        return SimpleEntry(date: Date(), isRunning: isRunning, startTime: startTime, elapsedTime: elapsedTime)
        }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let isRunning: Bool
    let startTime: Date
    let elapsedTime: Double
}

struct ElephantWidgetEntryView : View {
    var entry: Provider.Entry

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

struct ElephantWidget: Widget {
    let kind: String = "ElephantWidget"

    var body: some WidgetConfiguration {
        AppConfiguration(kind: kind, provider: Provider()) { entry in
            ElephantWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

//extension ConfigurationAppIntent {
//    fileprivate static var smiley: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "😀"
//        return intent
//    }
//    
//    fileprivate static var starEyes: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "🤩"
//        return intent
//    }
//}

#Preview(as: .systemSmall) {
    ElephantWidget()
} timeline: {
    // SimpleEntry(date: .now, configuration: .smiley)
    // SimpleEntry(date: .now, configuration: .starEyes)
}
