//
//  ObservedObjectDemo.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 19/07/25.
//

import SwiftUI
// import Combine

class FruitStore: ObservableObject {
    @Published var fruits: [String] = ["Apple", "Banana", "Cherry"]
}

struct ParentView: View {
    @StateObject private var objFruitStore = FruitStore()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                List(objFruitStore.fruits, id: \.self) { fruit in
                    Text(fruit)
                }
                
                NavigationLink(destination: ChildView(store: objFruitStore)) {
                    Text("Go to Child View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Parent View")
        }
    }
}

struct ChildView: View {
    @ObservedObject var store: FruitStore
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Add Mango") {
                store.fruits.append("Mango")
            }
            
            List(store.fruits, id: \.self) { fruit in
                Text(fruit)
            }
        }
        .padding()
        .navigationTitle("Child View")
    }
}

#Preview {
    ParentView()
}
