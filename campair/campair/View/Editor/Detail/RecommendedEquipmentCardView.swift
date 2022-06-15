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
        HStack(spacing: 0) {
            Image("exampleEquipment")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.horizontal, 20)
            VStack(alignment: .leading, spacing: 5) {
                Text("장비사전 읽어보기")
                    .font(.system(size: 12))
                    .foregroundColor(Color.customTextGray)
                Text("\(self.equipment.title)")
            }
            Spacer()
            Image(systemName: "heart.fill")
                .padding(.trailing, 30)
                .font(.system(size: 20))
                .foregroundColor(Color.customSelectedHeartRed)
        }
        .padding(.vertical, 20)
        .background(Color.customCardGray)
        .cornerRadius(20)
        .padding(.top, 30)
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
