//
//  FormField.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/4/23.
//

import SwiftUI

struct FormField: View {
    @Binding var value: String
    var placeholder: String
    var isSecure = false
    
    var body: some View {
        Group {
            HStack {
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    } else {
                        TextField(placeholder, text: $value)
                    }
                }
                .font(Font.system(size: 20, design: .rounded))
                .foregroundColor(.black)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            }
        }
    }
}

