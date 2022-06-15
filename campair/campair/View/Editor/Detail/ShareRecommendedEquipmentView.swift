//
//  ShareRecommendedEquipmentView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct ShareRecommendedEquipmentView: View {
    var body: some View {
        Button {
            // TODO: Add
        } label: {
            VStack(spacing: 0) {
                Image("FindingEquipmentIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 58, height: 69)
                    .padding(.top, 37)
                    .padding(.bottom, 20)
                Text("더 많은 장비를 발견하세요")
                    .font(.system(.headline, design: .default))
                    .padding(.bottom, 4)
                    .font(.system(.headline, design: .default))
                    .foregroundColor(Color.customBlack)
                Text("차크닉, 차박, 캠핑에 필요한 모든 장비사전에서 만나보세요!")
                    .font(.system(.caption, design: .default))
                    .padding(.bottom, 20)
                    .foregroundColor(Color.customDarkGray)
                RoundedRectangle(cornerRadius: 26)
                    .frame(width: 90, height: 32)
                    .foregroundColor(Color.customBlack)
                    .overlay(
                        Text("이동하기")
                        .font(.system(.footnote))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    )
                    .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.9843137255, alpha: 1)))
            .padding(.bottom, 40)
        }
    }
}

struct ShareRecommendedEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        ShareRecommendedEquipmentView()
    }
}
