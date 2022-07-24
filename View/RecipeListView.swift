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
    
    private let listBackgroundColor = AppColor.background
    private let listForegroundColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listForegroundColor)
        }
        .navigationTitle(navigationTitle)
    }
}
extension RecipeListView  {
    
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
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
