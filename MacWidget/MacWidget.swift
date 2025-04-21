//
//  MacWidget.swift
//  MacWidget
//
//  Created by Medhashree Adhikari on 4/17/25.
//

/**
 References:
 https://youtu.be/jucm6e9M6LA?si=TkMWXPY481b8FCKu - main explaination starts at 12:15
https://www.youtube.com/watch?v=Z_m5d8RS4xU
 */

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct MacWidgetEntryView : View {
    @AppStorage("mode") private var Mode: Bool = false //global mode setting
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text("🐘🧳")
                        .font(.headline)

                    Text("Elephant: A Wellness Trunk")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // TODO: replace with buttons
                    Text("⛭")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("?")
                        .font(.headline)
                        .foregroundColor(.white)

                } // HStack for widget headers

                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange)
                        .overlay(Text(entry.configuration.currentAvatar))
                        .frame(alignment: .top)

                    VStack {
                        Text("🐘")
                            .frame(height: 50)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .overlay(Text(entry.date, style: .time))
                            .frame(height: 120, alignment: .bottom)
                        
                        Text("You got this ♡")
                            .font(.headline)

                    }
                } // first frame
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .overlay(Text("Task Checklist"))
//                        .frame(alignment: .top)

                    HStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .overlay(Text("[] task 1, \n task 2, \n task 3"))
                            .frame(alignment: .leading)
                        
                        Circle()
                            .fill(Color.yellow)
                            .overlay(Text("\(entry.configuration.tokens)"))
                            .frame(alignment: .trailing)
                    }
                } // second frame
//                .frame(height: 100)
//                Text("time:")
                Text(entry.date, style: .time)
            } // VStack - vertically align all sections
        } // main ZStack
        .preferredColorScheme(Mode ? .dark : .light)
    }
}

struct MacWidget: Widget {
    let kind: String = "MacWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            MacWidgetEntryView(entry: entry)
                .containerBackground(.pink.gradient, for: .widget) // change widget background color here
        }
    }
}

