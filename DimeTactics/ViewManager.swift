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
    var body: some View {
        NavigationStack {
            
            Login( showsignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    
                }
        }
        .overlay {
            
            if #available(iOS 17, *) {
                CircleView()
                    .animation(.smooth (duration: 0.45, extraBounce: 0), value: showSignup)
            }else{
                CircleView()
                    .animation(.easeInOut (duration: 0.3), value: showSignup)
            }
        }
    }
    
    ///Moving blurred background
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.red, .appOrange, .orange], startPoint: .bottom, endPoint: .top))
            .frame(width: 200, height: 200)
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 10)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ViewManager()
}
