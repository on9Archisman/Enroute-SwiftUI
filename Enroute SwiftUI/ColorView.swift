//
//  ColorView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 17/07/25.
//

import SwiftUI

struct ColorView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Color(.sRGB, red: 100/255, green: 200/255, blue: 150/255, opacity: 1)
                        .frame(width: 300, height: 200)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ColorView()
}
