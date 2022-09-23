//
//  LinearProgressBar.swift
//  GuideIOS
//
//  Created by MacBookPro on 19/09/2022.
//

import SwiftUI

struct LinearProgressBar: View {
    
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 69
    var firstColor = Color.pink.opacity(0.1)
    var secondColor = Color.pink.opacity(1)
    
    var body: some View {
        
        let onePercentWidth = width / 100
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: onePercentWidth * percent, height: height)
                .background(LinearGradient(colors: [firstColor, secondColor], startPoint: .leading, endPoint: .trailing)
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                )
                .foregroundColor(.clear)
        }
    }
}

struct LinearProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        LinearProgressBar()
    }
}
