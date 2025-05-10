//
//  ShopViewLogic.swift
//  Elephant
//
//  Created by 陸卉媫 on 4/14/25.
//

import SwiftUI

class ShopViewLogic : ObservableObject {
    @AppStorage("displayItem") var displayItem: String = "realistic_elephant"
    @AppStorage("displayItemName") var displayItemName: String = "Elephant"
}

struct ShopItem : Identifiable {
    // id is the image name
    let id: String
    let name: String
    let price: Int
}
