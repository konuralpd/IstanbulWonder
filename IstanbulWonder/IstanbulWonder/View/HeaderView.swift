//
//  HeaderView.swift
//  IstanbulWonder
//
//  Created by Mac on 6.07.2022.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        HStack {
            Button {
                showInfoView.toggle()
            } label: {
                Image("info")
                
            }
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            Spacer()
            
            VStack {
                Text("IstanbulWonder")
                    .bold()
                Text("Gezi Rehberi")
            }
            
            
            Spacer()
            
            Button {
                self.showGuideView.toggle()
            } label: {
                Image("help")
            }
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }


        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfoView: Bool = false
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfoView)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
