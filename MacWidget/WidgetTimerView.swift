//
//  WidgetTimerView.swift
//  Elephant
//
//  Created by 陸卉媫 on 5/6/25.
//

import SwiftUI
import AppIntents
import WidgetKit

struct WidgetTimerView: View {
    let timerValues = UserDefaults(suiteName: "group.elephant.widget")
    @State private var remainingMins: Int = 1
    
    var body: some View {
        VStack{
            Text("\(remainingMins)")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(DefaultColors.background)
            Button(intent: RefreshTimerIntent()) {
                Text("Refresh")
            }
        }
        .onAppear {
            updateRemainingMins()
        }
    }
    private func updateRemainingMins() {
            let remainingTime = timerValues?.integer(forKey: "remainingTime") ?? 60
            remainingMins = (remainingTime / 60) + 1
        }
}
