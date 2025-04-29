//
//  Utils.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/31/25.
//      Contains reuseable components for the app, including text, confirmation dialogue, buttons, etc

import SwiftUI

// Elephant confirmation dialogue
// Parameters:
//      title: string, text displayed on button
//      buttonImage: string, name of image displayed on button
//      action: function, what happens once you click on button
//      color: color of button background

struct ElephantConfirmationDialogue: View {
    @EnvironmentObject var themeManager: ThemeManager
    
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
                    color: themeManager.curTheme.background
                   // textColor: themeManager.textColor(for: themeManager.curTheme.background)
                )
                ElephantButton(
                    buttonText: "Confirm",
                    action: onConfirm,
                    color: themeManager.curTheme.background
                    //textColor: themeManager.textColor(for: themeManager.curTheme.background)
                )
            }
        }
        .padding()
        .frame(width: 300, height: 200, alignment: .center)
        .cornerRadius(20)
        .background(themeManager.curTheme.background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(themeManager.curTheme.shadow_2, lineWidth: 5)
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
//      textColor: color of button text

struct ElephantButton: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    let buttonText: String
    let buttonImage: String = "mammal-elephant"
    let action: () -> Void
    let color: Color
//    let textColor: Color
    
    var body: some View{
        Button (action: action) {
            Text("\(buttonText)")
                .fontWeight(.bold)
//                .foregroundColor(textColor)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(color, lineWidth: 2)
                )
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(themeManager.curTheme.shadow_1, lineWidth: 2)
//                )
        }
        .background(themeManager.curTheme.main_color_2)
        .cornerRadius(20)
        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.main_color_2))
        .buttonBorderShape(.capsule)
        .buttonStyle(PlainButtonStyle())
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
