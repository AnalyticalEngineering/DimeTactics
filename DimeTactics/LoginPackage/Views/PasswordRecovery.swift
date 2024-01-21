//
//  PasswordRecovery.swift
//  DimeTactics
//
//  Created by J. DeWeese on 1/19/24.
//

import SwiftUI

struct PasswordRecovery: View {
        
            //MARK:  PROPERTIES
            @State private var password: String = ""
            @State private var confirmPassword: String = ""
        ///Environment properties
        @Environment(\.dismiss) private var dismiss
            
            //MARK:  BODY
            var body: some View {
                VStack (alignment: .leading, spacing: 15, content: {
                    Button(action: {
                        dismiss( )
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundStyle(.appOrange)
                })
                    .padding(.top, 10)
                    
                    Text("Reset Password?")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, 5)
                 
                    VStack(spacing: 25, content: {
                        ///email password recovery
                        CustomTF(sfIcon: "lock", hint: "Enter New Password", value: $password)
                            .padding(.top, 5)
                        CustomTF(sfIcon: "lock", hint: "Confirm New Password", value: $confirmPassword)
                            .padding(.top, 5)
                        ///Login Button
                        GradientButton(title: "Email Link", icon: "arrow.right") {
                         
                        }
                        .hSpacing(.trailing)
                        ///disabling till text fields have been populated
                        .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
                    })
                    .padding(.top, 20)
                   
                })
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
                .interactiveDismissDisabled()
            }
        }
#Preview {
    ViewManager()
}
