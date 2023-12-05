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
                List(viewModel.people.sorted()) { person in
                    NavigationLink {
                        PersonDetailView(viewModel: PersonDetailViewModel(person: person))
                    } label: {
                        HStack(spacing: 20) {
                            ImageData.from(data: person.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Text(person.name)
                                .font(.title)
                            
                            Spacer()
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            viewModel.removePerson(person: person)
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        NavigationLink {
                            AddOrEditPersonView(viewModel: AddOrEditPersonViewModel(person: person)) { selectedPerson in
                                viewModel.updatePerson(person: selectedPerson)
                            }
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.indigo)
                    } 
                }
                
                Spacer()
            }
            .navigationTitle("IKnowYou!")
            .toolbar {
                NavigationLink {
                    AddOrEditPersonView(viewModel: AddOrEditPersonViewModel()) { selectedPerson in
                        viewModel.people.append(selectedPerson)
                    }
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
