//
//  ContentView.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import MapKit
import SwiftUI

struct PersonListView: View {
    
    @State private var viewModel = PersonListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List(viewModel.people.sorted()) { person in
                    NavigationLink {
                        PersonDetailView(viewModel: PersonDetailViewModel(person: person), mapCameraPositon: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: person.latitude, longitude: person.longitude), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.09))))
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
                            AddOrEditPersonView(viewModel: AddOrEditPersonViewModel(person: person)) { updatedPerson in
                                viewModel.updatePerson(selectedPerson: person, updatedPerson: updatedPerson)
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
        }
        
    }
}

#Preview {
    PersonListView()
}
