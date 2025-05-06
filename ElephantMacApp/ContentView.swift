//
//  ContentView.swift
//  Elephant
//
//  Description: App's homepage that appears once app is launched.
//
//  Author(s): Medhashree (main editor), Candice (creator)
//
//  The following pages are linked: Manual, Settings, Collectibles Shop, and widget Timer selection
//

/** References:
 https://developer.apple.com/documentation/swiftui/button -  Buttons
 https://developer.apple.com/documentation/swiftui/picker - Picker
 */

import SwiftUI

// Homepage
struct ContentView: View {
    @State private var isPressed = false
    @EnvironmentObject var themeManager: ThemeManager // theme manager
    // @AppStorage("mode") private var Mode: Bool = false //global mode setting

    // timer mode options
    enum modes: String, CaseIterable, Identifiable {
        case stopwatch, pomodoro
        var id: Self { self }
    }

    @State private var currentMode: modes = .stopwatch // preset for timer mode

    var body: some View {
        NavigationStack{
            ZStack{
                //                (Mode ? Color.black : Color.white)//Background color
                //                    .edgesIgnoringSafeArea(.all)
                //                    .accessibilityIdentifier("homePage") // identifier for homepage
                // homepage structure
                VStack{
                    // structure the settings and manual page buttons
                    // put this HStack in general file to access from other pages
                    HStack{
                        // Button to settings page
                        NavigationLink(destination: SettingsView()) {
                            Text("⛭")
                                .font(.system(size: 25).weight(.bold))
                                .frame(width: 40, height: 40, alignment: .center)
                                .background(themeManager.curTheme.main_color_2)
                                .clipShape(Circle())
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .background(themeManager.curTheme.main_color_1)
                        .accessibilityIdentifier("settingsPage")
                        
                        // Button to manual page
                        NavigationLink(destination: ManualView()) {
                            Text("?")
                                .font(.system(size: 25).weight(.bold))
                                .frame(width: 40, height: 40, alignment: .center)
                                .background(themeManager.curTheme.main_color_2)
                                .clipShape(Circle())
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(alignment: .trailing)
                        .background(themeManager.curTheme.main_color_1)
                        .accessibilityIdentifier("manualPage")
                        
                    } // manual and settings page button area
                    .padding([.top, .trailing], 15)

                    // Main title
                    Text("Elephant")
                        .font(.system(.largeTitle, design: .rounded).weight(.bold))
                        .kerning(2) // keep space between letters for better readability
                        .accessibilityIdentifier("mainPage")
                    // Subheadline following Elephant
                    Text("A Wellness Trunk")
                        .font(.system(.headline, design: .rounded).weight(.semibold))
                        .kerning(1)
                    // Subheadline following "A Wellness Trunk"
                    Text("♡🐘♡")
                        .font(.system(.headline, design: .rounded).weight(.semibold))
                    // App logo placeholder
                    Image("realistic_elephant")
                        .resizable()
                        .scaledToFit()
                    // Title area and button separator
                    Text("⸻⸻⸻")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                
                    // TIMERS MODE MENU
                    NavigationLink(destination: TimerView()) {
                        Text("Timer")
                            .font(.system(.title2, design: .rounded).weight(.bold))
                            .frame(width: 200, height: 60)
                            .background(themeManager.curTheme.main_color_2)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .scaleEffect(isPressed ? 0.9 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(themeManager.curTheme.main_color_1)
                    .accessibilityIdentifier("timerPage")
                    .frame(alignment: .center)
                    
                    Picker("Mode", selection: $currentMode) {
                        Text("Stopwatch").tag(modes.stopwatch)
                        Text("Pomodoro").tag(modes.pomodoro)
                    }
                    .pickerStyle(.menu)
                    .frame(width: 150, alignment: .center) // keeps the "mode: currentmode" padded and centered
                    .frame(width: 200, height: 60) // size of outer frame
                    .font(.system(.title2, design: .rounded).weight(.bold))
                    .background(themeManager.curTheme.main_color_2)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                        
                    // COLLECTIBLES SHOP BUTTON
                    NavigationLink(destination: ShopMainPageView().environmentObject(themeManager)) {
                        Text("Collectibles Shop")
                            .font(.system(.title2, design: .rounded).weight(.bold))
                            .frame(width: 200, height: 60)
                            .background(themeManager.curTheme.main_color_2)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .scaleEffect(isPressed ? 0.9 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    }  // NavigationLink - set up and adjustments
                    .buttonStyle(PlainButtonStyle())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(themeManager.curTheme.main_color_1)
                    .accessibilityIdentifier("shopPage")
                    
                    // CHECKLISTS SHOP BUTTON
                    NavigationLink(destination: ChecklistMainPageView().environmentObject(themeManager)) {
                        Text("Checklists")
                            .font(.system(.title2, design: .rounded).weight(.bold))
                            .frame(width: 200, height: 60)
                            .background(themeManager.curTheme.main_color_2)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .scaleEffect(isPressed ? 0.9 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    }  // NavigationLink - set up and adjustments
                    .buttonStyle(PlainButtonStyle())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(themeManager.curTheme.main_color_1)
                    .padding(.bottom, 25)
                    .accessibilityIdentifier("checklistsPageLink")
                    
                } // VStack - structures whole page
                .background(themeManager.curTheme.main_color_1)
            } // ZStack
        } // NavigationStack
        .environmentObject(themeManager) // set this on NavStack to stay clean
        .frame(width: 500, height: 500)
        .preferredColorScheme(themeManager.Mode ? .dark : .light)
        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.main_color_1))
    } // main body
} // ContentView Struct

#Preview {
    ContentView()
}
