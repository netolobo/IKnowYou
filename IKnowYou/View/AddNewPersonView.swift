//
//  AddNewPersonView.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import SwiftUI

struct AddNewPersonView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = AddNewPersonViewModel()
    @Binding var people: [Person]
    
    var body: some View {
        VStack(spacing: 20) {
            viewModel.image?
                .resizable()
                .scaledToFit()
            
            TextField("Type a name", text: $viewModel.personName)
            
            Button {
                guard let imageData = viewModel.inputImage?.jpegData(compressionQuality: 0.8) else {
                    return
                }
                
                let newPerson = Person(id: UUID(), name: viewModel.personName, image: imageData)
                
                people.append(newPerson)
                
                dismiss()
                
            } label: {
                Text("Done")
                    .fontWeight(.bold)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
            
        }
        .onChange(of: viewModel.inputImage) { viewModel.loadImage() }
        .sheet(isPresented: $viewModel.showingImagePicker, content: {
            ImagePicker(image: $viewModel.inputImage)
        })
        .padding(.horizontal, 20)
    }
    
    func addPerson(newPerson: Person) {
        people.append(newPerson)
    }
    
//    func updatePerson(person: Person) {
//        guard let selectedPerson = viewModel.se else { return }
//        
//        if let index = people.firstIndex(of: selectedPerson) {
//            people[index] = person
//        }
//    }
    
}

#Preview {
    NavigationStack {
        AddNewPersonView(people: .constant([]))
    }
    
}
