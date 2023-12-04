//
//  PersonDetail.swift
//  IKnowYou
//
//  Created by Neto Lobo on 03/12/23.
//

import SwiftUI

struct PersonDetailView: View {
    let viewModel : PersonDetailViewModel
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(data: viewModel.person.image)!)
            
            Text(viewModel.person.name)
                .font(.title)
                .foregroundStyle(.secondary)
                .background(.thinMaterial)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PersonDetailView(viewModel: PersonDetailViewModel(person: Person(id: UUID(), name: "test", image: Data())))
}
