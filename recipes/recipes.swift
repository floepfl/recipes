//
//  recipes.swift
//  recipes
//
//  Created by Florian Ravasi on 11/07/2024.
//
import Foundation
import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let ingredients: [String]
    let instructions: String
    
    var image: Image {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
        if let uiImage = UIImage(contentsOfFile: url.path) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "photo")
        }
    }
}
