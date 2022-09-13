//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 27/08/2022.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @AppStorage(“listBackgroundColor”) private var listBackgroundColor = AppColor.background
    @AppStorage(“listTextColor”) private var listTextColor = AppColor.foreground
    
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form {
            TextField("Recipe name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
                        .listRowBackground(listBackgroundColor)
                        .foregroundColor(listTextColor)
            }
            Picker(selection: $mainInformation.category, label:
                    HStack {
                        Text("Category")

                        Spacer()

                        Text(mainInformation.category.rawValue)
                }) {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in Text(category.rawValue)
                    }
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            .pickerStyle(MenuPickerStyle())
        }
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name", description: "Test Description", author: "Test Author", category: .breakfast)
    @State static var emptyInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)
   static var previews: some View {
//       ModifyMainInformationView(mainInformation: $mainInformation)
               ModifyMainInformationView(mainInformation: $emptyInformation)
    }
}
