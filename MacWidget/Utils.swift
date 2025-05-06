//
//  Utils.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/31/25.
//      Contains reuseable components for the app:
//          ElephantConfirmationDialogue: confirmation dialogue that pops up when user presses a button (such as for purchasing)
//          ElephantButton: styled button that allows customization and can be used anywhere for any purpose
//          ElephantTitle: title text
//          ElephantText: text

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
            // defaulted to having cancel and confirm options, can be adjusted to have optional parameters if more functionality is needed
            HStack{
                ElephantButton(
                    buttonText: "Cancel",
                    action: onConfirm,
                    color: themeManager.curTheme.background
                )
                ElephantButton(
                    buttonText: "Confirm",
                    action: onConfirm,
                    color: themeManager.curTheme.background
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
    let buttonImage: String?
    let action: () -> Void
    let color: Color?
    let textColor: Color?
    
    init(
        buttonText: String,
        buttonImage: String? = "mammal-elephant",
        action: @escaping () -> Void,
        color: Color? = nil,
        textColor: Color? = nil) {
            self.buttonText = buttonText
            self.buttonImage = buttonImage
            self.textColor = textColor
            self.action = action
            self.color = color
        }
        
    
    var body: some View{
        Button (action: action) {
            Text("\(buttonText)")
                .fontWeight(.bold)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(color ?? themeManager.curTheme.main_color_2, lineWidth: 2)
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(textColor ?? themeManager.curTheme.shadow_1, lineWidth: 2)
                )
        }
        .background(themeManager.curTheme.main_color_2)
        .cornerRadius(20)
        // .foregroundColor(themeManager.textColor(for: themeManager.curTheme.main_color_2))
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
