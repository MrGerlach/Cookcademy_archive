//
//  MainTabVIew.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 11/09/2022.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem { Label("Recipes", systemImage: "list.dash")}
            NavigationView {
                RecipeListView(viewStyle: .favorites)
            } .tabItem { Label("Favorites", systemImage: "heart.fill")}
        }
        .environmentObject(recipeData)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
