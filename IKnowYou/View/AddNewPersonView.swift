//
//  AddNewPersonView.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import SwiftUI

struct AddNewPersonView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = AddNewPersonViewModel()
//    @Binding var people: [Person]
//    @State var selectedPerson: Person?
    var saveClick: (Person) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            viewModel.image?
                .resizable()
                .scaledToFit()
            
            TextField("Type a name", text: $viewModel.personName)
            
            Button {
                guard let selectedPerson = viewModel.updatePerson() else { return }
                
                saveClick(selectedPerson)
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
    
//    func addPerson(newPerson: Person) {
//        guard let imageData = viewModel.inputImage?.jpegData(compressionQuality: 0.8) else {
//            return
//        }
//        
//        selectedPerson = Person(id: UUID(), name: viewModel.personName, image: imageData)
//        
////        people.append(newPerson)
//    }
    
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
        AddNewPersonView(saveClick: { _ in})
    }
    
}
