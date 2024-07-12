//
//  ContentView.swift
//  recipes
//
//  Created by Florian Ravasi on 08/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(sampleRecipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    Text(recipe.title)
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
