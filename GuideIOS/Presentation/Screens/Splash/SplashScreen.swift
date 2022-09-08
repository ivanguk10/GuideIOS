//
//  SplashScreen.swift
//  GuideIOS
//
//  Created by MacBookPro on 30/08/2022.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var selection: Bool = false
    @ObservedObject var vm: SplashScreenViewModel
    
    
    var body: some View {
        NavigationView {
        
            Image("Logo")
                .resizable()
                .frame(width: 200, height: 200)

                .background(
                    NavigationLink(destination: OnboardingScreen(vm: OnboardingViewModel()), isActive: $vm.navigateToGetStarted
                    ) {
                        OnboardingScreen(vm: OnboardingViewModel())
                    }
                    .hidden()
                )
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(vm: SplashScreen.SplashScreenViewModel())
    }
}
