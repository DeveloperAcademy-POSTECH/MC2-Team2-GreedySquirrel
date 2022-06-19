//
//  ShareRecommendedEquipmentView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct ShareRecommendedEquipmentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("FindingEquipmentIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 58, height: 69)
                .padding(.top, 37)
                .padding(.bottom, 20)
            Text("더 많은 장비를 발견하세요")
                .headlineDefaultBlack()
                .padding(.bottom, 4)
            Text("차크닉, 차박, 캠핑에 필요한 모든 장비사전에서 만나보세요!")
                .caption1DefaultDarkGray()
                .padding(.bottom, 20)
            Text("이동하기")
                .font(.system(.footnote))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 26)
                        .foregroundColor(Color.customBlack)
                )
                .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 25)
        .background(Color(hex: "FAF7F6"))
        .padding(.vertical, 40)
    }
}

struct ShareRecommendedEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        ShareRecommendedEquipmentView()
    }
}
