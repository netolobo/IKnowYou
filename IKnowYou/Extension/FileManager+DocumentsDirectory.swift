//
//  FileManager+DocumentsRepository.swift
//  IKnowYou
//
//  Created by Neto Lobo on 03/12/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
