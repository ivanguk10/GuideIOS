//
//  SignInViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 02/09/2022.
//

import Foundation

class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    @Published var isNavigateToHomeScreen = false
    
    private func isPasswordsTheSame() -> Bool {
        return self.password == self.passwordAgain
    }
    
    private func isEmailValid() -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self.email)
    }
    
    private func isSignInValid() -> Bool {
    
        return isEmailValid() && isPasswordsTheSame()
    }
    
    func signIn(){
        self.isNavigateToHomeScreen = isSignInValid()
    }
}
