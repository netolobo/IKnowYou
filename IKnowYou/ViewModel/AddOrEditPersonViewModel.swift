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
class AddOrEditPersonViewModel {
    var showingImagePicker = false
    var inputImage: UIImage? {
        didSet {
            guard let uiImage = inputImage else { return }
            
            guard let imageData = uiImage.jpegData(compressionQuality: 0.8) else {
                return
            }
            person?.image = imageData
        }
        

    }
    var image: Image?
    var personName : String = "" {
        didSet{
            person?.name = personName
        }
    }
    var person: Person?
    
    func loadImage() {
        guard let wrappeImage = inputImage else { return }
        image = Image(uiImage: wrappeImage)
    }
    
//    func updateOrAddPerson() -> Person {
//        
//        if person == nil {
//            return Person(id: UUID(), name: personName, image: person?.image)
//        }
//        
//        if let wrappedPerson = person {
//            person?.name = wrappedPerson.name
//            person?.image = wrappedPerson.image
//        } else {
//            
//        }
//        
//        
//        return person
//    }
    
    init(person: Person? = nil) {
        
        if let person = person {
            image = ImageData.from(data: person.image)
            self.personName = person.name
            self.inputImage = UIImage(data: person.image)
            self.person = person
        } else {
            self.person = Person(id: UUID(), image: Data())
        }
    }

   
}
