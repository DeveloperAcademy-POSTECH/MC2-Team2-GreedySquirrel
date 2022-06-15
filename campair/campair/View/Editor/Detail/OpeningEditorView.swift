//
//  OpeningEditorView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct OpeningEditorView: View {
    let openingSection: OpeningSection
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(self.openingSection.cardTitle)")
                        .font(.system(.subheadline))
                        .fontWeight(.regular)
                        .foregroundColor(Color(hex: self.openingSection.cardPaintingTextColor))
                        .padding(.bottom, 6)
                    Text("\(self.openingSection.cardSubTitle)")
                        .font(.system(.title2))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                Image("contentCard2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 300)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 34 + UIDevice.current.getSafeAreaTopValue)
            }
            .background(Color(hex: self.openingSection.cardPaintingBackgroundColor))
            VStack(alignment: .leading, spacing: 10) {
                Text("\(self.openingSection.title)")
                    .foregroundColor(Color(hex: self.openingSection.cardTitleColor))
                    .font(.system(.headline, design: .default))
                Text("\(self.openingSection.subTitle)")
                    .foregroundColor(Color.customDarkGray)
                    .font(.system(.body, design: .default))
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
                                cardPaintingTextColor: "EAA496",
                                cardPaintingURL: "주소",
                                cardTitleColor: "D98E7F",
                                cardTitle: "차로 떠나는 피크닉",
                                cardSubTitle: "초보차크닉",
                                title: "최소한으로 차크닉을 떠날 때.",
                                subTitle: "떠나는 여행이 돌아왔어요. 간단한 장비들로 시작할 수 있는 차로 떠나는 피크닉, 차크닉을 떠나보세요!")
        )
    }
}
