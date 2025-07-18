//
//  Form_Section_Stepper.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 18/07/25.
//

import SwiftUI

struct Form_Section_Stepper: View {
    let screen = UIScreen.main.bounds
    @State private var stepperValue = 0
    
    var body: some View {
        ZStack {
            Color.cyan.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Form/Section/Stepper")
                    .padding()
                    .foregroundStyle(.white)
                    .frame(width: screen.width - 10, alignment: .leading)
                    .bold()
                    .font(.largeTitle)
                
                Form {
                    /* Default Section (If we don't mention any Section) */
                    Text("Intro to Form Section Stepper")
                    
                    Section {
                        VStack(spacing: 10) {
                            Text("Count: \(stepperValue)")
                                .padding()
                            
                            Stepper(value: $stepperValue, step: 2) {
                                Text("Count")
                            }
                            onEditingChanged: { flag in
                                print(stepperValue)
                            }
                            .padding()
                        }
                        .background(Color.yellow)
                        .cornerRadius(10)
                        
                    } header: {
                        Text("Stepper In")
                            .font(.caption)
                            .foregroundStyle(.blue)
                    } footer: {
                        Text("Stepper Out")
                            .font(.caption)
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    Form_Section_Stepper()
}
