//
//  DictionaryContentView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import SwiftUI

struct DictionaryContentView: View {
    @ObservedObject var viewModel = DictionaryContentViewModel()
    var fileName: String
    var body: some View {
        ScrollView {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.viewModel.dictionaryEquipmentContent.name)
                .fontWeight(.bold)
                .font(.system(.title))
                .padding(.top, 20)
                .foregroundColor(Color(hex: "4F4F4F"))
            HStack {
                Spacer()
                if let uiImage = UIImage(data: self.viewModel.imageSet[self.viewModel.dictionaryEquipmentContent.name] ?? self.viewModel.imageSet["none"]! ) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190, height: 190)
                        .padding(.vertical, 20) // 원래 55인데 20으로 바꾸고 싶음..
                }
                Spacer()
            }
            Text(self.viewModel.dictionaryEquipmentContent.content)
                .bodyDefaultDarkGray()
            Rectangle()
                .frame(height: 8)
                .foregroundColor(Color(hex: "FEFCFB"))
                .padding(.vertical, 40)
            if let prosArray = self.viewModel.dictionaryEquipmentContent.pros {
                Text("장점")
                    .fontWeight(Font.Weight.bold)
                    .padding(.bottom, 10)
                    .bodyBold000000Opacity60()
                let pros = prosArray.reduce("") {"\($0)\($1)\n"}
                Text(pros)
                    .bodyDefaultDarkGray()
            }
            if let consArray = self.viewModel.dictionaryEquipmentContent.cons {
                Text("단점")
                    .fontWeight(Font.Weight.bold)
                    .padding(.bottom, 10)
                    .bodyBold000000Opacity60()
                    .padding(.top, 20)
                let cons = consArray.reduce("") {"\($0)\($1)\n"}
                Text(cons)
                    .bodyDefaultDarkGray()
            }
            if let installationGuide = self.viewModel.dictionaryEquipmentContent.installationGuide {
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
        .onAppear(perform: {
            self.viewModel.viewAppeared(fileName: fileName)
        })
    }
}
struct DictionaryContentView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryContentView(fileName: "경량_의자")
    }
}
