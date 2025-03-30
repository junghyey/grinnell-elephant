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
    
    // hard code for now, eventually move this somewhere else
    let mammals = [
        ShopItem(id: "mammal-lion", name: "Lion", imageName: "mammal-lion", price: 5),
        ShopItem(id: "mammal-sheep", name: "Sheep", imageName: "mammal-sheep", price: 5),
        ShopItem(id: "mammal-elephant", name: "Elephant", imageName: "mammal-elephant", price: 5),
        ShopItem(id: "mammal-squirrel", name: "Squirrel", imageName: "mammal-squirrel", price: 5),
        ShopItem(id: "mammal-giraffe", name: "Giraffe", imageName: "mammal-giraffe", price: 5),
        ShopItem(id: "mammal-monkey", name: "Monkey", imageName: "mammal-monkey", price: 5)
    ]
    
    let marines = [
        ShopItem(id: "marine-dolphin", name: "Dolphin", imageName: "marine-dolphin", price: 5),
        ShopItem(id: "marine-whale", name: "Whale", imageName: "marine-whale", price: 5),
    ]
    
    var body: some View {
        ScrollView{
            NavigationStack{
                VStack(alignment: .leading) {
                    HStack{
                        NavigationLink(destination: ContentView()) {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(Color.yellow)
                                .frame(width: 50, height: 20)
                                .overlay(
                                    Text("Back"))
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(10)
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
        }
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
                    .foregroundStyle(Color.white)
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
