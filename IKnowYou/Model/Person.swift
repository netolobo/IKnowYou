//
//  Person.swift
//  IKnowYou
//
//  Created by Neto Lobo on 02/12/23.
//

import Foundation

struct Person: Identifiable, Comparable, Codable {
    var id: UUID
    var name: String
    var image: Data
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}
