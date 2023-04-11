//
//  SignInView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/4/23.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @ObservedObject var signInViewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .center) {
                    Text("Instagram")
                        .font(.system(size: 32, weight: .heavy, design: .rounded))
                }
                VStack {
                    FormField(value: $email, placeholder: "Email")
                    FormField(value: $password, placeholder: "Password", isSecure: true)
                }
                
                Button {
                    signInViewModel.SignIn(email, password)
                    if signInViewModel.signedIn {
                        
                    }
                } label: {
                    Text("Sign in")
                        .font(.title)
                        .modifier(ButtonModifier())
                }
                NavigationLink("Success") {
                    HomeView()
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
