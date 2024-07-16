//
//  AddRecipeView.swift
//  recipes
//
//  Created by Florian Ravasi on 12/07/2024.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var recipes: [Recipe]
    
    @State private var title = ""
    @State private var selectedImage: UIImage? = nil
    @State private var ingredients: [String] = [""]
    @State private var instructions = ""
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Recipe Title", text: $title)
                }
                
                Section(header: Text("Image")) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .onTapGesture {
                                showingImagePicker = true
                            }
                    } else {
                        Button(action: {
                            showingImagePicker = true
                        }) {
                            Text("Select Image")
                        }
                    }
                }
                
                Section(header: Text("Ingredients")) {
                    ForEach(ingredients.indices, id: \.self) { index in
                        HStack {
                            TextField("Ingredient", text: $ingredients[index])
                            Button(action: {
                                if ingredients.count > 1 {
                                    ingredients.remove(at: index)
                                }
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    Button(action: {
                        ingredients.append("")
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Ingredient")
                        }
                    }
                }
                
                Section(header: Text("Instructions")) {
                    TextEditor(text: $instructions)
                }
            }
            .navigationTitle("Add Recipe")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                guard let selectedImage = selectedImage else { return }
                
                // Save the image to the app's document directory and get the file name
                let imageName = UUID().uuidString + ".jpg"
                if let data = selectedImage.jpegData(compressionQuality: 0.8) {
                    let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
                    try? data.write(to: url)
                }
                
                let newRecipe = Recipe(
                    title: title,
                    imageName: imageName,
                    ingredients: ingredients.filter { !$0.isEmpty },
                    instructions: instructions
                )
                recipes.append(newRecipe)
                presentationMode.wrappedValue.dismiss()
            })
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView(recipes: .constant(sampleRecipes))
    }
}
