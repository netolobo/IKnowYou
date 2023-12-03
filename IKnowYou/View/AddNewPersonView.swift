//
//  AddNewPersonView.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import SwiftUI

struct AddNewPersonView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingImagePicker = true
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var personName = ""
    
    var body: some View {
            VStack {
                image?
                    .resizable()
                    .scaledToFit()
                
                TextField("Type a name", text: $personName)
                
            }
            .toolbar {
                Button {
                    //TODO: save new contact
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
            .onChange(of: inputImage) { loadImage() }
            .sheet(isPresented: $showingImagePicker, content: {
                ImagePicker(image: $inputImage)
            })
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
