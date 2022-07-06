//
//  CardView.swift
//  IstanbulWonder
//
//  Created by Mac on 6.07.2022.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    var istanbul: Destination
    var body: some View {
        Image(istanbul.image)
            .resizable()
            .frame(width: 500, height: 600)
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: 300)
            .overlay(alignment: .bottom) {
                VStack(alignment: .center, spacing: 12) {
                    Text(istanbul.place)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 5)
                        .padding()
                        
                    
                       
                }
                .frame(width: 500, height: 100)
                .background(Rectangle().fill(Color.black.opacity(0.7)))
                
                
            
            }.padding()
            
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(istanbul: IstanbulData[0])
            .previewLayout(.fixed(width: 300, height: 600))
    }
}
