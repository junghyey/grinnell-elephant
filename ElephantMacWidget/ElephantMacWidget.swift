//
//  ElephantMacWidget.swift
//  ElephantMacWidget
//
//  Created by Medhashree Adhikari on 4/15/25.
//

/**
 References:
 https://youtu.be/jucm6e9M6LA?si=TkMWXPY481b8FCKu - main explaination starts at 12:15
 */

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    // dummy data for what widget will look like
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "🐘")
    }

    // how widget looks in the moment - what is seen in gallery
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        // array of entries - data
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            // TODO probably adjust this loop
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
    // TODO: checklist, tokens, collectible avatar
}

// Main app view
struct ElephantMacWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            HStack {
                Text("Time:")
                Text(entry.date, style: .time)
            }

            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}

struct ElephantMacWidget: Widget {
    let kind: String = "ElephantMacWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(macOS 14.0, *) {
                ElephantMacWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ElephantMacWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct ElephantMacWidget_Previews: PreviewProvider {
    static var previews: some View {
        ElephantMacWidgetEntryView(entry: SimpleEntry(date: Date(), emoji: "🐘")).previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
