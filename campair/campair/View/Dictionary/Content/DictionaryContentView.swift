//
//  DictionaryContentView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import SwiftUI

struct DictionaryContentView: View {
    let equipmentCategory: String
    @ObservedObject var viewModel = DictionaryContentViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var jsonFileName: String
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(height: 0)
                    .foregroundColor(Color(hex: "FEFCFB"))
                HStack {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.black)
                    })
                    .padding(.leading, 8)
                    Spacer()
                    Text(equipmentCategory)
                        .padding(.trailing, 179)
                }
                .padding(.bottom, 10)
                .background(Color(hex: "FEFCFB"))
                Rectangle()
                    .frame(height:1)
                    .foregroundColor(Color(hex:"E8E8E8"))
            }
        ScrollView {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.viewModel.dictionaryEquipmentContent.name)
                .fontWeight(.bold)
                .font(.system(.title))
                .padding(.top, 20)
                .foregroundColor(Color(hex: "4F4F4F"))
                .padding(.horizontal, 20)
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
                .padding(.horizontal, 20)
            if let prosArray = self.viewModel.dictionaryEquipmentContent.pros {
                Rectangle()
                    .frame(height: 20)
                    .foregroundColor(Color(hex: "FAF7F6"))
                    .padding(.vertical, 40)
                Text("장점")
                    .fontWeight(Font.Weight.bold)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 20)
                    .bodyBold000000Opacity60()
                let pros = prosArray.reduce("") {"\($0)\($1)\n"}
                Text(pros)
                    .bodyDefaultDarkGray()
                    .padding(.horizontal, 20)
            }
            if let consArray = self.viewModel.dictionaryEquipmentContent.cons {
                Text("단점")
                    .fontWeight(Font.Weight.bold)
                    .padding(.bottom, 10)
                    .bodyBold000000Opacity60()
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                let cons = consArray.reduce("") {"\($0)\($1)\n"}
                Text(cons)
                    .bodyDefaultDarkGray()
                    .padding(.horizontal, 20)
            }
            if let installationGuide = self.viewModel.dictionaryEquipmentContent.installationGuide {
                Text("설치방법")
                    .fontWeight(Font.Weight.bold)
                    .padding(.bottom, 10)
                    .bodyBold000000Opacity60()
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                Text(installationGuide)
                    .bodyDefaultDarkGray()
                    .padding(.horizontal, 20)
            }
        }
        .padding(.bottom, 50)
        }
        .onAppear(perform: {
            self.viewModel.viewAppeared(fileName: jsonFileName)
        })
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct DictionaryContentView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryContentView(equipmentCategory: "HI", jsonFileName: "경량_의자")
    }
}
