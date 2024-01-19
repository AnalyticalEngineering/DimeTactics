//
//  Login.swift
//  DimeTactics
//
//  Created by J. DeWeese on 1/18/24.
//

import SwiftUI

struct Login: View {
    @Binding var showsignup: Bool
    //MARK:  PROPERTIES
    @State private var emailID: String = ""
    @State private var password: String = ""
    
    
    //MARK:  BODY
    var body: some View {
        VStack (alignment: .leading, spacing: 15, content: {
            Spacer(minLength: 0)
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Sign into your account to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25, content: {
                ///custom textfields
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Password",  isPassword: true, value: $emailID)
                    .padding(.top, 5)
                ///Login Button
                Button("Forget Password?") {
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.appOrange)
                .hSpacing(.trailing)
                
                GradientButton(title: "Login", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                ///disabling till text fields have been populated
                .disableWithOpacity(emailID.isEmpty  || password.isEmpty)
            })
            .padding(.top, 20)
            Spacer(minLength: 0)
            HStack(spacing: 6, content: {
                Text("Dont have an account?")
                    .foregroundStyle(.gray)
                ///Register account button
                Button("Register", action: {
                    showsignup.toggle()
                })
                .fontWeight(.bold)
                .tint(.appOrange)
            })
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
    }
}
#Preview {
    ViewManager()
}
