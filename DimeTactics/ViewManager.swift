//
//  ViewManager.swift
//  DimeTactics
//
//  Created by J. DeWeese on 1/18/24.
//

import SwiftUI

struct ViewManager: View {
    //MARK:  PROPERTIES
    @State private var showSignup: Bool = false
    ///Keyboard Status
    @State private var isKeyboardShowing: Bool = false
    var body: some View {
        NavigationStack {
            
            Login( showsignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    Signup(showsignup: $showSignup)
                }
            
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification), perform: { _ in
                    if !showSignup {
                        isKeyboardShowing = true
                    }
                })
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: { _ in
                    isKeyboardShowing = false
                })
        }
        .overlay {
            
            if #available(iOS 17, *) {
                CircleView()
                    .animation(.smooth (duration: 0.45, extraBounce: 0), value: showSignup)
                    .animation(.smooth (duration: 0.45, extraBounce: 0), value: isKeyboardShowing)
            }else{
                CircleView()
                    .animation(.easeInOut (duration: 0.3), value: showSignup)
                    .animation(.easeInOut (duration: 0.3), value: isKeyboardShowing)
            }
        }
    }
    
    ///Moving blurred background
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.red, .appOrange, .orange], startPoint: .bottom, endPoint: .top))
            .frame(width: 200, height: 200)
            .offset(x: showSignup ? 90 : -90, y: -90 - (isKeyboardShowing ? 200 : 0))
            .blur(radius: 10)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ViewManager()
}
