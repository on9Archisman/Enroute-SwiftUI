//
//  Picker_TextView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 19/07/25.
//

import SwiftUI

struct Picker_TextView: View {
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker = false
    @State private var pickerIndex = 0
    
    let pickerArray = ["One", "Two", "Three", "Four", "Five"]
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        Form {
            // MARK: Normal DatePicker
            Section {
                DatePicker(selection: $selectedDate) {
                    Text("Select Date")
                }
                .datePickerStyle(.automatic)
                Text("\(selectedDate)")
            }
            
            // MARK: On Textfield DatePicker
            VStack() {
                TextField("Select Date", text: .constant(dateFormatter.string(from: selectedDate)))
                    .background(Color.red)
                    .disabled(true)
                    .onTapGesture {
                        showDatePicker = true
                    }
                    .padding(.vertical)
            }
            .sheet(isPresented: $showDatePicker) {
                VStack {
                    DatePicker("", selection: $selectedDate)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                    
                    Spacer()
                    
                    Button("Done") {
                        showDatePicker = false
                    }
                    .padding()
                }
            }
            
            // MARK: Normal Picker
            Section {
                ExtractedPickerView(pickerArray: pickerArray, pickerIndex: $pickerIndex)
                
                ExtractedPickerView(pickerArray: pickerArray, pickerIndex: $pickerIndex)
                    .pickerStyle(.segmented)
                
                Text("Selected Number: \(pickerArray[pickerIndex])")
            }
        }
    }
}

#Preview {
    Picker_TextView()
}

struct ExtractedPickerView: View {
    let pickerArray: Array<String>
    
    @Binding var pickerIndex: Int
    
    var body: some View {
        Picker(selection: $pickerIndex) {
            ForEach(0..<pickerArray.count) { index in
                Text(self.pickerArray[index])
            }
        } label: {
            Text("Select Number")
        }
    }
}
