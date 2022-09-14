//
//  CircleButton.swift
//  GuideIOS
//
//  Created by MacBookPro on 12/09/2022.
//

import SwiftUI

struct CircleButton<Content: View>: View {
    
    var action: () -> Void
    let imageView: () -> Content
    
    var body: some View {
        
        Button {
            action()
        } label: {
            ZStack {
                Text("")
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                imageView()
            }
        }
        .frame(width: 50, height: 50)
        .background(Color.white)
        .clipShape(Circle())
        .shadow(color: Color.gray, radius: 4)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(action: {
            print("hello")
        }, imageView: {
            Image(systemName: "paperplane")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.pink)
                .padding(.trailing, 4)
                .padding(.top, 4)
        })
    }
}
