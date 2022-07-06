//
//  GuideView.swift
//  IstanbulWonder
//
//  Created by Mac on 7.07.2022.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
  
        VStack(alignment: .center, spacing: 20) {
            HeaderComponents()
            
            Spacer(minLength: 10)
            
            Text("İstanbula Doyacaksın!")
                .fontWeight(.black)
                .font(.title)
                .foregroundColor(.orange)
                .modifier(TitleModifier())
            
            Text("İstanbulun tüm güzelliklerini bu uygulamada bulabilirsin, sen sadece görmek istediğin yere karar ver!")
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            Spacer(minLength: 10)
            
            GuideComponent(title: "Beğen", subtitle: "Sağa Kaydır", description: "Ekranda gördüğün gezi rotasını kaydetmek ve görmek için sağa kaydır.", icon: "heart.circle")
            
            GuideComponent(title: "Vazgeç", subtitle: "Sola Kaydır", description: "Bu yeri daha önce gördüysen ya da görmek istemiyorsan sola kaydır", icon: "xmark.circle")
            
            GuideComponent(title: "Bilet Al", subtitle: "Butona Tıkla", description: "Beğendikten sonra istediğin yeri görmek için bilet alıp yer ayırtabilirsin", icon: "checkmark.circle")
            
            Spacer(minLength: 10)
            
            Button(action: {
                
                print("Buton Tıklandı")
            }) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    
                    Text("Devam Et")
                        .font(.headline)
                        .padding()
                        .frame(minWidth:0, maxWidth:.infinity)
                        .background(Capsule().fill(Color.black))
                        .foregroundColor(.orange)
                }

            }
            
        }
        .frame(minWidth:0, maxWidth: .infinity)
        .padding(.top, 15)
        .padding(.bottom,25)
        .padding(.horizontal, 25)
            
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
