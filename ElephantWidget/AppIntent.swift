//
//  AppIntent.swift
//  ElephantWidget
//
//  Created by 陸卉媫 on 2/16/25.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "hi")
    var favoriteEmoji: String
}


