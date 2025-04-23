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
    @AppStorage("mode") private var Mode: Bool = false //global mode setting
    // @State private var currentMode = "Stopwatch" // preset for timer mode - if picker
    // theme manager
    @EnvironmentObject var themeManager: ThemeManager
    
    // let modes = ["Pomodoro", "Stopwatch"] // timer mode options
    
    var body: some View {
            NavigationStack{
            ZStack{
                (Mode ? Color.black : Color.white)//Background color
                    .edgesIgnoringSafeArea(.all)
                    .accessibilityIdentifier("homePage") // identifier for homepage
                // homepage structure
                VStack{
                    // structure the settings and manual page buttons
                    // put this HStack in general file to access from other pages
                    HStack{
                        // Button to settings page
                        NavigationLink(destination: SettingsView()) {
                            Text("⛭")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 45, height: 45, alignment: .center)
                                .background(themeManager.curTheme.background)
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
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 45, height: 45, alignment: .center)
                                .background(themeManager.curTheme.background)
                                .clipShape(Circle())
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(alignment: .trailing)
                        .background(themeManager.curTheme.main_color_1)
                        .accessibilityIdentifier("manualPage")

                    } // manual and settings page button area
                    .padding(.top, 15)
                    .padding(.trailing, 15)
                    
                    // Main title
                    Text("Elephant")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .kerning(2)
                        .accessibilityIdentifier("mainPage")
                    // Subheadline following Elephant
                    Text("A Wellness Trunk")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .kerning(1)
                    // Subheadline following "A Wellness Trunk"
                    Text("♡🐘♡")
                        .font(.headline)
                        .fontWeight(.semibold)
                    // App logo placeholder
                    Image("realistic_elephant")
                        .resizable()
                        .scaledToFit()
                    // Title area and button separator
                    Text("⸻⸻⸻")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)

                    
                    // possible dropdown menu idea
//                    Picker("Selected Mode", selection: $currentMode) {
//                        ForEach(modes, id: \.self) { mode in
//                            Text(mode)
//                        }
//                    }
//                    .pickerStyle(MenuPickerStyle())
//                    .font(.caption)
//                    .fontWeight(.bold)
//                    .fontDesign(.rounded)
//                    .foregroundColor(.black)
//                    .frame(width: 200, height: 60)
//                    .background(DefaultColors.background)
//                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                    .cornerRadius(10)
                    
                    // STOPWATCH BUTTON
                    Button(action: {
                        // TODO: connect with widget
                    }) {
                        Text("Stopwatch")
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundColor(.black)
                            .frame(width: 200, height: 60)
                    }  // Stopwatch Button - set up and adjustments
                    .buttonStyle(PlainButtonStyle()).background(themeManager.curTheme.main_color_2)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .cornerRadius(15)
                    .scaleEffect(isPressed ? 0.9 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    .accessibilityIdentifier("stopwatchButton")
                    
                    // POMODORO BUTTON
                    Button(action: {
                        // TODO: connect with widget
                    }) {
                        Text("Pomodoro")
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundColor(.black)
                            .frame(width: 200, height: 60)
                    }  // Pomodoro Button - set up and adjustments
                    .buttonStyle(PlainButtonStyle()).background(themeManager.curTheme.main_color_2)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .cornerRadius(15)
                    .scaleEffect(isPressed ? 0.9 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    .accessibilityIdentifier("pomodoroButton")
                    
                    // COLLECTIBLES SHOP BUTTON
                    NavigationLink(destination: ShopMainPageView().environmentObject(themeManager)) {
                            Text("Collectibles Shop")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundColor(.black)
                                .frame(width: 200, height: 60)
                                .background(themeManager.curTheme.main_color_2)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .cornerRadius(10)
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    }  // NavigationLink - set up and adjustments
                    .buttonStyle(PlainButtonStyle())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(themeManager.curTheme.main_color_1)
                    .padding(.bottom, 25)
                    .accessibilityIdentifier("shopPage")
                    
                } // VStack - structures whole page
                .background(themeManager.curTheme.main_color_1)
            } // ZStack
        } // NavigationStack
        .frame(width: 500, height: 500)
        .preferredColorScheme(Mode ? .dark : .light)
    } // main body
} // ContentView Struct

#Preview {
    ContentView()
}
