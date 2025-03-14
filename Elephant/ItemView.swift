//
//  ItemView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//


import SwiftUI

struct ItemView: View {
    var body: some View {
        // get rid of navstack
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
                    // make this a button that displays a window for buy when on click, instead of a navlink
                    NavigationLink(destination: ShopMainPageView()){
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.green)
                            .frame(width: 150, height: 50)
                            .overlay{
                                Text("Buy")
                            }
                        // to add: once user click on buy, show number of tokens they have and ask if they want to buy (options: buy or return)
                        // if return: return to this page
                        // if buy, ask them if they want to change avatar in widget
                            // if change, do a little animation with ribbons and change the buy button to a return to store page button
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
