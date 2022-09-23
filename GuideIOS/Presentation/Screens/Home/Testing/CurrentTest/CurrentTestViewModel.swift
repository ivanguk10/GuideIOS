//
//  CurrentTestViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 16/09/2022.
//

import Foundation

class CurrentTestViewModel: ObservableObject {
    
    @Published var listOfQuestions: [Question] = fakeQuestions
    @Published var currentQuestionIndex = 0
    @Published var correctAnswersCount = 0
    @Published var isNavigateToTestResult = false
        
    func nextClicked() {
        let currentQuestion = listOfQuestions[currentQuestionIndex]
        let correctAnswers = currentQuestion.answers.filter { $0.isCorrect && $0.isSelected }
        correctAnswersCount += correctAnswers.count
        print(correctAnswersCount)
        
        if currentQuestionIndex + 1 != listOfQuestions.count {
            currentQuestionIndex += 1
        } else {
            navigateToTestReult()
        }
    }
    
    func answerClicked(answerId: UUID) {
        var currentQuestion = listOfQuestions[currentQuestionIndex]
        currentQuestion.answers = currentQuestion.answers.map { answer -> Answer in
            var changedAnswer = answer
            changedAnswer.isSelected = changedAnswer.id == answerId
            return changedAnswer
        }
        listOfQuestions[currentQuestionIndex] = currentQuestion
    }
    
    private func navigateToTestReult() {
        isNavigateToTestResult = true
    }
}

struct Question {
    let question: String
    var answers: [Answer]
}

struct Answer: Identifiable {
    let id = UUID()
    let answer: String
    let isCorrect: Bool
    var isSelected: Bool
}
