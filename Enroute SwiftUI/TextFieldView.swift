//
//  TextFieldView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 17/07/25.
//

import SwiftUI

struct TextFieldView: View {
    @State var txtName: String = ""
    @State var txtAge: String = ""
    @State var flagOnEditing: Bool = false
    
    var body: some View {
        ZStack {
            Color(flagOnEditing ? .green : .black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Textfield Demo")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                VStack(spacing: 10) {
                    ExtractedTextFieldView(
                        txtTextFieldTitle: "Enter your name",
                        txtTextFieldPlaceholder: "Name",
                        dataType: String.self,
                        txtTextFieldValue: $txtName,
                        flagOfEditing: $flagOnEditing
                    )
                    
                    ExtractedTextFieldView(
                        txtTextFieldTitle: "Enter your age",
                        txtTextFieldPlaceholder: "Age",
                        dataType: Int.self,
                        txtTextFieldValue: $txtAge,
                        flagOfEditing: $flagOnEditing
                    )
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    TextFieldView()
}

struct ExtractedTextFieldView<T>: View {
    let screen = UIScreen.main.bounds
    
    let txtTextFieldTitle: String
    let txtTextFieldPlaceholder: String
    let dataType: T.Type
    
    @Binding var txtTextFieldValue: String
    @Binding var flagOfEditing: Bool
    @FocusState private var isNumberFieldFocused: Bool
    // @State var flagOfEditing: Bool = false
    
    var body: some View {
        Text(txtTextFieldTitle)
            .foregroundColor(.red)
            .frame(width: screen.width - 10, alignment: .trailing)
        
        TextField(
            txtTextFieldPlaceholder,
            text: $txtTextFieldValue,
            onEditingChanged: { flag in
                flagOfEditing = flag
            },
            onCommit: {
                flagOfEditing = false
                print(txtTextFieldValue)
            }
        )
        .padding()
        .background(Color.white)
        .frame(width: screen.width - 10)
        .cornerRadius(10)
        .keyboardType(dataType == String.self ? .default : .numberPad)
        .focused($isNumberFieldFocused)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button {
                    isNumberFieldFocused = false
                } label: {
                    Text("Done")
                }
            }
        }
        
        Text("Result: \(txtTextFieldValue)")
            .font(.caption)
            .foregroundStyle(flagOfEditing ? .black : .white)
            .frame(width: screen.width - 10, alignment: .leading)
    }
}
