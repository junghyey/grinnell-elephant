//
//  ShopMainPageView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//
import SwiftUI

struct ShopMainPageView: View {
    
    @AppStorage("user_tokens") var userTokens: Int = 15
    @AppStorage("curPalette") var curPalette: String = "defaultElephant"
    
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack(alignment: .leading) {
                    HStack{
                        NavigationLink(destination: ContentView()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(themeManager.curTheme.main_color_2)
                                .frame(width: 50, height: 30)
                                .overlay(
                                    Text("Back").foregroundColor(themeManager.curTheme.background))
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(10)
                        .accessibilityIdentifier("shopButton_back")
                        
                        Text("Shop")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .frame(alignment: .center)
                    }
                    PackBlock(pack: mammals, packName: "Mammal")
                    PackBlock(pack: marines, packName: "Marine")
                }
            }.frame(alignment: .leading)
        }
        .preferredColorScheme(themeManager.Mode ? .dark : .light)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(10)
        .background(themeManager.curTheme.main_color_1)
        .accessibilityIdentifier("shopMainPageView")
    }
}

#Preview {
    // theme manager
    let themeManager = ThemeManager()
    themeManager.setTheme(named: "blackWhite")
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
    
    var body: some View {
        Text("\(packName) Pack")
            .font(.headline)
            .padding(.leading, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color(red: 0.996, green: 0.996, blue: 0.89))
                    .frame(width: CGFloat(pack.count)*130, height: 140)
                    
                HStack{
                    ForEach(pack) { item in
                        ShopItemBlock(item:item)
                    }
                }
            }
        }
        .padding(10)
        .accessibilityIdentifier("shopView_scroll_\(packName)")
    }
}
