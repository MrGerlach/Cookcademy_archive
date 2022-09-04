//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 27/08/2022.
//

import SwiftUI

  private let listBackgroundColor = AppColor.background
  private let listTextColor = AppColor.foreground

struct ModifyIngredientsView: View {
    
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient()
    
    
var body: some View {
        VStack {
            let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) {
                ingredient in ingredients.append(ingredient)
                newIngredient = Ingredient()
            }
            if ingredients.isEmpty {
                Spacer()
                NavigationLink("Add the first ingredient", destination: addIngredientView)
                Spacer()
            } else {
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }
                    NavigationLink("Add another ingredient", destination: addIngredientView)
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var emptyIngredients = [Ingredient]()
    static var previews: some View {
        NavigationView{
            ModifyIngredientsView(ingredients: $emptyIngredients)
    }
   }
}
