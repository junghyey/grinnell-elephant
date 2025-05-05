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
    @AppStorage(SharedThemes.displayMode, store: SharedThemes.shared) private var Mode: Bool = false //global mode setting
    @AppStorage(SharedThemes.curr, store: SharedThemes.shared) private var curTheme : String = "defaultElephant"
    
    func placeholder(in context: Context) -> SimpleEntry {
        let currentTheme = SharedThemes.shared.string(forKey: SharedThemes.curr) ?? "defaultElephant"
        let currentMode = SharedThemes.shared.bool(forKey: SharedThemes.displayMode)
        
        return SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), themeKey: currentTheme, mode: currentMode)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        let currentTheme = SharedThemes.shared.string(forKey: SharedThemes.curr) ?? "defaultElephant"
        let currentMode = SharedThemes.shared.bool(forKey: SharedThemes.displayMode)
        
        return SimpleEntry(date: Date(), configuration: configuration, themeKey: currentTheme, mode: currentMode)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        let currentTheme = SharedThemes.shared.string(forKey: SharedThemes.curr) ?? "defaultElephant"
        let currentMode = SharedThemes.shared.bool(forKey: SharedThemes.displayMode)
        
        print("Widget timeline refresh - Current Theme: \(currentTheme), Mode: \(currentMode)") //testing print statement

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, themeKey: currentTheme, mode: currentMode)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .after(Date().addingTimeInterval(60))) //checks every minute
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let themeKey: String
    let mode: Bool
    
    init(date: Date, configuration: ConfigurationAppIntent, themeKey: String, mode: Bool) {
        self.date = date
        self.configuration = configuration
        self.themeKey = themeKey
        self.mode = mode
    }
}

// Edits for widget UI
struct MacWidgetEntryView : View {
    
    var entry: Provider.Entry
    
    //uses Widget theme protocol to grab current theme for the widget
    private var themeColors: WidgetThemeProtocol {
        print("Widget using theme: \(entry.themeKey)")
        return WidgetThemeColors.getTheme(for: entry.themeKey)
    }
    
    private var mode: Bool{
        print("Widget using mode: \(entry.mode ? "dark" : "light" )")
        return entry.mode
    }
    
    //gets appropriate text color for widget given the mode and theme background
    //grabbed from MacApp ColorSettings
    private func widgetTC(for background: Color) -> Color{
        if mode{
            if entry.themeKey == "benny" && background == themeColors.background{
                return .black //places darker text for light theme backgrounds
            }
            return .white
        } else {
            if entry.themeKey == "benny" && background == themeColors.main_color_2{
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
        .preferredColorScheme(mode ? .dark : .light)
        .onAppear{
            WidgetCenter.shared.reloadAllTimelines()//refreshes when the view appears
        }
        
    } // entire view
} // MacWidgetEntryView

struct MacWidget: Widget {
    let kind: String = "MacWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            MacWidgetEntryView(entry: entry)
                .containerBackground(.clear, for: .widget) // can change widget background color here
        }
        
        .configurationDisplayName("Elephant Widget")
        .description("Keep track of your tasks and time")
        .supportedFamilies([.systemMedium])
    }
}
