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
 ChatGPT - line 115-146
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
        for minuteOffset in 0 ..< 1 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
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

// Edits for widget UI
struct MacWidgetEntryView : View {
    
    @AppStorage("mode") private var Mode: Bool = false //global mode setting

    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color("aqua")
                .ignoresSafeArea()
            
            VStack {
                
                // Header HStack
                HStack{
                    Text("🐘🧳")
                        .font(.headline)

                    Text("Elephant: A Wellness Trunk")
                        .font(.headline)
                    
                    Spacer()
                    
                    // TODO: replace with buttons
                    Text("⛭")
                        .font(.headline)
                    Text("?")
                        .font(.headline)

                } // HStack for widget headers

                
                Spacer()
                
                // Main 2 Frames
                VStack {
                    // Frame 1 - Timer
                    RoundedRectangle(cornerRadius: 20)
                        .fill(DefaultColors.main_color_1)
                        .overlay(
                            VStack{
                                // Avatar first
                                Image(entry.configuration.currentAvatar)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(alignment: .center)
                                StopwatchView()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(alignment: .center)
                                HStack {
                                    Button(intent: StartTimerIntent()) {
                                        Text("Start")
                                    }
                                    Button(intent: ResetTimerIntent()) {
                                        Text("Reset")
                                    }
                                    Button(intent: PauseTimerIntent()) {
                                        Text("Pause")
                                    }
                                    Button(intent: RefreshTimerIntent()) {
                                        Text("Refresh")
                                    }
                                }
                                } // first frame - inner
                        ) // first frame - outer
                        .frame(alignment: .top)
                    
                    // Frame 2 - Checklist(s) & Token(s)
                    // ChatGPT utilized from line 120-132 to help clean up format
                    RoundedRectangle(cornerRadius: 20)
                        .fill(DefaultColors.main_color_1)
                        .overlay(
                            HStack{
                                // TODO: probably make checklist scrollable (this tiny vstack = scroll)
                                VStack (alignment: .leading) {
                                    Text("Checklist")
                                        .font(.title)
                                        .foregroundStyle(.black)
                                    
                                    // TODO: replace with chosen list
                                    Text("[] task 1, \n[] task 2, \n[] task 3")
                                        .frame(alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                } // checklist title and list
                                .padding(.leading, 20)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                // Token
                                Circle()
                                    .fill(Color.orange)
                                    .frame(width: 70, height: 70, alignment: .trailing)
                                    .overlay(
                                        Text("\(entry.configuration.tokens)")
                                            .font(.caption)
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                    )
                            } // side by side token & checklist
                                .padding(.trailing, 20)
                        ) // second frame - outer
                    
                } // VStack - main 2 frames
            } // VStack - vertically align all 3 sections
        } // main ZStack
        .preferredColorScheme(Mode ? .dark : .light)
        
    } // entire view
} // MacWidgetEntryView

struct MacWidget: Widget {
    let kind: String = "MacWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            MacWidgetEntryView(entry: entry)
                .containerBackground(DefaultColors.background, for: .widget) // can change widget background color here
        }
    }
}
