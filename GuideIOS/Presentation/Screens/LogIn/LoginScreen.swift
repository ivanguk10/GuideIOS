//
//  LoginViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 02/09/2022.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var text = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geo in
            VStack {
            
                Image("Login")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: (geo.size.height - 100) * 0.6)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 8)
                
                                    
                VStack(alignment: .leading) {
                    HStack {
                        TextField("Email", text: $text)
                    }
                    .textFieldStyle(OvalTextFieldStyle())
                }.padding(.top, 16)
                
                VStack(alignment: .leading) {
                    HStack {
                        TextField("Password", text: $text)
                    }
                    .textFieldStyle(OvalTextFieldStyle())
                }.padding(.top, 8)
                    
                Spacer()
                
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Text("Log in")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        LoginScreen()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
    }
}
