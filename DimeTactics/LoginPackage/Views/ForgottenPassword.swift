//
//  PasswordRecoveryView.swift
//  DimeTactics
//
//  Created by J. DeWeese on 1/19/24.
//

import SwiftUI

struct ForgottenPassword: View {
        @Binding var showPasswordRecovery: Bool
        //MARK:  PROPERTIES
        @State private var emailID: String = ""
    ///Environment properties
    @Environment(\.dismiss) private var dismiss
        
        //MARK:  BODY
        var body: some View {
            VStack (alignment: .leading, spacing: 15, content: {
                Button(action: {
                    dismiss( )
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundStyle(.appOrange)
            })
                .padding(.top, 10)
                
                Text("Forgot Password?")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top, 5)
                Text("Please enter email address to receive recovery link.")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.appOrange)
                    .padding(.top, -5)
                
                VStack(spacing: 25, content: {
                    ///email password recovery
                    CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                        .padding(.top, 5)
                    ///Login Button
                    GradientButton(title: "Email Link", icon: "arrow.right") {
                        Task{
                            dismiss( )
                            try? await Task.sleep(for: .seconds(0))
                            showPasswordRecovery = true
                        }
                    }
                    .hSpacing(.trailing)
                    ///disabling till text fields have been populated
                    .disableWithOpacity(emailID.isEmpty)
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
