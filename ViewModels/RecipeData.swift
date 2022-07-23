//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 23/07/2022.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
