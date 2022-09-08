//
//  OnboardingViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 02/09/2022.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    @Published var isNavigateToSignIn = false
    @Published var isNavigateToLogIn = false
    
    func navigateToSignIn() {
        self.isNavigateToSignIn = true
    }
    
    func navigateToLogin() {
        self.isNavigateToLogIn = true
    }
}
