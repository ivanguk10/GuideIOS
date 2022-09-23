//
//  CurrentTest.swift
//  GuideIOS
//
//  Created by MacBookPro on 16/09/2022.
//

import SwiftUI

struct CurrentTest: View {
    
    @ObservedObject var vm: CurrentTestViewModel
    @EnvironmentObject private var navigation: Navigation
        
    var body: some View {
        GeometryReader { geo in
            VStack {
                LinearProgressBar(
                    width: geo.size.width - 32,
                    height: 20,
                    percent: CGFloat((vm.currentQuestionIndex + 1) * 100 / vm.listOfQuestions.count)
                ).animation(.linear)
                
                Text("\(vm.currentQuestionIndex + 1) of \(vm.listOfQuestions.count)")
                    .font(.headline)
                    .padding()
                Text(vm.listOfQuestions[vm.currentQuestionIndex].question)
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 24)
                
                ForEach(vm.listOfQuestions[vm.currentQuestionIndex].answers) { answer in
                    AnswerView(answer: answer)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            print("Percent = \(CGFloat((vm.currentQuestionIndex + 1) * 100 / vm.listOfQuestions.count))")
                            vm.answerClicked(answerId: answer.id)
                        }
                }
                .padding(.top, 4)
                
                Spacer()
                
                RoundedTextButton(action: {
                    vm.nextClicked()
                }, title: "Next")
            }
            .padding(.horizontal, 16)
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        .onReceive(vm.$isNavigateToTestResult) {
            guard $0 else { return }
            navigation.pushView(TestResultScreen(vm: TestResultViewModel(
                _questionsCount: vm.listOfQuestions.count, _correctAnswersCount: vm.correctAnswersCount
            )))
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct CurrentTest_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTest(vm: CurrentTestViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
        
        CurrentTest(vm: CurrentTestViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
