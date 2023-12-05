//
//  PersonDetail.swift
//  IKnowYou
//
//  Created by Neto Lobo on 03/12/23.
//

import MapKit
import SwiftUI

struct PersonDetailView: View {
    let viewModel : PersonDetailViewModel
    @State var selection = 0
    @State var mapCameraPositon: MapCameraPosition
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
      
                    ImageData.from(data: viewModel.person.image)
                        .resizable()
                        .scaledToFit()
                        .tabItem { Label("photo", systemImage: "photo") }
                        .tag(0)
                        .onTapGesture {
                            selection = 1
                        }

                    Map(position: $mapCameraPositon) {
                        Marker(viewModel.person.name, coordinate: CLLocationCoordinate2D(latitude: viewModel.person.latitude, longitude: viewModel.person.longitude))
                    }
                    .tabItem { Label("Location", systemImage: "map") }
                    .tag(1)
                    .onTapGesture {
                        selection = 0
                    }
 
            }
            .tableStyle(.automatic)
            
        }
        .navigationTitle(viewModel.person.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
    }
}

#Preview {
    PersonDetailView(viewModel: PersonDetailViewModel(person: Person(id: UUID(), name: "test", image: Data())), mapCameraPositon: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 49.3218061, longitude: -123.1001741), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.09))))
}
