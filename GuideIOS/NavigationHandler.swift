//
//  NavigationHandler.swift
//  GuideIOS
//
//  Created by MacBookPro on 30/08/2022.
//

import Foundation
import CoreImage
import SwiftUI

class NavigationHandler {
    var currentDistination: Destination
    
    
    init() {
        self.currentDistination = Destination.Splash
    }
    
    enum Destination {
        case Splash
        case OnBoarding
        case SignIn
        case LogIn
    }
    
//    struct Rout {
//        var destination: some View
//        var args: [String]
//    }
//
//    func setCurrentRout(destination: Destination) -> Rout {
//        var currentRout: Rout
//        switch destination {
//        case: .Splash {
//            currentRout = Rout(destination: SplashScreen, args: [])
//        }
//        }
}

