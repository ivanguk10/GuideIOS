//
//  RoundedImageTextButton.swift
//  GuideIOS
//
//  Created by MacBookPro on 14/09/2022.
//

import SwiftUI

struct RoundedImageTextButton<Content: View>: View {
    
    let action: () -> Void
    let imageView: () -> Content
    let title: String
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            HStack {
                imageView()
                
                Text(title)
                    .font(.system(size: 17).weight(.medium))
                    .foregroundColor(Color.white)
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(Color.pink)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        })
    }
}

struct RoundedImageTextButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageTextButton(
            action: {
                print("")
            }, imageView: {
                Image("Search")
            }, title: "Find Guide"
        )
        
    }
}
