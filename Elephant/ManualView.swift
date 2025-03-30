//
//  ManualView.swift
//  Elephant
//
//  Created by Medhashree Adhikari on 3/25/25.
//

import SwiftUI

struct ManualView: View {
    @AppStorage("mode") private var Mode: Bool = false //global mode setting
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Welcome to Elephant: A Wellness Trunk! Are you ready to incorporate wellness tasks to your work routine with us? Let’s get started!")
                    .font(.headline)
                Text("Stopwatch Mode")
                    .font(.headline)
                Text("* Receive wellness reminders at customized time intervals \n *Turn on when you start working and off when you’re done")
                    .font(.subheadline)
                Text("Pomodoro Mode")
                    .font(.headline)
                Text("* Integrate Pomodoro method with wellness tasks \n * Customize the time intervals")
                    .font(.subheadline)
                Text("Earn tokens by completing tasks on checklist that you can exchange for collectibles to customize your widget!")
                    .font(.headline)
            }
            .background(Color.white)
            .padding(10)
        }
        .preferredColorScheme(Mode ? .dark : .light)
        .frame(width: 500, height: 500)
    }
}

#Preview {
    ManualView()
}
