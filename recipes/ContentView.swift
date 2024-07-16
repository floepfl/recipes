//
//  ContentView.swift
//  recipes
//
//  Created by Florian Ravasi on 08/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var recipes = sampleRecipes
    @State private var showingAddRecipeView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        HStack {
                            recipe.image
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .shadow(radius: 2)
                            Text(recipe.title)
                                .font(.headline)
                        }
                    }
                }
                .navigationTitle("Recipes")
                .navigationBarItems(trailing: Button(action: {
                    showingAddRecipeView = true
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddRecipeView) {
                    AddRecipeView(recipes: $recipes)
                }
                
                // Floating action button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showingAddRecipeView = true
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

