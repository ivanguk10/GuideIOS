//
//  SignInScreen.swift
//  GuideIOS
//
//  Created by MacBookPro on 30/08/2022.
//

import SwiftUI

struct SignInScreen: View {
    
    @State private var username: String = ""
    @State var text = ""

    @ObservedObject var vm: SignInViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
            
                VStack {
                    Image("SignIn")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: abs((geo.size.height - 100) * 0.5))
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 8)
                    
                                        
                    VStack(alignment: .leading) {
                        HStack {
                            TextField("Email", text: $vm.email)
                        }
                        .textFieldStyle(OvalTextFieldStyle())
                    }.padding(.top, 16)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            TextField("Password", text: $vm.password)
                        }
                        .textFieldStyle(OvalTextFieldStyle())
                    }.padding(.top, 8)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            TextField("Password Again", text: $vm.passwordAgain)
                        }
                        .textFieldStyle(OvalTextFieldStyle())
                    }
                    .padding(.top, 8)
                }
                
                Spacer()
                
                Button {
                    vm.signIn()
                } label: {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            
                NavigationLink(destination: HomeScreen(), isActive: $vm.isNavigateToHomeScreen) {
                    Text("")
                        .frame(width: 0, height: 0)
                        .hidden()
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

func register() {
    
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen(vm: SignInViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
        
        SignInScreen(vm: SignInViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
