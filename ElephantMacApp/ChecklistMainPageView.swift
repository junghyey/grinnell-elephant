//
//  ChecklistMainPageView.swift
//  Elephant
//
//  Created by Medhashree Adhikari on 5/3/25.
//

import SwiftUI

struct ChecklistMainPageView: View {
    @State private var isPressed = false
    @EnvironmentObject var themeManager: ThemeManager // theme manager
    // @AppStorage("mode") private var Mode: Bool = false //global mode setting
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
                    // to go back to the homepage
                    NavigationLink(destination: ContentView()) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(themeManager.curTheme.main_color_2)
                            .frame(width: 50, height: 30)
                            .overlay(
                                Text("Back").foregroundColor(themeManager.curTheme.background)
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .font(.system(.title3, design: .rounded).weight(.semibold))
                    .padding([.top, .leading], 10)
                    .frame(maxWidth: .infinity, alignment: .leading) // right align
                    .background(themeManager.curTheme.main_color_1)
                    .accessibilityIdentifier("checklistsMainPage_back")
                    
                    Text("Checklists")
                        .kerning(2) // keep space between letters for better readability
                        .font(.system(.largeTitle, design: .rounded).weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading) // right align
                        .padding(.leading, 15)
                    
                    // TODO: replace with a default checklist (changeable name, clickable, and example activities)
                    Text("- Checklist 1")
                        .font(.system(.title3, design: .rounded).weight(.semibold))
                        .frame(maxWidth: .infinity, alignment: .leading) // right align
                        .padding(.leading, 15)
                    
                    // TODO: if new checklist is made, show below already existing lists (so here)
                    
                    // TODO: add the create a new list button here
                    Button(action: {
                        // TODO: add new list function
                    }) {
                        Text("New Checklist")
                            .font(.system(.title3, design: .rounded).weight(.medium))
                            .foregroundStyle(.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // right align
                    .padding(.leading, 15)
                    .background(themeManager.curTheme.main_color_1)
                } // page VStack
            } // ZStack
        } // ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(themeManager.Mode ? .dark : .light)
        .background(themeManager.curTheme.main_color_1)
        .accessibilityIdentifier("checklistsMainPage")
    } // main body
} // ChecklistsPageView struct
