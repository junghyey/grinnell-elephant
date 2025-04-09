//
//  ShopMainPageView.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/14/25.
//
import SwiftUI

struct ShopMainPageView: View {
    
    @AppStorage("mode") private var Mode: Bool = false //global mode setting
    @AppStorage("user_tokens") var userTokens: Int = 15
    
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack(alignment: .leading) {
                    HStack{
                        NavigationLink(destination: ContentView()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(DefaultColors.main_color_2)
                                .frame(width: 50, height: 30)
                                .overlay(
                                    Text("Back").foregroundColor(DefaultColors.background))
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
        .preferredColorScheme(Mode ? .dark : .light)
        .frame(width: 500, height: 500)
        .padding(10)
        .background(DefaultColors.main_color_1)
        .accessibilityIdentifier("shopMainPageView")
    }
}

#Preview {
    ShopMainPageView()
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
        .accessibilityIdentifier("\(packName)ScrollView")
    }
}
