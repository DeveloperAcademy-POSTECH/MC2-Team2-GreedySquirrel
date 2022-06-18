//
//  EditorCardView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/14.
//

import SwiftUI

struct EditorCardView: View {
    let cardPaintingBackgroundColor: String
    let cardPaintingSubTitleColor: String
    let cardPaintingSubTitle: String
    let cardPaintingTitle: String
    let cardPaintingImage: Data
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 6) {
                Text(cardPaintingSubTitle)
                    .foregroundColor(Color(hex: cardPaintingSubTitleColor))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(cardPaintingTitle)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.top, 34)
            .padding(.leading, 20)
            Image(uiImage: UIImage(data: cardPaintingImage) ?? UIImage(systemName: "xmark")!)
                .resizable()
                .scaledToFit()
                .padding(20)
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color(hex: cardPaintingBackgroundColor))
        )
    }
}
//
// struct EditorCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditorCardView()
//            .previewDevice("iPod touch (7th generation)")
//    }
// }
