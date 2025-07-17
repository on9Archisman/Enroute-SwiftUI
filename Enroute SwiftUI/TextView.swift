//
//  TextView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 17/07/25.
//

import SwiftUI

struct TextView: View {
    let screen = UIScreen.main.bounds
    let text = "Let's start the journey of exploring SwiftUI"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.cyan
            
            Text(text)
                .font(.custom("Arimo-Bold", size: 30))
                .underline(color: .blue)
                .foregroundStyle(.red)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 100, alignment: .leadingFirstTextBaseline)
                .padding(.leading, 70)
        }
        .frame(width: screen.width, height: 500)
    }
}

#Preview {
    TextView()
}
