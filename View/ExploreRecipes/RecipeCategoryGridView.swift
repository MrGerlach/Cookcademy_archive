//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 24/07/2022.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @EnvironmentObject private var recipeData: RecipeData
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(MainInformation.Category.allCases,
                        id: \.self) { category in
                    NavigationLink(
                        destination: RecipeListView(viewStyle: .singleCategory(category)) .environmentObject(recipeData), label: {
                    CategoryView(category: category)
                    })
              }
            })
            .navigationTitle("Categories")
        }
    }
}
}

    
    struct CategoryView: View {
        let category: MainInformation.Category
        
        var body: some View {
            ZStack{
                Image(category.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.4)
                Text(category.rawValue)
                    .font(.title)
            }
        }
    }
    
struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
