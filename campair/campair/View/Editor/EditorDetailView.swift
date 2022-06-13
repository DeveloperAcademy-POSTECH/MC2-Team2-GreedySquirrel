//
//  EditorDetailView.swift
//  campair
//
//  Created by 이가은 on 2022/06/13.
//

import SwiftUI

struct EditorDetailView: View {
    var body: some View {
        ScrollView {
            OpeningEditorView()
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<2) {index in
                        EditorRecommendEquipmentView()
                        if(index != 1){
                            Rectangle()
                                .frame(height: 8)
                                .foregroundColor(Color.customSectionGray)
                        }
                    }
                }
            }
            .font(.system(size: 17))
            ShareRecommendedEquipmentView()
        }
        .ignoresSafeArea()
    }
}

struct OpeningEditorView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topLeading) {
                Image("examplePainting")
                    .resizable()
                    .frame(height: 422)
                VStack(alignment: .leading, spacing: 10) {
                    Text("차크닉 시작하기")
                        .font(.system(size: 15))
                        .bold()
                        .foregroundColor(Color.customPaintingTextPink)
                    Text("차로 떠나는 피크닉")
                        .foregroundColor(Color.white)
                        .font(.system(size: 28))
                    // heavy -> extraBold : 800 숫자로 맞춰야 하는데 숫자를 fontWeight으로 주는 방법을 모르겠습니다.
                        .fontWeight(.heavy)
                }
                .padding(.top, 64)
                .padding(.leading, 20)
            }
            VStack(alignment: .leading, spacing: 11) {
                Text("최소한으로 차크닉을 떠날 때.")
                    .foregroundColor(Color.customTextPink)
                Text("떠나는 여행이 돌아왔어요. 간단한 장비들로 시작할 수 있는 차로 떠나는 피크닉, 차크닉을 떠나보세요!")
                    .foregroundColor(Color.customTextGray)
            }
            .padding(.horizontal, 25)
            .padding(.top, 40)
            .padding(.bottom, 30)
        }
    }
}

struct EditorRecommendEquipmentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("경량 의자")
                            .fontWeight(.semibold)
                            .padding(.bottom, 10)
                            .padding(.top, 40)
                        Text("산에서도 바다에서도 의자만 있다면 그곳이 여러분의 차크닉 장소예요. 드넓은 초원과 끝없이 이어지는 바다를 바라보는 것에서 차크닉의 힐링이 시작돼요. 앉아서 즐기는 모든 것들을 경량 의자와 함께하세요.")
                            .foregroundColor(Color.customTextGray)
                        ForEach(0..<1) {_ in
                            RecommendedEquipmentCardView()
                        }
                        Text("평범한 자동차 여행에서 작지만 확실한 행복을 경량 의자에서 느낄 수 있어요. 혼자 또 같이 소소한 힐링을 느껴보세요. 용도에 따라 취향에 따라 부피에 따라 다양한 의자를 사용해보세요.")
                            .padding(.bottom, 40)
                            .foregroundColor(Color.customTextGray)
                            .padding(.top, 30)
                    }
                }
            }
            .padding(.horizontal, 25)
        }
    }
}

struct ShareRecommendedEquipmentView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Image("moreEquipmentPainting")
                    .resizable()
                    .frame(width: 90, height: 90)
                Text("더 많은 장비를 발견하세요")
                    .font(.system(size: 17))
                Text("장비 사전 탭으로 이동하기 ->")
                    .font(.system(size: 12))
                    .foregroundColor(Color.customTextGray)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 40)
            .background(Color.white)
            .cornerRadius(30)
            .padding(20)
            Text("공유하기")
                .padding(.vertical, 40)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .background(Color.customShareButtonBrown)
        }
        .frame(maxWidth: .infinity)
        .background(Color.customSectionGray)
    }
}

struct RecommendedEquipmentCardView: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("exampleEquipment")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.horizontal, 20)
            VStack(alignment: .leading, spacing: 5) {
                Text("장비사전 읽어보기")
                    .font(.system(size: 12))
                    .foregroundColor(Color.customTextGray)
                Text("경량 의자")
            }
            Spacer()
            Image(systemName: "heart.fill")
                .padding(.trailing, 30)
                .font(.system(size: 20))
                .foregroundColor(Color.customSelectedHeartRed)
        }
        .padding(.vertical, 20)
        .background(Color.customCardGray)
        .cornerRadius(20)
        .padding(.top, 30)
    }
}

struct EditorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EditorDetailView()
    }
}
