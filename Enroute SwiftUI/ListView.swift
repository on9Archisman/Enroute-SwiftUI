//
//  ListView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 19/07/25.
//

import SwiftUI

struct ListView: View {
    let imageArray = CustomeScrollView().imageArray
    
    @State private var selectedIndex: Int? = nil
    
    var body: some View {
        VStack {
            Text("Selected Index: \(selectedIndex ?? -1)")
                .font(.headline)
                .padding()
                .foregroundColor(.secondary)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            List(selection: $selectedIndex) {
                ForEach(0..<imageArray.count, id: \.self) { index in
                    HStack {
                        Image(systemName: imageArray[index])
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(imageArray[index])
                    }
                }
            }
            
            List {
                Section {
                    // Type 1: Foreach
                    ForEach(0..<imageArray.count) { indexPath in
                        Text(imageArray[indexPath])
                    }
                } header: {
                    Text("Type 1 Start")
                        .bold()
                } footer: {
                    Text("Type 1 End")
                }
                
                Section {
                    // Type 2: Foreach
                    ForEach(imageArray, id: \.self) { item in
                        Text(item)
                    }
                } header: {
                    Text("Type 2 Start")
                        .bold()
                } footer: {
                    Text("Type 2 End")
                }
            }
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ListView()
}
