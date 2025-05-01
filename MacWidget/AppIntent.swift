//
//  AppIntent.swift
//  MacWidget
//
//  Created by Medhashree Adhikari on 4/17/25.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }
    
    // Avatar configurable parameter
    @Parameter(title: "Current Avatar", default: "mammal-elephant")
    var currentAvatar: String
    
    // Token amount configurable parameter
    @Parameter(title: "Tokens", default: 0)
    var tokens: Int
    
    // Selected timer configurable parameter
    @Parameter(title: "Timer", default: "Stopwatch")
    var timer: String
    
    // Time left configurable parameter
    // TODO: this is where the time left will be input (check figma if confused) the type needs to be converted so date appears when type is string
    @Parameter(title: "Time Left", default: "You got this ♡")
    var timeLeft: String
    
    // TODO: make a parameter that selects the popup checklist
}
