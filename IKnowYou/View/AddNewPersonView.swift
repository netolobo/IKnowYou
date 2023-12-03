//
//  AddNewPersonView.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import SwiftUI

struct AddNewPersonView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var personName = ""
    
    var body: some View {
        VStack(spacing: 20) {
            image?
                .resizable()
                .scaledToFit()
            
            TextField("Type a name", text: $personName)
            
            Button {
                //TODO: save new contact
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
        .onChange(of: inputImage) { loadImage() }
        .sheet(isPresented: $showingImagePicker, content: {
            ImagePicker(image: $inputImage)
        })
        .padding(.horizontal, 20)
    }
    
    func loadImage() {
        guard let wrappeImage = inputImage else { return }
        image = Image(uiImage: wrappeImage)
    }
    
}

#Preview {
    NavigationStack {
        AddNewPersonView()
    }
    
}
