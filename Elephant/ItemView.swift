//
//  ItemView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//


import SwiftUI

struct ItemView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Text("Elephant")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    ZStack{
                        Circle()
                            .foregroundStyle(Color.white)
                            .frame(width: 350)
                        Image("realistic_elephant")
                            .resizable()
                            .scaledToFit()
                    }
                    Text("Price: 10 tokens")
                        .font(.headline)
                    NavigationLink(destination: ShopMainPageView()){
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.green)
                            .frame(width: 150, height: 50)
                            .overlay{
                                Text("Buy")
                            }
                    }
                }
            }
            .background(Color.yellow)
            .frame(width: 400, height: 600)
        }
    }
}
#Preview {
    ItemView()
}
