//
//  EditorEquipListView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/14.
//

import SwiftUI

struct EditorEquipListView: View {
    let name: String
    let paintingImage: Data
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: paintingImage) ?? UIImage(systemName: "xmark")!)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 23)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundColor(Color(#colorLiteral(red: 0.9317113757, green: 0.8984663486, blue: 0.8601023555, alpha: 1)))
                )
            Text(name)
                .foregroundColor(Color(#colorLiteral(red: 0.3014614582, green: 0.3024801612, blue: 0.332264483, alpha: 0.8470588235)))
                .font(.footnote)
                .fontWeight(.semibold)
        }
    }
}

// struct EditorEquipListView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditorEquipListView()
//        EditorEquipListView()
//            .previewDevice("iPod touch (7th generation)")
//    }
// }
