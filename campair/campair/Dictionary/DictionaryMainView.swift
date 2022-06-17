//
//  DictionaryMainView.swift
//  campair
//
//  Created by Mijin CHOI on 2022/06/15.
//

import SwiftUI

struct CategoryButton: Identifiable {
    var id: Int
    let imageUrl: String
    let categoryEnum: Category
}

struct CategoryButtonView: View {
    let title: Category
    let imageUrl: String
    var body: some View {
        Button {
            // TODO : Enter dictionaryDetailView
        } label: {
            NavigationLink(destination: SelectingEquipmentView()) {
                VStack(spacing: 0) {
                    Image(self.imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 72)
                        .padding(.bottom, 4)
                    Text(self.title.korean)
                        .font(.footnote)
                }
            }
        }
    }
}

struct DictionaryMainView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12, alignment: nil),
        GridItem(.flexible(), spacing: 12, alignment: nil),
        GridItem(.flexible(), spacing: 12, alignment: nil),
        GridItem(.flexible(), spacing: 12, alignment: nil)
    ]
    let buttons: [CategoryButton] = DictionaryCategoryCollection.buttons
    var body: some View {
        NavigationView {
            ScrollView {
                TitleView()
                LazyVGrid(columns: self.columns, spacing: 23) {
                    ForEach(self.buttons) { button in
                        CategoryButtonView(
                            title: button.categoryEnum,
                            imageUrl: button.imageUrl)
                    }
                    .foregroundColor(Color(red: 0.361, green: 0.361, blue: 0.361))
                }
                .padding(.horizontal, 30.0)
                .padding(.top, 70.0)
            }
            .padding(.top, UIDevice.current.getSafeAreaTopValue)
            .background(Color(red: 254/255, green: 252/255, blue: 251/255))
            .ignoresSafeArea()
        }
    }
}

struct TitleView: View {
    var body: some View {
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
        Spacer()
    }
}

struct DictionaryMainView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryMainView()
    }
}

struct DictionaryCategoryCollection {
    static var buttons = [
        CategoryButton(id: 0, imageUrl: "paint_1", categoryEnum: Category.tent),
        CategoryButton(id: 1, imageUrl: "paint_24", categoryEnum: Category.tarp),
        CategoryButton(id: 2, imageUrl: "paint_2", categoryEnum: Category.campingSheet),
        CategoryButton(id: 3, imageUrl: "paint_3", categoryEnum: Category.multiTool),
        CategoryButton(id: 4, imageUrl: "paint_4", categoryEnum: Category.pole),
        CategoryButton(id: 5, imageUrl: "paint_5", categoryEnum: Category.campingTable),
        CategoryButton(id: 6, imageUrl: "paint_6", categoryEnum: Category.campingChair),
        CategoryButton(id: 7, imageUrl: "paint_7", categoryEnum: Category.hammock),
        CategoryButton(id: 8, imageUrl: "paint_8", categoryEnum: Category.sleepingBag),
        CategoryButton(id: 9, imageUrl: "paint_9", categoryEnum: Category.cutlery),
        CategoryButton(id: 10, imageUrl: "paint_10", categoryEnum: Category.mat),
        CategoryButton(id: 11, imageUrl: "paint_11", categoryEnum: Category.campingBox),
        CategoryButton(id: 12, imageUrl: "paint_12", categoryEnum: Category.campingLight),
        CategoryButton(id: 13, imageUrl: "paint_13", categoryEnum: Category.campingTool),
        CategoryButton(id: 14, imageUrl: "paint_14", categoryEnum: Category.emergencyKit),
        CategoryButton(id: 15, imageUrl: "paint_15", categoryEnum: Category.toilet)
    ]
}
