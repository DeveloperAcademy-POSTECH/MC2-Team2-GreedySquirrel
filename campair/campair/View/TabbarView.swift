//
//  tabbarView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/18.
//

import SwiftUI

struct TabbarView: View {
    let editorIcon = UIImage(named: "EditorTabbarIcon")
    let dictionaryIcon = UIImage(named: "DictionaryTabbarIcon")
    let interestEquipmentIcon = UIImage(named: "InterestEquipmentIcon")
    var body: some View {
        NavigationView {
            TabView {
                EditorMainView()
                    .tabItem {
                        Image(uiImage: editorIcon!)
                        Text("에디터")
                    }
                DictionaryMainView()
                    .tabItem {
                        Image(uiImage: dictionaryIcon!)
                        Text("장비사전")
                    }
                InterestEquipmentView()
                    .tabItem {
                        Image(uiImage: interestEquipmentIcon!)
                        Text("관심장비")
                    }
            }
            .navigationBarHidden(true)
            .environmentObject(InterestEquipmentViewModel())
            .accentColor(Color(hex: "4F4F4F"))
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
