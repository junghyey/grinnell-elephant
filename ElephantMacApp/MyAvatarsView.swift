//
//  MyAvatarsView.swift
//  Elephant
//
//  Created by 陸卉媫 on 5/7/25.
//

import SwiftUI

struct MyAvatarView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State var showConfirmation = false
    @State private var selectedAvatar: String? = nil
    
    var body: some View {
        let tokenNum: Int = UserDefaults.standard.integer(forKey: "tokenNum")

        ZStack{
            
            VStack {
                ScrollView{
                    HStack {
                        Text("My Avatars")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .frame(alignment: .center)
                        Spacer()
                        Image(systemName: "dollarsign.circle.fill")
                            .font(.title2)
                            .foregroundColor(themeManager.curTheme.main_color_3)
                            .padding(-10)
                        ElephantText(displayText: "\(tokenNum)")
                        // home button, taken from ManualView
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "house.fill")
                                .font(.title2)
                                .foregroundColor(themeManager.curTheme.main_color_3)
                                .accessibilityIdentifier("homeButton")
                                .allowsHitTesting(true)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding()
                    }
                    DisplayAllItems(action: { avatar in
                        selectedAvatar = avatar
                        showConfirmation = true
                    })
                }
                .padding()
            }
            .frame(width: 500, height: 500)
            .background(themeManager.curTheme.main_color_1)
            .preferredColorScheme(themeManager.Mode ? .dark : .light)
            
            if(showConfirmation) {
                ElephantConfirmationDialogue(
                    title: "Change to this avatar?",
                    message: "Do you want to change to this avatar?",
                    confirmButtonText: "Yes!",
                    onConfirm: {
                        showConfirmation = false
                        UserDefaults.standard.set(selectedAvatar, forKey: "curAvatar")
                    },
                    onCancel: {
                        showConfirmation = false
                    })
                .zIndex(1)
            }
        }
        .accessibilityIdentifier("")
        .preferredColorScheme(themeManager.Mode ? .dark : .light)
        .foregroundColor(themeManager.textColor(for: themeManager.curTheme.background))
    }
    
}

struct DisplayItemBlock : View {
    let item: ShopItem
    let action: ((String)->Void)
    
    var body: some View {
        Button(action: {
            action(item.id)
        }) {
            Image("\(item.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
                .cornerRadius(10)
        }.accessibilityIdentifier("myAvatarButton_\(item.imageName)")
    }
}

struct DisplayAllItems: View {
    @EnvironmentObject var themeManager: ThemeManager
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let action: ((String)->Void)
    
    var body: some View {
        let purchasedAvatars = UserDefaults.standard.stringArray(forKey: "purchasedAvatars") ?? ["mammal-elephant"]
        let allDisplayingAvatars: [ShopItem] = allCollectibles.filter{purchasedAvatars.contains($0.id)}
        VStack{
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(allDisplayingAvatars) { avatar in
                        DisplayItemBlock(item: avatar, action: action)
                            .padding(10)
                            .background(themeManager.curTheme.main_color_2)
                            .cornerRadius(6)
                    }
                }
            }
        }
    }
}

#Preview {
    let themeManager = ThemeManager()
    MyAvatarView()
        .environmentObject(themeManager)
}
