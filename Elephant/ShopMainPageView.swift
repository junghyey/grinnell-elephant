//
//  ShopMainPageView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//
import SwiftUI

struct ShopMainPageView: View {
    
    @AppStorage("displayItem") var displayItem: String = "realistic_elephant" // default elephant on display
    
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack {
                    Text("Shop")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .padding(.top, 20)
                    
                    Text("Mammal Pack")
                        .font(.headline)
                        .padding(.leading, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal){
                        ZStack{
                            
                            // Todo:
                                // add pictures to each green square!
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color.white)
                                .frame(width: 500, height: 140)
                            
                            HStack{
                                NavigationLink(destination: ItemView())
                                {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color.green)
                                        .frame(width: 100, height: 100)
                                }
                                NavigationLink(destination: ItemView())
                                {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color.green)
                                        .frame(width: 100, height: 100)
                                }
                                NavigationLink(destination: ItemView())
                                {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color.green)
                                        .frame(width: 100, height: 100)
                                }
                                NavigationLink(destination: ItemView())
                                {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color.green)
                                        .frame(width: 100, height: 100)
                                }
                                
                            }
                        }
                    }
                    .padding(10)
                    .accessibilityIdentifier("mammalScrollView")
                    
                    Text("Marine Pack")
                        .font(.headline)
                        .padding(.leading, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color.white)
                                .frame(width: 500, height: 140)
                            
                            HStack{
                                Button(action: {
                                    UserDefaults.standard.set("mammal-cow",forKey: "displayItem" )}) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color.green)
                                        .frame(width: 100, height: 100)
                                }
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.green)
                                    .frame(width: 100, height: 100)
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.green)
                                    .frame(width: 100, height: 100)
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.green)
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                    .padding(10)
                    .accessibilityIdentifier("marineScrollView")
                    
                }
            }
        }
        .background(Color.yellow)
        .frame(width: 400, height: 600, alignment: .leading)
    }
}

#Preview {
    ShopMainPageView()
}
