//
//  ItemView.swift
//  Elephant
//
//  Created by 陸卉媫 on 4/14/25.
//
//## File Description: This file defines the item view. The view contains name and image of the chosen collectible, and a purchase button that will react differently depending on whether user has purchased the item and remaining tokens.
//
//## Components:
//- ItemView: A reusable SwiftUI template that generates a item purchase page when clicked. It is accessible through clicking on the item listings on the main shop page.

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    let item: ShopItem
    @State var showConfirmation = false
    @State var showNotEnoughTokens = false
    @State var showUserAlreadyHave = false
    @State var showPurchaseConfirmation = false
    
    var body: some View {
        var purchasedAvatars = UserDefaults.standard.stringArray(forKey: "purchasedAvatars")
        var tokenNum: Int = UserDefaults.standard.integer(forKey: "tokenNum")
        ZStack{
            ScrollView{
                VStack {
                    HStack {
                        NavigationLink(destination: ShopMainPageView()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(themeManager.curTheme.main_color_2)
                                .frame(width: 50, height: 30)
                                .overlay(
                                    Text("Back").foregroundColor(themeManager.curTheme.background))
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(10)
                        .accessibilityIdentifier("itemButton_back_\(item.id)")
                        Spacer()
                        Text("\(item.name)")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .padding()
                        Spacer()
                        TokenDisplay()
                        ToMyAvatarsButton()
                        ToHomePageButton() // Button to homepage
                        ToSettingsPageButton() // Button to settings page
                        ToManualPageButton() // Button to manual page
                    }
                    ZStack{
                        Circle()
                            .foregroundStyle(themeManager.curTheme.background)
                            .frame(width: 300)
                        Image(item.id)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 280)
                    }
                    Text("Price: \(item.price) tokens")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding(10)
                    Button(action: {
                        // if enough tokens show confirmation, otherwise show not enough tokens
                        if (purchasedAvatars!.contains(item.id)) {
                            showUserAlreadyHave = true
                        } else {
                            if (tokenNum >= item.price) {
                                showConfirmation = true
                            } else {
                                showNotEnoughTokens = true
                            }
                        }                        
                    }){
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(themeManager.curTheme.main_color_2)
                            .frame(width: 150, height: 50)
                            .overlay{
                                Text("Buy")
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    .accessibilityIdentifier("itemButton_price_\(item.id)")
                }
            }
            .padding(10)
            .frame(width: 500, height: 500)
            .background(themeManager.curTheme.background)
            .preferredColorScheme(themeManager.Mode ? .dark : .light)
            
            if(showConfirmation) {
                ElephantConfirmationDialogue(
                    title: "Purchase?",
                    message: "Purchase this item for \(item.price) tokens?",
                    confirmButtonText: "Yes!",
                    onConfirm: {
                        showConfirmation = false
                        // update purchased avatars
                        purchasedAvatars!.append(item.id)
                        UserDefaults.standard.set(purchasedAvatars, forKey: "purchasedAvatars")
                        // update token
                        tokenNum -= item.price
                        UserDefaults.standard.set(tokenNum, forKey: "tokenNum")
                        showPurchaseConfirmation = true
                    },
                    onCancel: {
                        showConfirmation = false
                    })
                .zIndex(1)
            }
            
            if (showNotEnoughTokens) {
                ElephantPopup(
                    title: "Not enough tokens : (",
                    message: "Complete wellness tasks to earn tokens!",
                    onConfirm: {
                        showNotEnoughTokens = false
                    }
                )
                .zIndex(1)
            }
            
            if (showUserAlreadyHave) {
                ElephantPopup(
                    title: "Avatar already purchased",
                    message: "We see how much you love this item!",
                    onConfirm: {
                        showUserAlreadyHave = false
                    }
                )
                .zIndex(1)
            }
            
            if (showPurchaseConfirmation) {
                ElephantPopup(
                    title: "Avatar successfully purchased",
                    message: "Go ahead and give your timer a new look!",
                    onConfirm: {
                        showPurchaseConfirmation = false
                    }
                )
                .zIndex(1)
            }
        }
        .accessibilityIdentifier("itemView_\(item.id)")
        .preferredColorScheme(themeManager.Mode ? .dark : .light)
        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.background))
    }
    
}
#Preview {
    let themeManager = ThemeManager()
    ItemView(item: ShopItem(id: "mammal-lion", name: "Lion", price: 10))
        .environmentObject(themeManager)
}
