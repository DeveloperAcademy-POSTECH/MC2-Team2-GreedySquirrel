//
//  DictionaryMainView.swift
//  campair
//
//  Created by Mijin CHOI on 2022/06/15.
//

import SwiftUI

struct DictionaryMainView: View {
    @StateObject var viewModel = DictionaryMainViewModel()
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12, alignment: nil),
        GridItem(.flexible(), spacing: 12, alignment: nil),
        GridItem(.flexible(), spacing: 12, alignment: nil),
        GridItem(.flexible(), spacing: 12, alignment: nil)
    ]
    var body: some View {
        VStack(spacing: 0) {
            contentMainTitleView
                .padding(.top, 20.0)
            LazyVGrid(columns: self.columns, spacing: 23) {
                ForEach(self.viewModel.dictionaryMainCollection.dictionaryMainCategory.indices, id: \.self) { index in
                    let equipmentName = self.viewModel.dictionaryMainCollection.dictionaryMainCategory[index]
                    NavigationLink(destination: DictionaryDetailedView(scrollOffset: 0, selectedEquipmentNumber: index), label: {
                        CategoryButtonView(imageSet: self.$viewModel.imageSet, imageName: equipmentName.paintingName, catagoryName: equipmentName.categoryName)
                    })
                }
                .foregroundColor(Color(hex: "4F4F4F"))
            }
            .padding(.top, 30.0)
            .padding(.horizontal, 40.0)
            Spacer()
        }
        .padding(.top, UIDevice.current.getSafeAreaTopValue)
        .background(Color(red: 254/255, green: 252/255, blue: 251/255))
        .ignoresSafeArea()
        .navigationTitle("")
        .onAppear {
            viewModel.viewAppeared()
        }
    }
    var contentMainTitleView : some View {
            ZStack {
                Text("여행의 시작은\n장비 준비부터")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 171.0)
                    .padding(.top, -148.0)
                Image("squirrel")
                    .frame(width: 186, height: 138, alignment: .leading)
                    .padding(.leading, 191.0)
                    .padding(.trailing, 13.0)
                    .padding(.top, -160.0)
            }
    }
}

struct CategoryButtonView: View {
    @Binding var imageSet: [String: Data]
    let imageName: String
    let catagoryName: EquipmentGroup
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if let uiImage = UIImage(data: imageSet[self.imageName] ?? imageSet["none"]! ) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72, height: 72)
                        .padding(.bottom, 4)
                } else {
                    ProgressView()
                        .frame(width: 72, height: 72)
                }
                Text(self.catagoryName.korean)
                    .font(.system(size: 13))
            }
        }
    }
}

struct DictionaryMainView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryMainView()
    }
}
