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
            VStack(alignment: .leading) {
                ForEach(viewModel.people.sorted()) { person in
                    HStack(spacing: 20) {
                        Image(uiImage: UIImage(data: person.image) ?? UIImage(systemName: "plus.app")!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Text(person.name)
                            .font(.title)
                        
                        Spacer()
                    }
                }
                
                Spacer()
            }
            .navigationTitle("IKnowYou!")
            .toolbar {
                NavigationLink {
                    AddNewPersonView(people: $viewModel.people)
                } label: {
                    Image(systemName: "plus.app")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    PersonListView()
}
