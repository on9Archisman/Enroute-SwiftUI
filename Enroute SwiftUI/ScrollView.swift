//
//  ScrollView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 19/07/25.
//

import SwiftUI

struct CustomeScrollView: View {
    let imageArray = [
        "hand.point.up.braille.badge.ellipsis.fill",
        "square.and.arrow.down.badge.clock.fill",
        "calendar.badge.exclamationmark",
        "person.badge.shield.checkmark.fill",
        "figure.and.child.holdinghands",
        "sun.rain.fill",
        "app.badge.checkmark.fill",
        "camera.badge.ellipsis.fill",
        "18.square.fill"
    ]
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<imageArray.count) { index in
                            ExtractedImageView(imageName: imageArray[index])
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(0..<imageArray.count) { index in
                            ExtractedImageView(imageName: imageArray[index])
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    CustomeScrollView()
}

struct ExtractedImageView: View {
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .padding()
            .frame(width: 200, height: 200)
            .foregroundStyle(Color.random)
            .border(Color.secondary, width: 1)
            .cornerRadius(20)
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
