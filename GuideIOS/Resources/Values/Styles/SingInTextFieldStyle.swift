//
//  SingInTextFieldStyle.swift
//  GuideIOS
//
//  Created by MacBookPro on 30/08/2022.
//

import Foundation
import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(16)
            .background(Color(Colors.gray))
            .cornerRadius(16)
            .shadow(color: .gray, radius: 4)
    }
}

