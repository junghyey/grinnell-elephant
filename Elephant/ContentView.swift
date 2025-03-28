//
//  ContentView.swift
//  Elephant
//
//  Created by 陸卉媫 on 2/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    var body: some View {
        ScrollView{
            // todo:
                // figure out background color
                // figure out how to put other buttons (manual, etc)
                // I don't think we need a button for pomodoro/stopwatch mode since that would just sit in the widgetbar, so i remade the buttons
            NavigationStack{
                VStack{
                    Text("Elephant")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(20)
                    Image("realistic_elephant")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    List{
                        NavigationLink(destination: ShopMainPageView()) {
                            Text("Shop")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .cornerRadius(10)
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.yellow)
                        .padding(.bottom)
                        
                        NavigationLink(destination: SettingsView()) {
                            Text("Settings")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60, alignment: .center)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .cornerRadius(10)
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.yellow)
                        .padding(.bottom)
                        
                        NavigationLink(destination: SettingsView()) {
                            Text("Manual")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60, alignment: .center)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .cornerRadius(10)
                                .scaleEffect(isPressed ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.yellow)
                        .padding(.bottom)                    }
                }
                .background(Color.yellow)
            }
            .frame(width: 400, height: 800)
            .background(Color.yellow)
        }
    }
}



#Preview {
    ContentView()
}
