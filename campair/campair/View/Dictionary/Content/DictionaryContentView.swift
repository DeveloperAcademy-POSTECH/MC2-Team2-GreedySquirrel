//
//  DictionaryContentView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import SwiftUI

struct DictionaryContentView: View {
    let equipmentContent: DictionaryEquipmentContent
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text(self.equipmentContent.name)
                    .fontWeight(.bold)
                    .font(.system(.title))
                    .padding(.top, 40)
                    .foregroundColor(Color(hex: "4F4F4F"))
                HStack {
                    Spacer()
                    Image(self.equipmentContent.paintingName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190, height: 190)
                        .padding(.vertical, 55)
                    Spacer()
                }
                Text(self.equipmentContent.content)
                    .bodyDefaultDarkGray()
                Rectangle()
                    .frame(height: 8)
                    .foregroundColor(Color(hex: "FEFCFB"))
                    .padding(.vertical, 40)
                if let prosArray = self.equipmentContent.pros {
                    Text("장점")
                        .fontWeight(Font.Weight.bold)
                        .padding(.bottom, 10)
                        .bodyBold000000Opacity60()
                    let pros = prosArray.reduce("") {"\($0)\($1)\n"}
                    Text(pros)
                        .bodyDefaultDarkGray()
                }
                if let consArray = self.equipmentContent.cons {
                    Text("단점")
                        .fontWeight(Font.Weight.bold)
                        .padding(.bottom, 10)
                        .bodyBold000000Opacity60()
                        .padding(.top, 20)
                    let cons = consArray.reduce("") {"\($0)\($1)\n"}
                    Text(cons)
                        .bodyDefaultDarkGray()
                }
                if let installationGuide = self.equipmentContent.installationGuide {
                    Text("설치방법")
                        .fontWeight(Font.Weight.bold)
                        .padding(.bottom, 10)
                        .bodyBold000000Opacity60()
                        .padding(.top, 20)
                    Text(installationGuide)
                        .bodyDefaultDarkGray()
                }
            }
            .padding(.bottom, 50)
            .padding(.horizontal, 20)
        }
    }
}

struct DictionaryContentView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryContentView(equipmentContent:
                                DictionaryEquipmentContent(
                                    name: "그늘막 텐트",
                                    paintingName: "paint_1",
                                    paintingURL: "",
                                    content: "그늘막 텐트는 간편한 설치로 햇빛을 막을 수 있어요. 가격이 저렴한 편이고, 무게와 부피가 가벼워서 가벼운 피크닉 전용 텐트에요.",
                                    pros: ["의자에서 누워있는 듯한 느낌이에요.", "'쉼'을 목적으로 나온 의자.", "다리 폭이 넓어서 넘어질 위험이 적어요."],
                                    cons: ["접었을 때도 사이즈가 크고 무거워요.", "앉아서 음식을 먹거나 책을 읽을 때는 불편할 수 있어요."],
                                    installationGuide: "접혀있는 의자를 그대로 펼치기 때문에 설치가 편리해요."
                                )
        )
    }
}
