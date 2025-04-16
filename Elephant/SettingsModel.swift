// To apply all mode and theme changes from Settings to other main view pages
//
//  SettingsModel.swift
//  Elephant
//
//  Created by Pruneda Turcios, Gabriela (Gabby) on 4/10/25.
//

import SwiftUI

class SettingsModel: ObservableObject{
    @Published var mode: Bool = false
    @Published var selectedThemeColor: Color = DefaultColors.background
}
