//
//  recipes.swift
//  recipes
//
//  Created by Florian Ravasi on 11/07/2024.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let ingredients: [String]
    let instructions: String
}
