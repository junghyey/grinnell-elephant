//
//  ShopMainPageView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//
import SwiftUI

struct ShopMainPageView: View {
    
    // @AppStorage("user_tokens") var userTokens: Int = 15
    @AppStorage("curPalette") var curPalette: String = "defaultElephant"
    @EnvironmentObject private var themeManager: ThemeManager
    
    // only initialize it once
    init() {
        if (UserDefaults.standard.array(forKey: "purchasedAvatars") == nil) {
            UserDefaults.standard.set(["mammal-elephant"], forKey: "purchasedAvatars")
        }
    }
    
    var body: some View {
        let tokenNum: Int = UserDefaults.standard.integer(forKey: "tokenNum")
        VStack {
            ScrollView{
                NavigationStack{
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Shop")
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
                            NavigationLink(destination: MyAvatarView()) {
                                Image(systemName: "star.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(themeManager.curTheme.main_color_3)
                                    .accessibilityIdentifier("homeButton")
                                    .allowsHitTesting(true)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding()

                            ToHomePageButton() // Button to homepage
                            ToSettingsPageButton() // Button to settings page
                            ToManualPageButton() // Button to manual page
                        }
                        .padding([.top, .trailing], 15)
                        
                        PackBlock(pack: mammals, packName: "Mammal")
                        PackBlock(pack: marines, packName: "Marine")
                        PackBlock(pack: birds, packName: "Bird")
                        PackBlock(pack: monsters, packName: "Monster")
                        PackBlock(pack: unicorns, packName: "Unicorn")
                    }
                }.frame(alignment: .leading)
            }
        }
        .preferredColorScheme(themeManager.Mode ? .dark : .light)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeManager.curTheme.background)
        .accessibilityIdentifier("shopMainPageView")
    }
}

#Preview {
    // theme manager
    let themeManager = ThemeManager()
    // themeManager.setTheme(named: "blackWhite")
    // themeManager.setTheme(named: "defaultElephant")
    return ShopMainPageView()
        .environmentObject(themeManager)
}

struct ShopItemBlock : View {
    let item: ShopItem
    
    var body: some View {
        NavigationLink(destination: ItemView(item: item))
        {
            Image("\(item.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
        }.accessibilityIdentifier("shopButton_\(item.imageName)")
    }
}

struct PackBlock : View {
    let pack: Array<ShopItem>
    let packName: String
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        Text("\(packName) Pack")
            .font(.headline)
            .padding(.leading, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(themeManager.curTheme.main_color_1)
                    .frame(width: CGFloat(pack.count)*130, height: 140)
                    
                HStack{
                    ForEach(pack) { item in
                        ShopItemBlock(item:item)
                    }
                }
            }
        }
        .padding(20)
        .accessibilityIdentifier("shopView_scroll_\(packName)")
    }
}
