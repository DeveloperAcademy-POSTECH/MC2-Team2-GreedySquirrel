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
        NavigationView {
            VStack(spacing: 0) {
                contentMainTitleView
                    .padding(.top, 20.0)
                LazyVGrid(columns: self.columns, spacing: 23) {
                    ForEach(self.viewModel.dictionaryMainCollection.dictionaryMainCategory.indices, id: \.self) { index in
                        let equipmentName = self.viewModel.dictionaryMainCollection.dictionaryMainCategory[index]
                        CategoryButtonView(imageSet: self.$viewModel.imageSet, imageName: equipmentName.paintingName, catagoryName: equipmentName.categoryName)
                    }
                    .foregroundColor(Color(red: 0.361, green: 0.361, blue: 0.361))
                }
                .padding(.top, 30.0)
                .padding(.horizontal, 40.0)
                Spacer()
            }
            .padding(.top, UIDevice.current.getSafeAreaTopValue)
            .background(Color(red: 254/255, green: 252/255, blue: 251/255))
            .ignoresSafeArea()
        }
        .onAppear {
            viewModel.viewAppeared()
        }
    }
    var contentMainTitleView : some View {
        HStack {
            Text("여행의 시작은\n장비 준비부터")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .padding(.leading, 20.0)
                .padding(.top, 36.0)
            Spacer()
            Image("CategoryBackground")
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.leading, 20.0)
        }
    }
}

struct CategoryButtonView: View {
    @Binding var imageSet: [String: Data]
    let imageName: String
    let catagoryName: EquipmentGroup
    var body: some View {
        NavigationLink(destination: DictionaryDetailedView()) {
            VStack(spacing: 0) {
                if let uiImage = UIImage(data: imageSet[self.imageName] ?? imageSet["none"]! ) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72, height: 72)
                        .padding(.bottom, 4)
                } else {
                    Text("Image loading ...")
                        .frame(width: 72, height: 72)
                        .foregroundColor(.customBlack)
                }
                Text(self.catagoryName.korean)
                    .font(.footnote)
            }
        }
    }
}

struct DictionaryMainView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryMainView()
    }
}
