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
    @AppStorage("mode")  private var Mode: Bool = false //default light mode, toggle for dark mode
    
    @State private var selectedWorkTime: Double = 25 //default for pomodoro
    @State private var selectedBreakTime: Double = 5 //default for pomodoro
    @State private var selectedReminderTime: Double = 30 //default for stopwatch
    
    var body: some View {
        ScrollView{
            VStack {
                // Todo:
                    // figure out what are the settings and the buttons and things
                    // figure out where to store the info being changed, maybe a json with all the configurations
                    // figure out how to update settings when user clicks a configuration buttons
                Spacer()
                
                /*
                 Button{
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
                 */
                
                
               
                (Mode ? Color.black : Color.white)
                    .edgesIgnoringSafeArea(.all)
                    
                VStack(alignment: .leading, spacing: 20){
                    Text("Modes")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    ModeSelection()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Theme")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                    //Include Black & White theme along with colorful palettes
                
                Text("Checklist")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //add customizable list addition
                
                Text("Time Settings")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Pomodoro")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Work Duration")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                customSlider(selectedTime: $selectedWorkTime, minTime:20, maxTime:60, interval: 5)
                
                Text("Short Break Duration")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                customSlider(selectedTime: $selectedBreakTime, minTime:5, maxTime:30, interval: 5)
                
                Text("Stopwatch")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text("Reminder Intervals")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                customSlider(selectedTime: $selectedReminderTime, minTime:20, maxTime: 120, interval: 10)
            }
        }
        .preferredColorScheme(Mode ? .dark : .light)
        .frame(width: 400, height: 600)
    }
}

struct ModeSelection: View{
    @AppStorage("mode") private var Mode: Bool = false //sets default mode
    
    var body: some View{
        Button(action:{
            Mode.toggle() //to select dark mode
        }){
            HStack{
                Image(systemName: Mode ? "moon.fill": "sun.max.fill")
                    .foregroundColor(Mode ? .yellow : .blue)
                Text(Mode ? "Dark Mode" : "Light Mode")
                    .foregroundColor(Mode ? .white : .black)
                    .fontWeight(.medium)
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .background(RoundedRectangle(cornerRadius: 10).fill(Mode ? Color.gray.opacity(0.3) : Color.gray.opacity(0.1)))
            
        }
    }
}

struct customSlider: View{ //Custom slider struct
    @Binding var selectedTime: Double
    let minTime: Double
    let maxTime: Double
    let interval: Double
    
    var body: some View{
        VStack{
            Slider(value: $selectedTime, in: minTime...maxTime, step: interval)
                .accentColor(.black)
                .padding()
            
            HStack{
                Text("\(Int(minTime)) min")
                Spacer()
                Text("\(Int(maxTime)) min")
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
