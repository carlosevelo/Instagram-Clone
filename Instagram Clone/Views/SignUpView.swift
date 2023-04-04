//
//  SignUpView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/4/23.
//

import SwiftUI

struct SignUpView: View {
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        //If needed, embed this vstack in scrollview
        VStack(spacing: 20) {
            VStack(alignment: .center) {
                Text("Instagram")
                    .font(.system(size: 32, weight: .heavy, design: .rounded))
                Text("Sign up to see photos and videos from your friends.")
                    .font((.system(size: 16, weight: .medium)))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            
            
            FormField(value: $email, icon: "envelope.fill", placeholder: "Email")
            FormField(value: $username, icon: "person.fill", placeholder: "Username")
            FormField(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
            Button(action: {}) {
                Text("Sign up")
                    .font(.title)
                    .modifier(ButtonModifier())
            }
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
