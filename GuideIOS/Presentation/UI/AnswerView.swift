//
//  QuestionView.swift
//  GuideIOS
//
//  Created by MacBookPro on 16/09/2022.
//

import SwiftUI

struct AnswerView: View {
    
    var answer: Answer
    
    var body: some View {
        HStack {
            ZStack {
                Image("Circle")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color(Colors.gray))
                
                if answer.isSelected {
                    Image("Circle")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color.pink)
                }
            }
            Text(answer.answer)
                .font(.title3)
        }
    }
}


struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(answer: Answer(answer: "1974", isCorrect: true, isSelected: false))
    }
}
