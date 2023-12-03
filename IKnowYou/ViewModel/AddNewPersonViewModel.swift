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
    
    func loadImage() {
        guard let wrappeImage = inputImage else { return }
        image = Image(uiImage: wrappeImage)
    }
    
    
//    func updatePerson(person: Person) {
//        guard let selectedPerson = selectedPerson else { return }
//        
//        if let index = people.firstIndex(of: selectedPerson) {
//            people[index] = person
//        }
//    }
}
