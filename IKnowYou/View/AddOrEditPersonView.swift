//
//  AddNewPersonView.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import SwiftUI

struct AddOrEditPersonView: View {
    @Environment(\.dismiss) private var dismiss
    @State var viewModel : AddOrEditPersonViewModel
    var saveClick: (Person) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            viewModel.image?
                .resizable()
                .scaledToFit()
            
            TextField("Type a name", text: $viewModel.personName)
            
            Button {
               
                if let person = viewModel.person {
                    saveClick(person)
                    dismiss()
                }
                
                
            } label: {
                Text("Done")
                    .fontWeight(.bold)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
        }
        .toolbar {
            Button {
                viewModel.showingImagePicker.toggle()
            } label: {
                Image(systemName: "photo.fill.on.rectangle.fill")
            }
            
        }
        .task {
            viewModel.getUserLocation()
        }
        .onChange(of: viewModel.inputImage) { viewModel.loadImage() }
        .sheet(isPresented: $viewModel.showingImagePicker, content: {
            ImagePicker(image: $viewModel.inputImage)
        })
        .padding(.horizontal, 20)
    }
}

#Preview {
    NavigationStack {
        AddOrEditPersonView(viewModel: AddOrEditPersonViewModel(), saveClick: { _ in})
    }
    
}
