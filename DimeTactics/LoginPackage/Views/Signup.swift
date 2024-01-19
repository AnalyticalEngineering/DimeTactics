//
//  Signup.swift
//  DimeTactics
//
//  Created by J. DeWeese on 1/18/24.
//

import SwiftUI

struct Signup: View {
        @Binding var showsignup: Bool
        //MARK:  PROPERTIES
        @State private var emailID: String = ""
        @State private var password: String = ""
    @State private var fullName: String = ""
    
        
        //MARK:  BODY
        var body: some View {
            VStack (alignment: .leading, spacing: 15, content: {
                Button(action: {
                    showsignup = false
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundStyle(.appOrange)
            })
                .padding(.top, 10)
                
                Text("Register Your Account")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Sign up to continue")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding(.top, -5)
                
                VStack(spacing: 25, content: {
                    ///custom textfields
                    
                    CustomTF(sfIcon: "person", hint: "Full Name",  value: $fullName)
                      
                    
                    CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                        .padding(.top, 5)

                    CustomTF(sfIcon: "lock", hint: "Confirm Password",  isPassword: true, value: $emailID)
                        .padding(.top, 5)
                    ///Login Button
                   
                    
                    GradientButton(title: "Continue", icon: "arrow.right") {
                        
                    }
                    .hSpacing(.trailing)
                    ///disabling till text fields have been populated
                    .disableWithOpacity(emailID.isEmpty  || password.isEmpty || fullName.isEmpty)
                })
                .padding(.top, 20)
                Spacer(minLength: 0)
                HStack(spacing: 6, content: {
                    Text("Already have an account?")
                        .foregroundStyle(.gray)
                    ///Register account button
                    Button("Login", action: {
                        showsignup = false
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
