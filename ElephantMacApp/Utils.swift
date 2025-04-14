//
//  Utils.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/31/25.
//      Contains reuseable components for the app, including text, confirmation dialogue, buttons, etc

import SwiftUI

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

// Elephant confirmation dialogue
// Parameters:
//      title: string, text displayed on button
//      buttonImage: string, name of image displayed on button
//      action: function, what happens once you click on button
//      color: color of button background

struct ElephantConfirmationDialogue: View {
    let title: String
    let message: String
    let confirmButtonText: String
    let onConfirm: () -> Void
    let onCancel: () -> Void
    
    var body: some View {
        VStack{
            Image("mammal-elephant")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            Text(message)
                .font(.title3)
            HStack{
                ElephantButton(
                    buttonText: "Cancel",
                    action: onConfirm,
                    color: DefaultColors.background
                )
                ElephantButton(
                    buttonText: "Confirm",
                    action: onConfirm,
                    color: DefaultColors.main_color_1
                )
            }
        }
        .padding()
        .frame(width: 300, height: 200, alignment: .center)
        .cornerRadius(20)
        .background(DefaultColors.background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(DefaultColors.shadow_2, lineWidth: 5)
        )
        .shadow(color: .black.opacity(0.3), radius: 20)
    }
}

// Elephant buttons
// Parameters:
//      buttonText: string, text displayed on button
//      buttonImage: string, name of image displayed on button
//      action: function, what happens once you click on button
//      color: color of button background

struct ElephantButton: View {
    let buttonText: String
    let buttonImage: String = "mammal-elephant"
    let action: () -> Void
    let color: Color
    
    var body: some View{
        Button (action: action) {
            Text("\(buttonText)")
                .fontWeight(.bold)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(color, lineWidth: 2)
                )
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(DefaultColors.shadow_1, lineWidth: 2)
//                )
        }
        .buttonStyle(PlainButtonStyle())
        .background(DefaultColors.main_color_1)
    }
}

// Elephant title
// Parameters:
//      displayText: string, title text displayed

struct ElephantTitle: View {
    let displayText: String
    
    var body: some View {
        Text("\(displayText)")
            .font(.title)
            .fontWeight(.bold)
            .padding()
            .frame(alignment: .center)
    }
}

// Elephant text
// Parameters:
//      displayText: string, default text displayed

struct ElephantText: View {
    let displayText: String
    
    var body: some View {
        Text("\(displayText)")
            .font(.headline)
            .padding(10)
    }
}
