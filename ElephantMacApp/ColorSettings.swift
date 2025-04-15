//
//  ColorSettings.swift
//  Elephant
//
//  Created by 陸卉媫 on 4/15/25.
//

// resources: https://medium.com/@katramesh91/effortless-theming-in-swiftui-mastering-multiple-themes-and-best-practices-061113be6d3d

import SwiftUI

//struct ColorPalette {
//    var main_color_1: Color
//    var main_color_2: Color
//    var main_color_3: Color
//    var background_color: Color
//    var shadow_1: Color
//    var shadow_2: Color
//}


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
    
    var curTheme: ThemeProtocol {
            switch curThemeKey {
            case "blackWhite":
                return BlackWhite()
            default:
                return DefaultElephant()
            }
        }
        
    func setTheme(named name: String) {
        curThemeKey = name
    }
}

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

//enum PaletteType: String, CaseIterable {
//    case defaultElephant
//    case blackWhite
//    
//    var curPalette: ColorPalette {
//        switch self {
//        case .defaultElephant:
//            return ColorPalette(
//                main_color_1: Color(red: 255/255, green: 201/255, blue: 185/255),
//                main_color_2: Color(red: 193/255, green: 150/255, blue: 109/255),
//                main_color_3: Color(red: 76/255, green: 149/255, blue: 108/255),
//                background: Color(red: 254/255, green: 254/255, blue: 227/255),
//                shadow_1: Color(red: 254/255, green: 254/255, blue: 227/255),
//                shadow_2: Color(red: 44/255, green: 110/255, blue: 73/255)
//            )
//        case .blackWhite:
//            return ColorPalette(
//                main_color_1: Color(red: 224/255, green: 175/255, blue: 160/255),
//                main_color_2: Color(red: 188/255, green: 184/255, blue: 177/255),
//                main_color_3: Color(red: 138/255, green: 129/255, blue: 124/255),
//                background: Color(red: 244/255, green: 243/255, blue: 238/255),
//                shadow_1: Color(red: 70/255, green: 63/255, blue: 58/255),
//                shadow_2: Color(red: 0/255, green: 0/255, blue: 0/255)
//            )
//        }
//    }
//}

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

