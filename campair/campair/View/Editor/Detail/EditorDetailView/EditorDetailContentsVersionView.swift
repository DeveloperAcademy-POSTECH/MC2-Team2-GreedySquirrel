//
//  EditorDetailView.swift
//  campair
//
//  Created by 이가은 on 2022/06/13.
//

import SwiftUI

struct EditorDetailContentsVersionView: View {
    @ObservedObject var editorDetailContent: EditorDetailViewModel
    var body: some View {
        ScrollView {
//            OpeningEditorView(openingSection: self.editorDetailContent.content.opening)
//            VStack(alignment: .leading, spacing: 0) {
//                VStack(alignment: .leading, spacing: 0) {
//                    let equipmentContents = self.editorDetailContent.content.equipmentContents
//                    ForEach(equipmentContents.indices) { index in
//                        let equipmentContent = equipmentContents[index]
//                        EditorRecommendEquipmentView(equipmentContent: equipmentContent)
//                        let lastIndexOfEquipmentContents = equipmentContents.count - 1
//                        if index != lastIndexOfEquipmentContents {
//                            Rectangle()
//                                .frame(height: 8)
//                                .foregroundColor(Color(#colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.9843137255, alpha: 1)))
//                        }
//                    }
//                }
//            }
//            .font(.system(size: 17))
//            ShareRecommendedEquipmentView()
        }
        .ignoresSafeArea()
    }
}
//
//struct EditorDetailContentsVersionView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditorDetailContentsVersionView(editorDetailContent:
//                                            EditorDetailViewModel(editorDetailContent:
//                                                                    EditorContent(
//                                                                        version: EditorVersion.contents,
//                                                                        opening: OpeningSection(
//                                                                            cardPaintingBackgroundColor: "E9DFD4",
//                                                                            cardPaintingTextColor: "EAA496",
//                                                                            cardPaintingURL: "주소",
//                                                                            cardTitleColor: "D98E7F",
//                                                                            cardTitle: "차로 떠나는 피크닉",
//                                                                            cardSubTitle: "초보차크닉",
//                                                                            title: "최소한으로 차크닉을 떠날 때.",
//                                                                            subTitle: "떠나는 여행이 돌아왔어요. 간단한 장비들로 시작할 수 있는 차로 떠나는 피크닉, 차크닉을 떠나보세요!"),
//                                                                        equipmentContents: [
//                                                                            EquipmentContent(
//                                                                                title: "경량 의자",
//                                                                                upperContent: "산에서도 바다에서도 의자만 있다면 그곳이 여러분의 차크닉 장소예요. 드넓은 초원과 끝없이 이어지는 바다를 바라보는 것에서 차크닉의 힐링이 시작돼요.",
//                                                                                recommendedEquipments: [
//                                                                                    Equipment(
//                                                                                        paintingURL: "주소",
//                                                                                        title: "경량 의자",
//                                                                                        content: "릴렉스 체어는 엉덩이부터 목 바로 아래까지 몸 전체를 감싸 주는 형태의 의자예요. 앉으면 하늘을 보며 반쯤 누워있는 편한 자세를 취할 수 있어요.",
//                                                                                        pros: ["의자에서 누워있는 듯한 느낌이에요. \'쉼\'을 목적으로 나온 의자.", "다리 폭이 넓어서 넘어질 위험이 적어요."],
//                                                                                        cons: ["접었을 때도 사이즈가 크고 무거워요.", "앉아서 음식을 먹거나 책을 읽을 때는 불편할 수 있어요."])
//                                                                                ],
//                                                                                lowerContent: "평범한 자동차 여행에서 작지만 확실한 행복을 경량 의자에서 느낄 수 있어요. "),
//                                                                            EquipmentContent(
//                                                                                title: "돗자리",
//                                                                                upperContent: "돗자리 upperContent",
//                                                                                recommendedEquipments: [
//                                                                                    Equipment(
//                                                                                        paintingURL: "주소",
//                                                                                        title: "돗자리",
//                                                                                        content: "돗자리 상세 content",
//                                                                                        pros: [
//                                                                                            "돗자리 장점 1",
//                                                                                            "돗자리 장점 2"
//                                                                                        ],
//                                                                                        cons: [
//                                                                                            "돗자리 단점 1",
//                                                                                            "돗자리 단점 2"
//                                                                                        ]
//                                                                                    )
//                                                                                ],
//                                                                                lowerContent: "돗자리 lowerContent"
//                                                                            ), EquipmentContent(
//                                                                                title: "이런 장비도 있으면 좋아요.",
//                                                                                upperContent: "그늘이 없는 곳으로 차크닉을 떠나면 햇빛의 공격을 받을 수 있어요. 햇빛을 가릴 수 있는 어닝이나 타프 혹은 그늘막텐트를 구비하면 오랜 시간 차크닉을 즐길 수 있을 거에요.",
//                                                                                recommendedEquipments: [
//                                                                                    Equipment(
//                                                                                        paintingURL: "주소",
//                                                                                        title: "어닝/사이드월",
//                                                                                        content: "어닝/사이드월 상세 content",
//                                                                                        pros: [
//                                                                                            "어닝/사이드월 장점 1",
//                                                                                            "어닝/사이드월 장점 2"
//                                                                                        ],
//                                                                                        cons: [
//                                                                                            "어닝/사이드월 단점 1",
//                                                                                            "어닝/사이드월 단점 2"]
//                                                                                    ),
//                                                                                    Equipment(
//                                                                                        paintingURL: "주소",
//                                                                                        title: "렉타 타프",
//                                                                                        content: "렉타 타프 상세 content",
//                                                                                        pros: [
//                                                                                            "렉타 타프 장점 1",
//                                                                                            "렉타 타프 장점 2"
//                                                                                        ],
//                                                                                        cons: [
//                                                                                            "렉타 타프 단점 1",
//                                                                                            "렉타 타프 단점 2"
//                                                                                        ]
//                                                                                    )
//                                                                                ],
//                                                                                lowerContent:
//                                                                                    "차크닉, 차박, 캠핑에 필요한 장비 다 볼 수 있어요. 더 많은 장비를 만나보고 싶다면, 장비 사전 탭을 방문하세요."
//                                                                            )
//                                                                        ]
//                                                                    )
//                                                                 )
//        )
//    }
//}
