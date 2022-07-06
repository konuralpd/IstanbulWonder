//
//  FooterView.swift
//  IstanbulWonder
//
//  Created by Mac on 6.07.2022.
//

import SwiftUI

struct FooterView: View {
    @Binding var showBookingAlert: Bool
    
    var body: some View {
        HStack {
            Image("cross")
            
            Spacer()
            
            Button {
                self.showBookingAlert.toggle()
            } label: {
                Text("Burayı Gör!")
                    .padding()
                    .foregroundColor(.black)
                    .background(Capsule().stroke(Color.orange, lineWidth: 4))
            }
            
            Spacer()
            
            Image("heart")
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
    }
}
