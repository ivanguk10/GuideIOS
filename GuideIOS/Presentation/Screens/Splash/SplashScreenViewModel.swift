//
//  SplashScreenViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 31/08/2022.
//

import Foundation

extension SplashScreen {
    class SplashScreenViewModel: ObservableObject {
        
        @Published var navigateToGetStarted: Bool = false
        
        init() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.navigateToGetStarted = true
            }
        }
    
    }

}
