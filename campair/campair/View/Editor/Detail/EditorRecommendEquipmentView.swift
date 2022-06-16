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
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        if let title = self.equipmentContent.title {
                            Text("\(title)")
                                .headlineDefaultBlack()
                                .padding(.bottom, 10)
                                .padding(.top, 40)
                        }
                        if let upperContent = self.equipmentContent.upperContent {
                            Text("\(upperContent)")
                                .bodyDefaultDarkGray()
                                .padding(.bottom, 20)
                        }
                        let recommendedEquipments = self.equipmentContent.recommendedEquipments
                        ForEach(recommendedEquipments.indices) { index in
                            RecommendedEquipmentCardView(equipment: recommendedEquipments[index])
                                .padding(.top, index > 0 ? 6 : 0)
                        }
                        if let lowerContent = self.equipmentContent.lowerContent {
                            Text("에디터 팁")
                                .font(.system(.headline, design: .default))
                                .padding(.top, 20)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.customDarkGray)
                            Text("\(lowerContent)")
                                .bodyDefaultDarkGray()
                                .padding(.bottom, 40)
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
        EditorRecommendEquipmentView(equipmentContent:
                                        EquipmentContent(
                                            title: "경량의자",
                                            upperContent: "산에서도 바다에서도 의자만 있다면 그곳이 여러분의 차크닉 장소예요. 드넓은 초원과 끝없이 이어지는 바다를 바라보는 것에서 차크닉의 힐링이 시작돼요. 앉아서 즐기는 모든 것들을 경량 의자와 함께하세요.",
                                            recommendedEquipments: [
                                                ContentEquipment(name: "경량의자", paintingURLString: "경량의자")
                                            ],
                                            lowerContent: "평범한 자동차 여행에서 작지만 확실한 행복을 경량 의자에서 느낄 수 있어요. 혼자 또 같이 소소한 힐링을 느껴보세요."
                                        )
        )
    }
}
