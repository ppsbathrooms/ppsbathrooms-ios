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
            .frame(height: 100)
        Text("Login")
            .font(.title)
            .padding()
            .bold()
        Button(action: {
            print("sign in with google")
        }, label: {
            HStack {
                Image("googleLogo")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Sign in with Google")
                    .bold()
            }
            .frame(width: 360, height: 75)
            .addBorder(Color.white, width: 2, cornerRadius: 10)
            .tint(.white)
            .padding(.top, 30)

        })
        HStack {
            VStack { Divider().background(.white) }.padding(16)
            Text("Or")
                .foregroundStyle(.gray)
            VStack { Divider().background(.white) }.padding(16)
        }
        .padding()

        VStack {
            TextField("Email", text: $email)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )

            SecureField("Password", text: $password)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                .padding(.top, 20)

            Button(action: {
                print("log in")

            }){
                Text("Log in")
                    .frame(width: 130, height: 40)
                    .addBorder(Color.white, width: 2, cornerRadius: 10)
                    .tint(.white)
                    .padding(.top, 30)
            }
        }
        .padding(.horizontal)
        
        Spacer()
        HStack {
            Spacer()
            Button(action: {
                print("create account")
            }, label: {
                Text("Create Account")
                    .padding(.horizontal, 30)
                    .foregroundStyle(.gray)
            })
        }   
    }
}

#Preview {
    LoginView()
}
