//
//  Onboarding.swift
//  GuideIOS
//
//  Created by MacBookPro on 29/08/2022.
//

import SwiftUI

struct OnboardingScreen: View {
    
    @ObservedObject var vm: OnboardingViewModel
//    @EnvironmentObject private var navigation: Navigation
    
    let label: String = "Already have an account? Login"

    var loginArray: [String] {
        return label.split(separator: "?").map(String.init)
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Image("Onboarding")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height*0.6)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 8)
                    
                    VStack {
                        Text("Travel & find new friends")
                            .font(.system(size: 24).weight(.heavy))
                            .padding(.bottom, 4)
                                    
                        Text("Now it is easy to see real culture of a City. Just find locals, they know their city better than anyone else!")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 16).weight(.light))
                            .padding(.horizontal, 24)
                            .padding(.bottom, 16)
                        
                        Button() {
                            vm.navigateToSignIn()
                        } label: {
                            Text("Get Started")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }.padding(.top, 16)
                    
                    NavigationLink(destination: SignInScreen(vm: SignInViewModel()), isActive: $vm.isNavigateToSignIn
                    ) {
                        SignInScreen(vm: SignInViewModel())
                    }.frame(width: 0, height: 0)
                    .hidden()
                    
                    Spacer()
                    Button() {
                        vm.navigateToLogin()
                    } label: {
                        NavigationLink(destination: LoginScreen(), isActive: $vm.isNavigateToLogIn) {
                            HStack {
                                Text(loginArray[0] + "?")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16).weight(.light))
                                    + Text(loginArray[1])
                                    .foregroundColor(.pink)
                                    .font(.system(size: 16).weight(.light))
                            }.padding(.bottom, 8)
                        }
                    }
            
                }
                .navigationBarHidden(true)
            }.padding(.horizontal, 16)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(vm: OnboardingViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        
        OnboardingScreen(vm: OnboardingViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
    }
}
