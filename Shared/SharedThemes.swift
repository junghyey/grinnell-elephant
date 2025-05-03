//
//  ColorSettings.swift for Widget
//  Elephant
//
//  Created by 陸卉媫 on 4/15/25.
//

// resources: https://medium.com/@katramesh91/effortless-theming-in-swiftui-mastering-multiple-themes-and-best-practices-061113be6d3d

import SwiftUI

#if canImport(WidgetKit)
import WidgetKit
#endif

// data structure for each theme
protocol WidgetThemeProtocol {
    var main_color_1: Color {get}
    var main_color_2: Color {get}
    var main_color_3: Color {get}
    var background: Color {get}
    var shadow_1: Color {get}
    var shadow_2: Color {get}
}

//used for shared AppStorage between the app and widget
struct SharedThemes {
    static let curr = "curTheme"
    static let displayMode = "Mode"
}

//same theme colors but for the widget!
struct WidgetThemeColors {
    
    static let defaultElephant = DefaultElephantWT()
    static let blackWhite = BlackWhiteWT()
    static let benny = BennyWT()
    
    //grabbed from ColorSettings for MacApp
    static func getTheme(for theme: String) -> WidgetThemeProtocol {
        switch theme {
        case "blackWhite":
            return blackWhite
        case "benny":
            return benny
        default:
            return defaultElephant
        }
    }

}

//defines theme protocol for current themes
struct DefaultElephantWT : WidgetThemeProtocol {
    var main_color_1: Color {return Color(red: 255/255, green: 201/255, blue: 185/255)}
    var main_color_2: Color {return Color(red: 193/255, green: 150/255, blue: 109/255)}
    var main_color_3: Color {return Color(red: 76/255, green: 149/255, blue: 108/255)}
    var background: Color {return Color(red: 254/255, green: 254/255, blue: 227/255)}
    var shadow_1: Color {return Color(red: 254/255, green: 254/255, blue: 227/255)}
    var shadow_2: Color {return Color(red: 44/255, green: 110/255, blue: 73/255)}
}
    
    struct BlackWhiteWT : WidgetThemeProtocol{
        var main_color_1: Color { return Color(red: 221/255, green: 221/255, blue: 221/255) }
        var main_color_2: Color { return Color(red: 188/255, green: 184/255, blue: 177/255) }
        var main_color_3: Color { return Color(red: 138/255, green: 129/255, blue: 124/255) }
        var background: Color    { return Color(red: 244/255, green: 243/255, blue: 238/255) }
        var shadow_1: Color      { return Color(red: 70/255, green: 63/255, blue: 58/255) }
        var shadow_2: Color      { return Color.black }
    }
        
        struct BennyWT : WidgetThemeProtocol {
            var main_color_1: Color {return Color(hex: "4B90CD")}
            var main_color_2: Color {return Color(hex: "094F98")}
            var main_color_3: Color {return Color(hex: "B8D2F0")}
            var background: Color {return Color(hex: "F3A3B5")}
            var shadow_1: Color {return Color(hex: "19171A")}
            var shadow_2: Color {return Color(hex: "F0CC34")}
        }
        
        //fucntion for appropriate widget text color given Mode settings (light/dark)
        func widgetTextColor(for background: Color, Mode: Bool) -> Color {
            if Mode{ //if dark mode is on
                return .white
            } else { //if light mode is on
                return .black
            }
        }
        
    

//converts Color to hex colors for custom themes
extension Color{
    init(hex: String){
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF)/255.0
        let green = Double((rgb >> 8) & 0xFF)/255.0
        let blue = Double(rgb & 0xFF)/255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
