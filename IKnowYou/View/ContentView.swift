//
//  ContentView.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello!")
            }
            .navigationTitle("IKnowYou!")
            .toolbar {
                NavigationLink {
                    AddNewPersonView()
                } label: {
                    Image(systemName: "plus.app")
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
