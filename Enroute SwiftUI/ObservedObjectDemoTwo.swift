//
//  ObservedObjectDemoTwo.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 20/07/25.
//

import SwiftUI

class Person: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
}

struct ObservedObjectDemoTwo: View {
    @ObservedObject var person: Person
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("First Name", text: $person.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Last Name", text: $person.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Full Name: \(person.firstName) \(person.lastName)")
        }
    }
}

#Preview {
    ObservedObjectDemoTwo(person: .init())
}
