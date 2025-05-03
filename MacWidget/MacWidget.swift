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

import Elephant

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

// Edits for widget UI
struct MacWidgetEntryView : View {
    //Accesses shared theme settings from the MacApp for the widget
    @AppStorage(SharedThemes.displayMode) private var Mode: Bool = false //global mode setting
    @AppStorage(SharedThemes.curr) private var curTheme : String = "defaultElephant"
    
    var entry: Provider.Entry
    
    //uses Widget theme protocol to grab current theme for the widget
    private var themeColors: WidgetThemeProtocol {
        return WidgetThemeColors.getTheme(for: curTheme)
    }
    
    //gets appropriate text color for widget given the mode and theme background
    //grabbed from MacApp ColorSettings
    private func widgetTC(for background: Color) -> Color{
        if Mode{
            if curTheme == "benny" && background == themeColors.background{
                return .black //places darker text for light theme backgrounds
            }
            return .white
        } else {
            if curTheme == "benny" && background == themeColors.main_color_2{
                return .white // special case for benny blue background
            }
            return .black
        }
    }

    var body: some View {
        ZStack {
            themeColors.background
                .ignoresSafeArea()
            
            VStack {
                
                // Header HStack
                HStack{
                    Text("🐘🧳")
                        .font(.headline)

                    Text("Elephant: A Wellness Trunk")
                        .font(.headline)
                        .foregroundColor(widgetTC(for: themeColors.background))
                    
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
                        .fill(themeColors.main_color_1)
                        .overlay(
                            VStack{
                                // Avatar first
                                Image(entry.configuration.currentAvatar)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(alignment: .center)
                                
                                // timer buttons and indicators
                                Button(action: {
                                    // TODO: add stopwatch or timer
                                }) {
                                    Text("Start \(entry.configuration.timer)")
                                        .foregroundColor(widgetTC(for: themeColors.main_color_1))
                                        .padding(6)
                                        .background(themeColors.main_color_3)
                                        .cornerRadius(10)
                                }
                                
                                // time left or encouraging phrase
                                Text(entry.configuration.timeLeft)
                                    .foregroundColor(widgetTC(for: themeColors.main_color_1))
                            } // first frame - inner
                                .padding(8)
                        ) // first frame - outer
                        .frame(alignment: .top)
                    
                    // Frame 2 - Checklist(s) & Token(s)
                    // ChatGPT utilized from line 120-132 to help clean up format
                    RoundedRectangle(cornerRadius: 20)
                        .fill(themeColors.main_color_1)
                        .overlay(
                            HStack{
                                // TODO: probably make checklist scrollable (this tiny vstack = scroll)
                                VStack (alignment: .leading) {
                                    Text("Checklist")
                                        .font(.title)
                                        .foregroundColor(widgetTC(for: themeColors.main_color_1))
                                    
                                    // TODO: replace with chosen list
                                    Text("[] task 1, \n[] task 2, \n[] task 3")
                                        .frame(alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(widgetTC(for: themeColors.main_color_1))
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
                                            .foregroundColor(widgetTC(for: themeColors.main_color_2))
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
                .containerBackground(.clear, for: .widget) // can change widget background color here
        }
    }
}
