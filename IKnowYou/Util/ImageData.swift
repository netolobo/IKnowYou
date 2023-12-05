//
//  Image.swift
//  IKnowYou
//
//  Created by Neto Lobo on 04/12/23.
//

import Foundation
import SwiftUI

struct ImageData {
    static func from(data: Data) -> Image {
        guard let img = UIImage(data: data) else { fatalError("Image couldn't be loaded from data")}
        return Image(uiImage: img)
    }
}
