//
//  HeaderComponents.swift
//  IstanbulWonder
//
//  Created by Mac on 6.07.2022.
//

import SwiftUI

struct HeaderComponents: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(Color.secondary)
                .opacity(0.2)
            Text("IstanbulWonder")
                .bold()
        }
    }
}

struct HeaderComponents_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponents()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
