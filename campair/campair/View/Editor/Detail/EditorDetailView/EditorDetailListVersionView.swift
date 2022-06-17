//
//  ListVersionView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct EditorDetailListVersionView: View {
    @ObservedObject var viewModel: EditorDetailViewModel
    var body: some View {
        ScrollView {
            OpeningEditorView(openingSection: self.viewModel.editorDetailContent.openingSection, imageSet: $viewModel.imageSet)
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    let equipmentContents = self.viewModel.editorDetailContent.equipmentContents
                    ForEach(equipmentContents.indices, id: \.self) { index in
                        let equipmentContent = equipmentContents[index]
                        EditorRecommendEquipmentView(equipmentContent: equipmentContent, imageSet: $viewModel.imageSet)
                            .padding(.bottom, 36)
                    }
                }
            }
            .font(.system(size: 17))
            ShareRecommendedEquipmentView()
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.viewAppeared()
        }
    }
}

struct EditorDetailListVersionView_Previews: PreviewProvider {
    static var previews: some View {
        EditorDetailListVersionView(viewModel:
                                        EditorDetailViewModel(editorDetailContent:
                                                                EditorDetailContent(
                                                                    version: .contents,
                                                                    openingSection:
                                                                        OpeningSection(
                                                                            cardPaintingBackgroundColor: "E9DFD4",
                                                                            cardPaintingSubTitleColor: "EAA496",
                                                                            cardPaintingSubTitle: "초보차크닉",
                                                                            cardPaintingTitle: "차로 떠나는 피크닉",
                                                                            cardPaintingImageName: "차로_떠나는_피크닉",
                                                                            cardPaintingURLString: "주소",
                                                                            titleColor: "D98E7F",
                                                                            title: "최소한으로 차크닉을 떠날 때.",
                                                                            content: "떠나는 여행이 돌아왔어요. 간단한 장비들로 시작할 수 있는 차로 떠나는 피크닉, 차크닉을 떠나보세요!"
                                                                        ),
                                                                    equipmentContents: [
                                                                        EquipmentContent(
                                                                            title: nil,
                                                                            upperContent: nil,
                                                                            recommendedEquipments: [
                                                                                ContentEquipment(name: "경량의자2", paintingImageName: "경량의자", paintingURLString: "경량의자"),
                                                                                ContentEquipment(name: "경량의자3", paintingImageName: "경량의자", paintingURLString: "경량의자"),
                                                                                ContentEquipment(name: "경량의자4", paintingImageName: "경량의자", paintingURLString: "경량의자"),
                                                                                ContentEquipment(name: "경량의자5", paintingImageName: "경량의자", paintingURLString: "경량의자")
                                                                            ],
                                                                            lowerContent: nil
                                                                        )
                                                                    ]
                                                                )
                                                             )
        )
    }
}
