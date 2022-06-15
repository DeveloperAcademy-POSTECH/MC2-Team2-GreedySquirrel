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
            VStack(alignment: .leading, spacing: 0) {
                Text("더 많은 장비를 발견하세요")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.customTextGray)
                    .padding(.bottom, 10)
                Text("차크닉, 차박, 캠핑에 필요한 장비를 다 볼 수 있어요. 더 많은 장비를 만나보고 싶다면, 장비 사전 탭을 방문하세요.")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(Color.customTextGray)
                    .padding(.bottom, 67)
                HStack(spacing: 0) {
                    Spacer()
                    Button {
                        // TODO: Add Handling
                    } label: {
                        VStack(spacing: 0){
                            Image("moreEquipmentPainting")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 113)
                                .padding(.bottom, 20)
                            Text("장비 사전 탭으로 이동하기 !!")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(Color.customTextGray)
                                .padding(.bottom, 50)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 25)
            Text("공유하기")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color.customShareButtonBrown)
        }
    }
}

struct ShareRecommendedEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        ShareRecommendedEquipmentView()
    }
}
