//
//  ListVersionView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct EditorDetailListVersionView: View {
    @ObservedObject var editorDetailContent: EditorDetailViewModel
    var body: some View {
        ScrollView {
            OpeningEditorView(openingSection: self.editorDetailContent.content.opening)
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    let equipmentContents = self.editorDetailContent.content.equipmentContents
                    ForEach(equipmentContents.indices) { index in
                        let equipmentContent = equipmentContents[index]
                        EditorRecommendEquipmentView(equipmentContent: equipmentContent)
                            .padding(.bottom, 36)
                    }
                }
            }
            .font(.system(size: 17))
            ShareRecommendedEquipmentView()
        }
        .ignoresSafeArea()
    }
}

struct EditorDetailListVersionView_Previews: PreviewProvider {
    static var previews: some View {
        EditorDetailListVersionView(editorDetailContent:
                                        EditorDetailViewModel(editorDetailContent:
                                                                EditorContent(
                                                                    version: EditorVersion.contents,
                                                                    opening: OpeningSection(
                                                                        cardPaintingBackgroundColor: "E9DFD4",
                                                                        cardPaintingTextColor: "EAA496",
                                                                        cardPaintingURL: "주소",
                                                                        cardTitleColor: "D98E7F",
                                                                        cardTitle: "차로 떠나는 피크닉",
                                                                        cardSubTitle: "초보차크닉",
                                                                        title: "최소한으로 차크닉을 떠날 때.",
                                                                        subTitle: "떠나는 여행이 돌아왔어요. 간단한 장비들로 시작할 수 있는 차로 떠나는 피크닉, 차크닉을 떠나보세요!"),
                                                                    equipmentContents: [
                                                                        EquipmentContent(
                                                                            title: nil,
                                                                            upperContent: nil,
                                                                            recommendedEquipments: [
                                                                                Equipment(
                                                                                    paintingURL: "주소",
                                                                                    title: "경량 의자",
                                                                                    content: "릴렉스 체어는 엉덩이부터 목 바로 아래까지 몸 전체를 감싸 주는 형태의 의자예요. 앉으면 하늘을 보며 반쯤 누워있는 편한 자세를 취할 수 있어요.",
                                                                                    pros: ["의자에서 누워있는 듯한 느낌이에요. \'쉼\'을 목적으로 나온 의자.", "다리 폭이 넓어서 넘어질 위험이 적어요."],
                                                                                    cons: ["접었을 때도 사이즈가 크고 무거워요.", "앉아서 음식을 먹거나 책을 읽을 때는 불편할 수 있어요."]),
                                                                                Equipment(
                                                                                    paintingURL: "주소",
                                                                                    title: "경량 의자",
                                                                                    content: "릴렉스 체어는 엉덩이부터 목 바로 아래까지 몸 전체를 감싸 주는 형태의 의자예요. 앉으면 하늘을 보며 반쯤 누워있는 편한 자세를 취할 수 있어요.",
                                                                                    pros: ["의자에서 누워있는 듯한 느낌이에요. \'쉼\'을 목적으로 나온 의자.", "다리 폭이 넓어서 넘어질 위험이 적어요."],
                                                                                    cons: ["접었을 때도 사이즈가 크고 무거워요.", "앉아서 음식을 먹거나 책을 읽을 때는 불편할 수 있어요."]),
                                                                                Equipment(
                                                                                    paintingURL: "주소",
                                                                                    title: "경량 의자",
                                                                                    content: "릴렉스 체어는 엉덩이부터 목 바로 아래까지 몸 전체를 감싸 주는 형태의 의자예요. 앉으면 하늘을 보며 반쯤 누워있는 편한 자세를 취할 수 있어요.",
                                                                                    pros: ["의자에서 누워있는 듯한 느낌이에요. \'쉼\'을 목적으로 나온 의자.", "다리 폭이 넓어서 넘어질 위험이 적어요."],
                                                                                    cons: ["접었을 때도 사이즈가 크고 무거워요.", "앉아서 음식을 먹거나 책을 읽을 때는 불편할 수 있어요."])
                                                                            ],
                                                                            lowerContent: nil)
                                                                    ]
                                                                )
                                                             )
        )
    }
}
