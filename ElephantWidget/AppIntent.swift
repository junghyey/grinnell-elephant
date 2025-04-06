//
//  AppIntent.swift
//  ElephantWidget
//
//  Created by 陸卉媫 on 2/16/25.
//

import WidgetKit
import AppIntents

//enum FavoriteEmoji: String, AppEnum {
//    case smile = "😃"
//    case heart = "❤️"
//    case thumbsUp = "👍"
//    
//    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Emoji"
//
//    static var caseDisplayRepresentations: [FavoriteEmoji: DisplayRepresentation] = [
//        .smile: "Smile",
//        .heart: "Heart",
//        .thumbsUp: "Thumbs Up"
//    ]
//}

//struct ConfigurationAppIntent: WidgetConfigurationIntent {
//    static var title: LocalizedStringResource { "Configuration" }
//    static var description: IntentDescription { "This is an example widget." }
//
//    @Parameter(title: "Favorite Emoji")
//    var favoriteEmoji: FavoriteEmoji
//}

// resources:
// https://developer.apple.com/documentation/appintents/app-intents
// https://developer.apple.com/documentation/appintents/widgetconfigurationintent
// https://www.swiftjectivec.com/snip-create-a-basic-interactive-widget-using-app-intent-button/


struct WidgetConfigurationIntent: AppIntent {
    typealias PerformResult = <#type#>
    typealias SummaryContent = <#type#>
    
    static var title: LocalizedStringResource
    
    
}
struct StartStopwatch: AppIntent {
    static var title: LocalizedStringResource = "Start Stopwatch"
    
    func perform() async throws -> some IntentResult {
        guard let data = UserDefaults(suiteName: "group.elephant.widget") else {
            print("Failed to access stopwatch data from UserDefaults")
            return .result()
        }
        data.set(Date(), forKey: "startTime")
        data.set(true, forKey: "isRunning")
        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}
