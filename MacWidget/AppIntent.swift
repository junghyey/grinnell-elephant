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
    @Parameter(title: "Favorite Emoji", default: "default 😃")
    var favoriteEmoji: String
}
