//
//  EditorDetailView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct EditorDetailView: View {
    @StateObject var viewModel: EditorDetailViewModel = EditorDetailViewModel()
    @Binding var showModal: Bool
    let filename: String
    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationView {
                switch self.viewModel.editorDetailContent.version {
                case .contents :
                    EditorDetailContentsVersionView(viewModel: self.viewModel, fileName: self.filename)
                        .navigationBarHidden(true)
                case .list :
                        EditorDetailListVersionView(viewModel: self.viewModel, fileName: self.filename)
                        .navigationBarHidden(true)
                }
            }
            Button {
                showModal.toggle()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(Color(hex: "EAA496"))
                    .padding(20)
            }
        }
    }
}

struct EditorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EditorDetailView(viewModel:
                            EditorDetailViewModel(
                                editorDetailContent: EditorDetailContent(
                                    version: .contents,
                                    openingSection: OpeningSection(
                                        cardPaintingBackgroundColor: "E9DFD4",
                                        cardPaintingSubTitleColor: "EAA496",
                                        cardPaintingSubTitle: "초보차크닉",
                                        cardPaintingTitle: "차로 떠나는 피크닉",
                                        cardPaintingURLString: "주소",
                                        titleColor: "D98E7F",
                                        title: "최소한으로 차크닉을 떠날 때.",
                                        content: "떠나는 여행이 돌아왔어요. 간단한 장비들로 시작할 수 있는 차로 떠나는 피크닉, 차크닉을 떠나보세요!"
                                    ),
                                    equipmentContents: [
                                        EquipmentContent(
                                            title: "경량의자",
                                            upperContent: "산에서도 바다에서도 의자만 있다면 그곳이 여러분의 차크닉 장소예요. 드넓은 초원과 끝없이 이어지는 바다를 바라보는 것에서 차크닉의 힐링이 시작돼요.",
                                            recommendedEquipments: [
                                                ContentEquipment()
                                            ],
                                            lowerContent: "평범한 자동차 여행에서 작지만 확실한 행복을 경량 의자에서 느낄 수 있어요. 혼자 또 같이 소소한 힐링을 느껴보세요."
                                        )
                                    ]
                                )
                            ), showModal: .constant(false), filename: "Content_1"
        )
    }
}
