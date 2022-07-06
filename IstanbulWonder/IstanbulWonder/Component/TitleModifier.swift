//
//  TitleModifier.swift
//  IstanbulWonder
//
//  Created by Mac on 7.07.2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.orange)
    }
}


