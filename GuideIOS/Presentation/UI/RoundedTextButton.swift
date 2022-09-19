//
//  RoundedTextButton.swift
//  GuideIOS
//
//  Created by MacBookPro on 16/09/2022.
//

import SwiftUI

struct RoundedTextButton: View {
    
    let action: () -> Void
    let title: String
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            Text(title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        })
    }
}

struct RoundedTextButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedTextButton(action: {
            print("")
        }, title: "Sign in")
    }
}
