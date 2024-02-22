//
//  LoginView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/20/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var agreedToTerms: Bool = false
    
    var body: some View {
        Spacer()
        VStack {
            TextField("Email", text: $email)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )

            SecureField("Password", text: $password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .padding(.top, 20)

            Button(action: {
                print("Logged in")
            }){
                Text("Log in")
                    .frame(width: 130, height: 30)
            }
            .buttonStyle(.bordered)
            
            .tint(.white)
            .padding(.top, 30)
        }
        .padding()
        
        Spacer()
    }
}


#Preview {
    LoginView()
}
