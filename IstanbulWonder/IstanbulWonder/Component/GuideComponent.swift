//
//  GuideComponent.swift
//  IstanbulWonder
//
//  Created by Mac on 7.07.2022.
//

import SwiftUI

struct GuideComponent: View {
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(Color.orange)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle)
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.orange)
                }
                
                Divider()
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title", subtitle: "Swipe Right", description: "Placeholder sentence.", icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
