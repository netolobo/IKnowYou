//
//  ContentView.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import SwiftUI

struct PersonListView: View {
    
    @State private var viewModel = PersonListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(viewModel.people.sorted()) { person in
                    HStack(spacing: 20) {
                        Text(person.name)
                    }
                }
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
    PersonListView()
}
