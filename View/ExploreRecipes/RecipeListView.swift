//
//  ContentView.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 21/07/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    private let listBackgroundColor = AppColor.background
    private let listForegroundColor = AppColor.foreground

    
    var body: some View {
       // NavigationView{
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: binding(for: recipe)))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listForegroundColor)
        }
        .navigationTitle(navigationTitle)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresenting = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
        .sheet(isPresented: $isPresenting, content: {
            NavigationView {
                ModifyRecipeView(recipe: $newRecipe)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss"){
                                isPresenting = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            if newRecipe.isValid {
                            Button("Add") {
                                recipeData.add(recipe: newRecipe)
                                isPresenting = false
                            }
                            }
                        }
                    })
                    .navigationTitle("Add a New Recipe")
            }
        })
    }
    }
//}
extension RecipeListView  {
    
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
    func binding(for recipe: Recipe) -> Binding<Recipe> {
        guard let index = recipeData.index(of: recipe) else {
            fatalError("Recipe not found")
        }
        return $recipeData.recipes[index]
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeListView(category: .breakfast)
                .environmentObject(RecipeData())
    }
    }
}
