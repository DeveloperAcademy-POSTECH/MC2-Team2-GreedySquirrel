//
//  EditorRecommendEquipmentView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct EditorRecommendEquipmentView: View {
    let equipmentContent: EquipmentContent
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 0) {
                        if let title = self.equipmentContent.title {
                            Text("\(title)")
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                                .padding(.top, 40)
                        }
                        if let upperContent = self.equipmentContent.upperContent {
                            Text("\(upperContent)")
                                .foregroundColor(Color.customTextGray)
                        }
                        let recommendedEquipments = self.equipmentContent.recommendedEquipments
                        ForEach(recommendedEquipments.indices) { index in
                            RecommendedEquipmentCardView(equipment: recommendedEquipments[index])
                        }
                        if let lowerContent = self.equipmentContent.lowerContent {
                            Text("\(lowerContent)")
                                .padding(.bottom, 40)
                                .foregroundColor(Color.customTextGray)
                                .padding(.top, 30)
                        }
                    }
                }
            }
            .padding(.horizontal, 25)
        }
    }
}
struct EditorRecommendEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        EditorRecommendEquipmentView(equipmentContent: EquipmentContent(
            title: "경량 의자",
            upperContent: "산에서도 바다에서도 의자만 있다면 그곳이 여러분의 차크닉 장소예요. 드넓은 초원과 끝없이 이어지는 바다를 바라보는 것에서 차크닉의 힐링이 시작돼요. 앉아서 즐기는 모든 것들을 경량 의자와 함께하세요.",
            recommendedEquipments: [
                Equipment(
                    paintingURL: "주소",
                    title: "경량 의자",
                    content: "릴렉스 체어는 엉덩이부터 목 바로 아래까지 몸 전체를 감싸 주는 형태의 의자예요. 앉으면 하늘을 보며 반쯤 누워있는 편한 자세를 취할 수 있어요.",
                    pros: ["의자에서 누워있는 듯한 느낌이에요. \'쉼\'을 목적으로 나온 의자.", "다리 폭이 넓어서 넘어질 위험이 적어요."],
                    cons: ["접었을 때도 사이즈가 크고 무거워요.", "앉아서 음식을 먹거나 책을 읽을 때는 불편할 수 있어요."])
            ],
            lowerContent: "평범한 자동차 여행에서 작지만 확실한 행복을 경량 의자에서 느낄 수 있어요. 혼자 또 같이 소소한 힐링을 느껴보세요. 용도에 따라 취향에 따라 부피에 따라 다양한 의자를 사용해보세요."))
    }
}
