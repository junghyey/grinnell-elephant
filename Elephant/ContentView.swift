//
//  ContentView.swift
//  Elephant
//
//  Created by 陸卉媫 on 2/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    @AppStorage("mode") private var Mode: Bool = false //global mode setting
    @State private var currentMode = "Stopwatch"
    
    let modes = ["Pomodoro", "Stopwatch"]
    
    var body: some View {
            NavigationStack{
            ZStack{
                (Mode ? Color.black : Color.white)//Background color
                    .edgesIgnoringSafeArea(.all)
                
                // homepage structure
                VStack{
                    // structure the settings and manual page buttons
                    // put this HStack in general file to access from other pages
                    HStack{
                        NavigationLink(destination: SettingsView()) {
                            Text("⛭")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 45, height: 45, alignment: .center)
                                .background(DefaultColors.background)
                                .clipShape(Circle())
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .background(DefaultColors.main_color_1)
                        .accessibilityIdentifier("settingsPage")
                        
                        NavigationLink(destination: ManualView()) {
                            Text("?")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 45, height: 45, alignment: .center)
                                .background(DefaultColors.background)
                                .clipShape(Circle())
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(alignment: .trailing)
                        .background(DefaultColors.main_color_1)
                        .accessibilityIdentifier("manualPage")

                    }
                    .padding(.top, 15)
                    .padding(.trailing, 15)

                    Text("Elephant")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .kerning(2)
                    Text("A Wellness Trunk")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .kerning(1)
                    Text("♡🐘♡")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Image("realistic_elephant")
                        .resizable()
                        .scaledToFit()
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
                    
                    // STOPWATCH
                    Button(action: {
                        // TODO: connect with widget
                    }) {
                        Text("Stopwatch")
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundColor(.black)
                            .frame(width: 200, height: 60)
                    }                            .buttonStyle(PlainButtonStyle()).background(DefaultColors.background)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .cornerRadius(15)
                        .scaleEffect(isPressed ? 0.9 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        .accessibilityIdentifier("stopwatchButton")
                    
                    // POMODORO
                    Button(action: {
                        // TODO: connect with widget
                    }) {
                        Text("Pomodoro")
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundColor(.black)
                            .frame(width: 200, height: 60)
                    }
                    .buttonStyle(PlainButtonStyle()).background(DefaultColors.background)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .cornerRadius(15)
                        .scaleEffect(isPressed ? 0.9 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        .accessibilityIdentifier("pomodoroButton")
                    
                    NavigationLink(destination: ShopMainPageView()) {
                            Text("Collectibles Shop")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .foregroundColor(.black)
                                .frame(width: 200, height: 60)
                                .background(DefaultColors.background)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .cornerRadius(10)
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(DefaultColors.main_color_1)
                        .padding(.bottom, 25)
                        .accessibilityIdentifier("shopPage")
                }
                .background(DefaultColors.main_color_1)
            }
        }
        .frame(width: 500, height: 500)
        .preferredColorScheme(Mode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
