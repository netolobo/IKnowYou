//
//  AddNewPersonViewModel.swift
//  IKnowYou
//
//  Created by Neto Lobo on 03/12/23.
//

import Foundation
import SwiftUI
import UIKit

@Observable
class AddNewPersonViewModel {
    var showingImagePicker = true
    var inputImage: UIImage?
    var image: Image?
    var personName = ""
    var selectedPerson: Person?
    
    func loadImage() {
        guard let wrappeImage = inputImage else { return }
        image = Image(uiImage: wrappeImage)
    }
    
    func updatePerson() -> Person? {
        guard let imageData = inputImage?.jpegData(compressionQuality: 0.8) else {
            return nil
        }
        
        selectedPerson = Person(id: UUID(), name: personName, image: imageData)
        
        return selectedPerson
    }
    
    
   
}
