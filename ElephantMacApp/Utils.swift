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
