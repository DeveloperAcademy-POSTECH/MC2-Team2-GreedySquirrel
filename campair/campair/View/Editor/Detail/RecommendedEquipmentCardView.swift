//
//  RecommendedEquipmentCardView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct RecommendedEquipmentCardView: View {
    let equipment: Equipment
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 1)
            .foregroundColor(Color.customLightGray)
            .frame(width: .infinity, height: 84)
            .overlay(
                HStack(spacing: 0) {
                    Image("exampleEquipment")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 66, height: 66)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 9)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(self.equipment.title)")
                            .font(.system(.headline, design: .default))
                            .foregroundColor(Color.customBlack)
                            .padding(.bottom, 4)
                        Text("장비사전 읽어보기")
                            .font(.system(.caption, design: .default))
                            .foregroundColor(Color.customDarkGray)
                    }
                    Spacer()
                    Image("buttonArrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 34)
                        .foregroundColor(Color(#colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.8392156863, alpha: 1)))
                        .foregroundColor(Color.red)
                        .padding(.trailing, 14)
                }
                .padding(.vertical, 20)
            )
    }
}

struct RecommendedEquipmentCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedEquipmentCardView(equipment: Equipment(
            paintingURL: "주소",
            title: "돗자리",
            content: "돗자리 상세 content",
            pros: [
                "돗자리 장점 1",
                "돗자리 장점 2"
            ],
            cons: [
                "돗자리 단점 1",
                "돗자리 단점 2"
            ]
        ))
    }
}
