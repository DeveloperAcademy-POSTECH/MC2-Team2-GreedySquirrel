//
//  RecommendedEquipmentCardView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct RecommendedEquipmentCardView: View {
    let equipment: ContentEquipment
    var body: some View {
        HStack(spacing: 0) {
            Image("exampleEquipment")
                .resizable()
                .scaledToFit()
                .frame(width: 66, height: 66)
                .padding(.horizontal, 10)
            VStack(alignment: .leading, spacing: 5) {
                Text("\(self.equipment.name)")
                    .headlineDefaultBlack()
                    .padding(.bottom, 4)
                    .padding(.top, 22)
                Text("장비사전 읽어보기")
                    .caption1DefaultDarkGray()
                    .padding(.bottom, 22)
            }
            Spacer()
            Image("buttonArrow")
                .resizable()
                .scaledToFit()
                .frame(width: 34, height: 34)
                .foregroundColor(Color(hex: "D1D1D6"))
                .foregroundColor(Color.red)
                .padding(.trailing, 14)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                .foregroundColor(Color.customLightGray)
        )
    }
}

struct RecommendedEquipmentCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedEquipmentCardView(equipment:
                                        ContentEquipment(
                                            name: "돗자리",
                                            paintingURLString: "주소"
                                        )
        )
    }
}
