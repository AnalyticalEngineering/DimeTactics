//
//  OTPView.swift
//  DimeTactics
//
//  Created by J. DeWeese on 1/21/24.
//

import SwiftUI

struct OTPView: View {
    //MARK:  PROPERTIES
    @Binding var otpText: String
       
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
                    
                    Text("Enter OTP")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.top, 5)
                    Text("Your 6 digit code has been sent to your email.")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.appOrange)
                        .padding(.top, -5)
                    
                    VStack(spacing: 25, content: {
                        /// Custom OTP TextField
                        OTPVerificationView(otpText: $otpText)
                        ///Login Button
                        GradientButton(title: "Email Link", icon: "arrow.right") {
                          
                        }
                        .hSpacing(.trailing)
                        ///disabling till text fields have been populated
                        .disableWithOpacity(otpText.isEmpty)
                    })
                    .padding(.top, 20)
                   
                    Spacer(minLength: 0)
                })
                .padding(.vertical, 15)
                .padding(.horizontal, 25)
                .interactiveDismissDisabled()
            }
        }

#Preview {
   ViewManager()
}
