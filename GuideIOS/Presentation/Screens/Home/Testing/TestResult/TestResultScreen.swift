//
//  TestResultScreen.swift
//  GuideIOS
//
//  Created by MacBookPro on 23/09/2022.
//

import SwiftUI

struct TestResultScreen: View {
    
    @ObservedObject var vm: TestResultViewModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            Text("\(vm.correctAnswersCount) / \(vm.questionsCount)")
                .font(.largeTitle).bold()
            Text(vm.resultText)
                .font(.title3).bold()
                .padding(.top, 8)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            RoundedTextButton(action: {
                
            }, title: "Close")
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

struct TestResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestResultScreen(vm: TestResultViewModel(_questionsCount: 0, _correctAnswersCount: 20))
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        TestResultScreen(vm: TestResultViewModel(_questionsCount: 0, _correctAnswersCount: 20))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
    }
}
