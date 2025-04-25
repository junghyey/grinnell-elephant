//
//  ColorSettings.swift
//  Elephant
//
//  Created by 陸卉媫 on 4/15/25.
//

// resources: https://medium.com/@katramesh91/effortless-theming-in-swiftui-mastering-multiple-themes-and-best-practices-061113be6d3d

import SwiftUI

// data structure for each theme
protocol ThemeProtocol {
    var main_color_1: Color {get}
    var main_color_2: Color {get}
    var main_color_3: Color {get}
    var background: Color {get}
    var shadow_1: Color {get}
    var shadow_2: Color {get}
}

class ThemeManager: ObservableObject {
    @AppStorage("curTheme") private var curThemeKey: String = "defaultElephant" {
            didSet {
                objectWillChange.send()
            }
        }
    
    // takes the string name of theme protocol and return the correct settings
    var curTheme: ThemeProtocol {
            switch curThemeKey {
                case "blackWhite":
                    return BlackWhite()
                case "benny":
                    return Benny()
                default:
                    return DefaultElephant()
            }
        }
        
    // function to set global theme
    func setTheme(named name: String) {
        curThemeKey = name
    }
}

// color themes
struct DefaultElephant: ThemeProtocol {
    var main_color_1: Color {return Color(red: 255/255, green: 201/255, blue: 185/255)}
    var main_color_2: Color {return Color(red: 193/255, green: 150/255, blue: 109/255)}
    var main_color_3: Color {return Color(red: 76/255, green: 149/255, blue: 108/255)}
    var background: Color {return Color(red: 254/255, green: 254/255, blue: 227/255)}
    var shadow_1: Color {return Color(red: 254/255, green: 254/255, blue: 227/255)}
    var shadow_2: Color {return Color(red: 44/255, green: 110/255, blue: 73/255)}
}

struct BlackWhite: ThemeProtocol {
    var main_color_1: Color { return Color(red: 221/255, green: 221/255, blue: 221/255) }
    var main_color_2: Color { return Color(red: 188/255, green: 184/255, blue: 177/255) }
    var main_color_3: Color { return Color(red: 138/255, green: 129/255, blue: 124/255) }
    var background: Color    { return Color(red: 244/255, green: 243/255, blue: 238/255) }
    var shadow_1: Color      { return Color(red: 70/255, green: 63/255, blue: 58/255) }
    var shadow_2: Color      { return Color.black }
}

struct Benny: ThemeProtocol {
    var main_color_1: Color {return Color(hex: "4B90CD")}
    var main_color_2: Color {return Color(hex: "094F98")}
    var main_color_3: Color {return Color(hex: "B8D2F0")}
    var background: Color {return Color(hex: "F3A3B5")}
    var shadow_1: Color {return Color(hex: "19171A")}
    var shadow_2: Color {return Color(hex: "F0CC34")}
}

// default color palette
struct DefaultColors {
    static let main_color_1 = Color(red: 255/255, green: 201/255, blue: 185/255)
    static let main_color_2 = Color(red: 193/255, green: 150/255, blue: 109/255)
    static let main_color_3 = Color(red: 76/255, green: 149/255, blue: 108/255)
    static let background = Color(red: 254/255, green: 254/255, blue: 227/255)
    static let shadow_1 = Color(red: 116/255, green: 79/255, blue: 42/255)
    static let shadow_2 = Color(red: 44/255, green: 110/255, blue: 73/255)
}

//converts Color to hexcode colors
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

