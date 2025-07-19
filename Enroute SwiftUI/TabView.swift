//
//  TabView.swift
//  Enroute SwiftUI
//
//  Created by Archisman on 19/07/25.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            TextFieldView()
                .tabItem {
                    VStack {
                        Image(systemName: "1.circle.fill")
                        Text("TextView")
                    }
                }
                .tag(0)
            
            ExtractedSecondTabView(selectedTabIndex: $selectedTabIndex)
                .tabItem {
                    VStack {
                        Image(systemName: "2.circle.fill")
                        Text("TabView")
                    }
                }
                .tag(1)
            
            ListView()
                .tabItem {
                    VStack {
                        Image(systemName: "3.circle.fill")
                        Text("ListView")
                    }
                }
                .tag(2)
        }
    }
}

#Preview {
    CustomTabView()
}

struct ExtractedSecondTabView: View {
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Button {
                selectedTabIndex = 2
            } label: {
                Text("Go to #3")
            }
            
            Spacer()
            
            Button {
                selectedTabIndex = 0
            } label: {
                Text("Go to #1")
            }
            
            Spacer()
        }
    }
}
