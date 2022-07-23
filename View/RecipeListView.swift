//
//  ContentView.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 21/07/2022.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var recipeData = RecipeData()
    
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
    var recipes: [Recipe] {
        recipeData.recipes
    }
    var navigationTitle: String {
        "All Recipes"
    }
}
struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        RecipeListView()
    }
    }
}
