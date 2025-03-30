//
//  ItemView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//


import SwiftUI

struct ItemView: View {
    
    let item: ShopItem
    
    var body: some View {
        
        @State var showConfirmation = false
        
            ScrollView{
                VStack {
                    Text("\(item.name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    ZStack{
                        Circle()
                            .foregroundStyle(Color.white)
                            .frame(width: 350)
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                    Text("Price: \(item.price) tokens")
                        .font(.headline)
                    // make this a button that displays a window for buy when on click, instead of a navlink
                    Button(action: {
                        showConfirmation = true
                    }){
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
                    .buttonStyle(PlainButtonStyle())
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                }
                .confirmationDialog("Do you want to purchase this item?", isPresented: $showConfirmation, titleVisibility: .visible) {
                    Button("Purchase", role: .none) {
                        print("\(item.name) purchased!")
                    }
                    Button("Cancel", role: .cancel) {
                        print("Cancelled")
                    }
                }
            }
            .background(Color.yellow)
            .frame(width: 500, height: 500)
    }
}
#Preview {
    ItemView(item: ShopItem(id: "mammal-lion", name: "Lion", imageName: "mammal-lion", price: 10))
}
