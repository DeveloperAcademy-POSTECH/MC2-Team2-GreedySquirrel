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
                Image("dictionaryBackground")
//                    .ignoresSafeArea()
                    .foregroundColor(.black)
//                    .background(Color.red)
                contentMainTitleView
                ScrollView {
                    LazyVGrid(columns: self.columns, spacing: 28) {
                        ForEach(self.viewModel.dictionaryMainCollection.dictionaryMainCategory.indices, id: \.self) { index in
                            let equipmentName = self.viewModel.dictionaryMainCollection.dictionaryMainCategory[index]
                            NavigationLink(destination: DictionaryDetailedView(), label: {
                                CategoryButtonView(imageSet: self.$viewModel.imageSet, imageName: equipmentName.paintingName, catagoryName: equipmentName.categoryName)
                                    .foregroundColor(.customBlack)
                            })
                        }
                    }
                    .padding(.horizontal, 28.0)
                    .padding(.top, 10.0)
                }
            }
            .ignoresSafeArea()
            .navigationTitle("")
        }
        .onAppear {
            viewModel.viewAppeared()
        }
    }
    var contentMainTitleView : some View {
            ZStack {
//                Image("dictionaryBackground")
//                    .ignoresSafeArea()
                Text("여행의 시작은\n장비 준비부터")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                //  .foregroundColor(Color(hex: "4F4F4F"))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 171.0)
                    .padding(.top, -148.0)
//                    .padding(.leading, 20.0) //for 12 mini
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
