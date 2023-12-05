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
            ImageData.from(data: viewModel.person.image)
                .resizable()
                .scaledToFit()
        }
        .navigationTitle(viewModel.person.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
    }
}

#Preview {
    PersonDetailView(viewModel: PersonDetailViewModel(person: Person(id: UUID(), name: "test", image: Data())))
}
