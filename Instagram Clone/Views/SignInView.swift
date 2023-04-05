//
//  SignInView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/4/23.
//

import SwiftUI

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .center) {
                    Text("Instagram")
                        .font(.system(size: 32, weight: .heavy, design: .rounded))
                }
                VStack {
                    FormField(value: $username, placeholder: "Username")
                    FormField(value: $password, placeholder: "Password", isSecure: true)
                }
                
                Button(action: {}) {
                    Text("Sign in")
                        .font(.title)
                        .modifier(ButtonModifier())
                }
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up.")
                            .font(.system(size: 15, weight: .semibold))
                    }
                }
            }
            .padding()
        }
        
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
