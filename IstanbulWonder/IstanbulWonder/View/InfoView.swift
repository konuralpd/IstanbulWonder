//
//  InfoView.swift
//  IstanbulWonder
//
//  Created by Mac on 7.07.2022.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponents()
                
                Spacer(minLength: 10)
                
                Text("Uygulama Hakkında")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                HStack {
                    Text("Uygulama").foregroundColor(Color.white)
                    Spacer()
                    Text("IstanbulWonder")
                        .bold()
                    
                    
                }
                
                HStack {
                    Text("Cihaz").foregroundColor(Color.white)
                    Spacer()
                    Text("IPhone/iOS")
                        .bold()
                    
                    
                }
                
                HStack {
                    Text("Developer").foregroundColor(Color.white)
                    Spacer()
                    Text("Konuralp Demirtaş")
                        .bold()
                    
                    
                }
                HStack {
                    Text("Versiyon").foregroundColor(Color.white)
                    Spacer()
                    Text("1.0")
                        .bold()

                    
                }
         
                Text("Kullanılanlar")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                HStack {
                    Text("Fotoğraflar").foregroundColor(.white)
                    Spacer()
                    Text("Unsplash")
                        .bold()
                }
                
                HStack {
                    Text("IDE").foregroundColor(.white)
                    Spacer()
                    Text("Xcode")
                        .bold()
                    
                }
               
            }.padding()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Kapat")
                    .font(.headline)
                    .padding()
                    .frame(minWidth:0, maxWidth:.infinity)
                    .background(Capsule().fill(Color.black))
                    .foregroundColor(.white)
            }
            
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
        }
        .background(
               Image("istanbulbg")

                   .resizable()
                   .edgesIgnoringSafeArea(.all)
                   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
           )
        
    }
    
      
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
