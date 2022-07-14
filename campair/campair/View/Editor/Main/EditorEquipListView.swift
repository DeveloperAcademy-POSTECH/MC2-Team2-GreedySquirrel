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
    let cardPaintingBackgroundColor: String
    var body: some View {
        VStack {
            if let uiImage = UIImage(data: paintingImage) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(hex: cardPaintingBackgroundColor))
                    )
            } else {
                ProgressView()
                    .frame(width: 83, height: 83)
            }
            Text(name)
                .foregroundColor(Color(#colorLiteral(red: 0.3014614582, green: 0.3024801612, blue: 0.332264483, alpha: 0.8470588235)))
                .font(.system(size: 13))
                .fontWeight(.semibold)
        }
    }
}

 struct EditorEquipListView_Previews: PreviewProvider {
    static var previews: some View {
        EditorEquipListView(name: "", paintingImage: Data(), cardPaintingBackgroundColor: "ffffff")
            .previewDevice("iPod touch (7th generation)")
    }
 }
