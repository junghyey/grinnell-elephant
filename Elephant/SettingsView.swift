//
//  SettingsView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//

import SwiftUI

struct SettingsView: View {
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
