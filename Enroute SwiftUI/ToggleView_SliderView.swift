//
//  ToggleView_SliderView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 18/07/25.
//

import SwiftUI

struct ToggleView_SliderView: View {
    @State private var isToggleOn = false
    @State private var sliderValue = 0.0
    
    var body: some View {
        ZStack {
            Color(isToggleOn ? .green : .orange)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                
                ExtractedToggleView(isToggleOn: $isToggleOn)
                
                Spacer()
                
                ExtractedSliderView(
                    isToggleOn: $isToggleOn,
                    sliderValue: $sliderValue
                )
                
                Spacer()
            }
        }
    }
}

#Preview {
    ToggleView_SliderView()
}

struct ExtractedToggleView: View {
    @Binding var isToggleOn: Bool
    
    var body: some View {
        Toggle(isOn: $isToggleOn) {
            Text("Toggle is \(isToggleOn ? "on" : "off")")
        }
        .frame(width: 170)
        .padding()
        .background(Color.black.opacity(0.2))
        .cornerRadius(10)
    }
}

struct ExtractedSliderView: View {
    @Binding var isToggleOn: Bool
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack(spacing: 10) {
            Text("Start")
                .padding()
            
            Slider(
                value: $sliderValue,
                in: 0...50,
                step: 5) { onEditingChanged in
                    isToggleOn = onEditingChanged
                }
//                .frame(width: 300)
                .padding()
                .onAppear {
                    sliderValue = 20
                }
            
            Text("Stop")
                .padding()
        }
    }
}
