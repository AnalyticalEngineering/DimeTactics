//
//  GradientButton.swift
//  DimeTactics
//
//  Created by J. DeWeese on 1/18/24.
//

import SwiftUI

struct GradientButton: View {
    //MARK:  PROPERTIES
    var title: String
    var icon: String
    var onClick: ( ) -> ( )
    var body: some View {
        Button(action: onClick, label: {
            HStack (spacing: 15){
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.heavy)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 45)
            .background(.linearGradient(colors: [.orange, .appOrange,  .red], startPoint: .top, endPoint: .bottom), in: .rect(cornerRadius: 12))
        })
    }
}

#Preview {
    ViewManager()
}
