//
//  tabbarView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/18.
//

import SwiftUI

struct TabbarView: View {
    let editorIcon = UIImage(named: "EditorTabbarImage")
    let dictionaryIcon = UIImage(named: "DictionaryTabbarImage")
    let interestEquipmentIcon = UIImage(named: "InterestEquipmentImage")
    var body: some View {
        TabView {
            DictionaryMainView()
                .tabItem {
                    Image(uiImage: dictionaryIcon!)
                    Text("장비사전")
                }
            EditorMainView()
                .tabItem {
                    Image(uiImage: editorIcon!)
                    Text("에디터")
                }
            InterestEquipmentView()
                .tabItem {
                    Image(uiImage: interestEquipmentIcon!)
                    Text("관심장비")
                }
        }
        .environmentObject(InterestEquipmentViewModel())
        .accentColor(Color(hex: "4F4F4F"))
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
