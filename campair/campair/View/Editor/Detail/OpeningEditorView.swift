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
                Image("examplePainting")
                    .resizable()
                    .frame(height: 422)
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(self.openingSection.cardTitle)")
                        .font(.system(size: 15))
                        .bold()
                        .foregroundColor(Color.customPaintingTextPink)
                    Text("\(self.openingSection.cardSubTitle)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 28))
                        .fontWeight(.heavy)
                }
                .padding(.top, 30 + UIDevice.current.getSafeAreaTopValue)
                .padding(.top, 55)
                .padding(.leading, 20)
            }
            VStack(alignment: .leading, spacing: 11) {
                Text("\(self.openingSection.title)")
                    .foregroundColor(Color.customTextPink)
                Text("\(self.openingSection.subTitle)")
                    .foregroundColor(Color.customTextGray)
            }
            .padding(.horizontal, 25)
            .padding(.top, 40)
            .padding(.bottom, 30)
        }
    }
}

struct OpeningEditorView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningEditorView(openingSection:
                            OpeningSection(
                                cardPaintingURL: "주소",
                                cardTitle: "차로 떠나는 피크닉",
                                cardSubTitle: "초보차크닉",
                                title: "최소한으로 차크닉을 떠날 때.",
                                subTitle: "떠나는 여행이 돌아왔어요. 간단한 장비들로 시작할 수 있는 차로 떠나는 피크닉, 차크닉을 떠나보세요!"
                            )
        )
    }
}
