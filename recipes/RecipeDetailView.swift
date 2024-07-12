//
//  RecipeDetailView.swift
//  recipes
//
//  Created by Florian Ravasi on 11/07/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Ingredients")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- \(ingredient)")
                }
                .padding(.bottom)
                
                Text("Instructions")
                    .font(.headline)
                    .padding(.top)
                
                Text(recipe.instructions)
                    .padding(.bottom)
            }
            .padding()
        }
        .navigationTitle(recipe.title)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: sampleRecipes[0])
    }
}

