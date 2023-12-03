//
//  PersonListViewModel.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import Foundation

@Observable
class PersonListViewModel {
    var people = [Person]() {
        didSet {
            if let enconde = try? JSONEncoder().encode(people) {
                UserDefaults.standard.set(enconde, forKey: "People")
            }
        }
    }
    
    init() {
        if let savedPeople = UserDefaults.standard.data(forKey: "People") {
            if let decodedPeople = try? JSONDecoder().decode([Person].self, from: savedPeople) {
                people = decodedPeople
                return
            }
        }
        
        people = []
    }
    
}
