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
    @State private var showForgottenPassword: Bool = false
    @State private var showPasswordRecovery: Bool = false
//OTP
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    
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
                
                CustomTF(sfIcon: "lock", hint: "Password",  isPassword: true, value: $password)
                    .padding(.top, 5)
                ///Login Button
                
                GradientButton(title: "Login", icon: "arrow.right") {
                    askOTP.toggle()
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
        .sheet(isPresented: $showForgottenPassword, content: {
            if #available(iOS 16.4, *) {
                ForgottenPassword(showPasswordRecovery: $showPasswordRecovery )
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgottenPassword(showPasswordRecovery: $showPasswordRecovery)
            }
        })
        ///resetting new password
        .sheet(isPresented: $showPasswordRecovery, content: {
            if #available(iOS 16.4, *) {
                PasswordRecovery()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordRecovery()
                    .presentationDetents([.height(350)])
            }
        })
        ///OTP prompt
        .sheet(isPresented: $askOTP, content: {
            if #available(iOS 16.4, *) {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
            }
        })
    }
}
#Preview {
    ViewManager()
}
