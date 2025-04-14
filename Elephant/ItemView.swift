//
//  ItemView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//


import SwiftUI

struct ItemView: View {
    
    let item: ShopItem
    @State var showConfirmation = false
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack {
                    HStack {
                        NavigationLink(destination: ShopMainPageView()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(DefaultColors.main_color_2)
                                .frame(width: 50, height: 30)
                                .overlay(
                                    Text("Back").foregroundColor(DefaultColors.background))
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(10)
                        .accessibilityIdentifier("itemButton_back_\(item.imageName)")
                        Text("\(item.name)")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                    }
                    ZStack{
                        Circle()
                            .foregroundStyle(DefaultColors.background)
                            .frame(width: 300)
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 280)
                    }
                    Text("Price: \(item.price) tokens")
                        .font(.headline)
                        .padding(10)
                    // make this a button that displays a window for buy when on click, instead of a navlink
                    Button(action: {
                        showConfirmation = true
                    }){
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(DefaultColors.main_color_2)
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
                    .accessibilityIdentifier("itemButton_price_\(item.imageName)")
                }
            }
            .frame(width: 500, height: 500)
            .padding(10)
            .background(DefaultColors.main_color_1)
            
            if(showConfirmation) {
                ElephantConfirmationDialogue(
                    title: "Purchase?",
                    message: "Purchase this item for \(item.price) tokens?",
                    confirmButtonText: "Yes!",
                    onConfirm: {
                        showConfirmation = false
                    },
                    onCancel: {
                        showConfirmation = false
                    })
                .zIndex(1)
            }
        }.accessibilityIdentifier("itemView_\(item.imageName)")
    }
    
}
#Preview {
    ItemView(item: ShopItem(id: "mammal-lion", name: "Lion", imageName: "mammal-lion", price: 10))
}
