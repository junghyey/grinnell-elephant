//
//  SettingsView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("colorTheme") var colorTheme: String = "classic" // classic as the default value
    @AppStorage("mode") var mode: String = "pomodoro"
    
    var body: some View {
        ScrollView{
            VStack {
               
                Text("Settings")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                
                Text("Colors")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                // print the saved value
                Text("Current theme: \(colorTheme)")
                    .font(.title3)
                Button("set color to monotone") {
                    UserDefaults.standard.set("monotone", forKey: "colorTheme")
                }
                Button("set color to classic") {
                    UserDefaults.standard.set("classic", forKey: "colorTheme")
                }
                
                Text("Pomodoro settings")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
        .background(Color.yellow)
        .frame(width: 400, height: 600)
    }
}
#Preview {
    SettingsView()
}
