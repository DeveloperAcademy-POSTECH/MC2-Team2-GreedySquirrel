//
//  OpeningEditorView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct OpeningEditorView: View {
    let openingSection: OpeningSection
    @Binding var imageSet: [String: Data]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(self.openingSection.cardPaintingSubTitle)")
                        .font(.system(.subheadline))
                        .fontWeight(.regular)
                        .foregroundColor(
                            Color(hex: self.openingSection.cardPaintingSubTitleColor)
                        )
                        .padding(.bottom, 6)
                    Text("\(self.openingSection.cardPaintingTitle)")
                        .font(.system(.title))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: self.openingSection.cardPaintingTitleColor))
                        .padding(.bottom, 20)
                    if let uiImage = UIImage(data: imageSet[openingSection.cardPaintingImageName] ?? imageSet["none"]! ) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                    } else {
                        ProgressView()
                            .frame(width: 350, height: 300)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
                .padding(.top, 34 + UIDevice.current.getSafeAreaTopValue)
            }
            .background(Color(hex: self.openingSection.cardPaintingBackgroundColor))
            VStack(alignment: .leading, spacing: 10) {
                Text("\(self.openingSection.title)")
                    .foregroundColor(Color(hex: self.openingSection.titleColor))
                    .font(.system(.headline, design: .default))
                Text("\(self.openingSection.content)")
                    .bodyDefaultDarkGray()
                // TODO : 스케치에서는 26으로 되어있는데 폰트 사이즈를 빼서 계산을 해야 한다고... but 쉬운 방법이 있을 거 같아서 찾아보는 중입니다.
                    .lineSpacing(5.0)
            }
            .padding(.horizontal, 25)
            .padding(.top, 40)
            .padding(.bottom, 20)
        }
    }
}

struct OpeningEditorView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningEditorView(openingSection:
                            OpeningSection(
                                cardPaintingBackgroundColor: "E9DFD4",
                                cardPaintingSubTitleColor: "EAA496",
                                cardPaintingSubTitle: "초보차크닉",
                                cardPaintingTitleColor: "FFFFFF",
                                cardPaintingTitle: "차로 떠나는 피크닉",
                                cardPaintingURLString: "주소",
                                titleColor: "D98E7F",
                                title: "최소한으로 차크닉을 떠날 때.",
                                content: "떠나는 여행이 돌아왔어요. 간단한 장비들로 시작할 수 있는 차로 떠나는 피크닉, 차크닉을 떠나보세요!"
                            ), imageSet: .constant(["none": Data()])
        )
    }
}
