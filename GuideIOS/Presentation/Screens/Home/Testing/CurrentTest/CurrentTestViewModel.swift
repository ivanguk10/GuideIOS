//
//  CurrentTestViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 16/09/2022.
//

import Foundation

class CurrentTestViewModel: ObservableObject {
    
    @Published var listOfQuestions: [Question] = [
        Question(
            question: "The first Minsk mention",
            answers: [
                Answer(answer: "1062", isCorrect: false, isSelected: false),
                Answer(answer: "1064", isCorrect: false, isSelected: false),
                Answer(answer: "1065", isCorrect: false, isSelected: false),
                Answer(answer: "1067", isCorrect: true, isSelected: false)
            ]
        ),
        Question(
            question: "When Minsk became the Hero city",
            answers: [
                Answer(answer: "1971", isCorrect: false, isSelected: false),
                Answer(answer: "1973", isCorrect: false, isSelected: false),
                Answer(answer: "1974", isCorrect: true, isSelected: false),
                Answer(answer: "1975", isCorrect: false, isSelected: false)
            ]
        ),
        Question(
            question: "When Minsk became the Hero city",
            answers: [
                Answer(answer: "1971", isCorrect: false, isSelected: false),
                Answer(answer: "1973", isCorrect: false, isSelected: false),
                Answer(answer: "1974", isCorrect: true, isSelected: false),
                Answer(answer: "1975", isCorrect: false, isSelected: false)
            ]
        ),
        Question(
            question: "When Minsk became the Hero city",
            answers: [
                Answer(answer: "1971", isCorrect: false, isSelected: false),
                Answer(answer: "1973", isCorrect: false, isSelected: false),
                Answer(answer: "1974", isCorrect: true, isSelected: false),
                Answer(answer: "1975", isCorrect: false, isSelected: false)
            ]
        ),
        Question(
            question: "When Minsk became the Hero city",
            answers: [
                Answer(answer: "1971", isCorrect: false, isSelected: false),
                Answer(answer: "1973", isCorrect: false, isSelected: false),
                Answer(answer: "1974", isCorrect: true, isSelected: false),
                Answer(answer: "1975", isCorrect: false, isSelected: false)
            ]
        ),
        Question(
            question: "When Minsk became the Hero city",
            answers: [
                Answer(answer: "1971", isCorrect: false, isSelected: false),
                Answer(answer: "1973", isCorrect: false, isSelected: false),
                Answer(answer: "1974", isCorrect: true, isSelected: false),
                Answer(answer: "1975", isCorrect: false, isSelected: false)
            ]
        )
    ]
    
    @Published var currentQuestionIndex = 0
        
    func nextClicked() {
        if currentQuestionIndex + 1 != listOfQuestions.count {
            currentQuestionIndex += 1
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
