//
//  NavigationView_NavigationLink.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 19/07/25.
//

import SwiftUI

struct NavigationView_NavigationLink: View {
    @State private var fruits = ["Apple", "Banana", "Cherry"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Fruits List")
                    .font(.headline)
                
                NavigationLink(destination: NavigationView_NavigationLink_DetailsView(
                    fruits: fruits
                )) {
                    Text("Click Here")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
                }
            }
            .navigationTitle(Text("Home"))
        }
    }
}

#Preview {
    NavigationView_NavigationLink()
}

struct NavigationView_NavigationLink_DetailsView: View {
    let fruits: [String]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { name in
                Text(name)
            }
        }
        .navigationTitle(Text("Details"))
    }
}
