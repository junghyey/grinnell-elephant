//
//  ShopViewLogic.swift
//  Elephant
//
//  Created by 陸卉媫 on 3/30/25.
//

import SwiftUI

class ShopViewLogic : ObservableObject {
    @AppStorage("displayItem") var displayItem: String = "realistic_elephant"
    @AppStorage("displayItemName") var displayItemName: String = "Elephant"
}

struct ShopItem : Identifiable {
    let id: String
    let name: String
    let imageName: String
    let price: Int
}
