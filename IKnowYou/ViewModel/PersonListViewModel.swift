//
//  PersonListViewModel.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import Foundation

@Observable
class PersonListViewModel {
    let savePath = FileManager.documentsDirectory.appending(path: "SavedPeople")
    var selectedPerson: Person?
    
    var people = [Person]() {
        didSet {
            do  {
                let data = try JSONEncoder().encode(people)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
    }
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            people = []
        }
    }
    
    func updatePerson(person: Person) {
        guard let selectedPerson = selectedPerson else { return }
        
        if let index = people.firstIndex(of: selectedPerson) {
            people[index] = person
        }
    }
    
    func saveNewPerson(newPerson: Person) {
        people.append(newPerson)
    }
    
    func removePerson(person: Person) {
        guard let index = people.firstIndex(of: person) else { return }
        people.remove(at: index)
    }
    
}
