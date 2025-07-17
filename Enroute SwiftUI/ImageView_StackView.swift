//
//  ImageView_StackView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 17/07/25.
//

import SwiftUI

struct ImageView_StackView: View {
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack() {
            Color(.black)
                .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Spacer()
                
                Image("Sunset")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: screen.width - 10, height: screen.height/2)
                    .cornerRadius(20)
                
                Spacer()
                
                ExtractedHStackView(
                    comingText: "Start",
                    comingImageText: "restart.circle.fill"
                )
                
                Spacer()
                
                ExtractedHStackView(
                    comingText: "Stop",
                    comingImageText: "stop.circle.fill"
                )
                
                Spacer()
            }
        }
    }
}

#Preview {
    ImageView_StackView()
}

struct ExtractedHStackView: View {
    let comingText: String
    let comingImageText: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 50) {
            Text("Wanna Play")
                .foregroundColor(.yellow)
                .font(.title2)
                .padding(.leading, 10)
                .bold()
            
            Image(systemName: comingImageText)
                .foregroundColor(.cyan)
            
            Text("\(comingText)")
                .foregroundColor(.white)
                .padding(.trailing, 10)
            
        }
        .frame(height: 70)
        .font(.system(size: 40))
        .background(.brown)
        .cornerRadius(20)
    }
}
