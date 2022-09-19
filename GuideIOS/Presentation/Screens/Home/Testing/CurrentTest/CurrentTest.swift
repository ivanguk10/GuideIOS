//
//  CurrentTest.swift
//  GuideIOS
//
//  Created by MacBookPro on 16/09/2022.
//

import SwiftUI

struct CurrentTest: View {
    
    
    
    @ObservedObject var vm: CurrentTestViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
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
    }
}


struct CurrentTest_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTest(vm: CurrentTestViewModel())
    }
}
