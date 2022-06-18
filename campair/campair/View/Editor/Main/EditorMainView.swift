//
//  EditorMainView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/13.
//

import SwiftUI

struct EditorMainView: View {
    @ObservedObject var viewModel = EditorMainViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("가볍게 떠나는")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("금요일 오후")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 45)
                    .padding(.leading, 20)
                    VStack(spacing: 50) {
                        ForEach(viewModel.editorMainCollection.editorMainContents.indices, id: \.self) { contentsIndex in
                            let editorMainContent = viewModel.editorMainCollection.editorMainContents[contentsIndex]
                            VStack(spacing: 10) {
                                EditorCardView(cardPaintingBackgroundColor: editorMainContent.cardPaintingBackgroundColor, cardPaintingSubTitleColor: editorMainContent.cardPaintingSubTitleColor, cardPaintingSubTitle: editorMainContent.cardPaintingSubTitle, cardPaintingTitle: editorMainContent.cardPaintingTitle, cardPaintingImage: viewModel.imageSet[editorMainContent.cardPaintingTitle] ?? viewModel.imageSet["none"]!)
                                HStack(spacing: 6) {
                                    ForEach(editorMainContent.contentEquipments.indices, id: \.self) { equipmentIndex in
                                        let contentEquipment = editorMainContent.contentEquipments[equipmentIndex]
                                        EditorEquipListView(name: contentEquipment.name, paintingImage: viewModel.imageSet[contentEquipment.name] ?? viewModel.imageSet["none"]!)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
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
