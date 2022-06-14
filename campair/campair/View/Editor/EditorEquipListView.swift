//
//  EditorEquipListView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/14.
//

import SwiftUI

struct EditorEquipListView: View {
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<4) { _ in
                VStack {
                    Image("FoldingChair")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 23)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color(#colorLiteral(red: 0.9317113757, green: 0.8984663486, blue: 0.8601023555, alpha: 1)))
                        )
                    Text("폴딩체어")
                        .foregroundColor(Color(#colorLiteral(red: 0.3014614582, green: 0.3024801612, blue: 0.332264483, alpha: 0.8470588235)))
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

struct EditorEquipListView_Previews: PreviewProvider {
    static var previews: some View {
        EditorEquipListView()
        EditorEquipListView()
            .previewDevice("iPod touch (7th generation)")
    }
}
