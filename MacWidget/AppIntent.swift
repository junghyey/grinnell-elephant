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

    // An example configurable parameter.
    @Parameter(title: "Current Avatar", default: "🐘")
    var currentAvatar: String
    
    @Parameter(title: "Tokens", default: 0)
    var tokens: Int
}
