//
//  EditorMainView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/13.
//

import SwiftUI

struct EditorMainView: View {
    @ObservedObject var viewModel = EditorMainViewModel()
    private let todayPhase = Date().getTodayPhase()
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("가볍게 떠나는")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(todayPhase)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color(hex: "4F4F4F"))
                    .padding(.top, 30)
                    .padding(.leading, 20)
                    VStack(spacing: 50) {
                        ForEach(self.viewModel.editorMainCollection.editorMainContents.indices, id: \.self) { contentsIndex in
                            let editorMainContent = self.viewModel.editorMainCollection.editorMainContents[contentsIndex]
                            VStack(spacing: 10) {
                                EditorCardView(editorMainContent: self.$viewModel.editorMainCollection.editorMainContents[contentsIndex], cardPaintingImage: self.viewModel.imageSet[editorMainContent.cardPaintingTitle] ?? self.viewModel.imageSet["none"]!)
                                HStack(spacing: 6) {
                                    ForEach(editorMainContent.contentEquipments.indices, id: \.self) { equipmentIndex in
                                        let contentEquipment = editorMainContent.contentEquipments[equipmentIndex]
                                        NavigationLink {
                                            DictionaryContentView(jsonFileName: self.viewModel.editorMainCollection.editorMainContents[contentsIndex].contentEquipments[equipmentIndex].paintingImageName)
                                        } label: {
                                            EditorEquipListView(name: contentEquipment.name, paintingImage: self.viewModel.imageSet[contentEquipment.name] ?? self.viewModel.imageSet["none"]!, cardPaintingBackgroundColor: editorMainContent.cardPaintingBackgroundColor)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
                .padding(.bottom, 50)
            }
            .navigationBarHidden(true)
            .onAppear(perform: {
                viewModel.viewAppeared()
            })
        }
    }
}

struct EditorMainView_Previews: PreviewProvider {
    static var previews: some View {
        EditorMainView()
        EditorMainView()
            .previewDevice("iPod touch (7th generation)")
    }
}
