//
//  TestResultViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 23/09/2022.
//

import Foundation

class TestResultViewModel: ObservableObject {
    
    @Published var questionsCount: Int
    @Published var correctAnswersCount: Int
    @Published var resultText = ""
    
    init(_questionsCount: Int, _correctAnswersCount: Int) {
        questionsCount = _questionsCount
        correctAnswersCount = _correctAnswersCount
        resultText = getResultText()
    }
    
    private func countCorrectPercent() -> Float {
        //100 qount
        //percent correct
        let percent = Float(100 * correctAnswersCount / questionsCount)
        return round(percent * 100) / 100.0
    }
    
    private func getResultText() -> String {
        switch countCorrectPercent() {
        case 95...100:
            return "Excellent result, you are a guide now!"
        case 85...94:
            return "Good result, you are a guide now!"
        default:
            return "Your result isn't enough to become a guide"
        }
    }
}
