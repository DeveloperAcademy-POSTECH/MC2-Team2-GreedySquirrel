//
//  EditorCardView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/14.
//

import SwiftUI

struct EditorCardView: View {
    @State private var showModal = false
    @Binding var editorMainContent: EditorMainContent
    let cardPaintingImage: Data
    var body: some View {
        Button(action: {
            showModal.toggle()
        }, label: {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(editorMainContent.cardPaintingSubTitle)
                        .foregroundColor(Color(hex: editorMainContent.cardPaintingSubTitleColor))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text(editorMainContent.cardPaintingTitle)
                        .foregroundColor(Color(hex: editorMainContent.cardPaintingTitleColor))
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top, 34)
                .padding(.leading, 20)
                .padding(.bottom, 10)
                if let uiImage = UIImage(data: cardPaintingImage) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                } else {
                    ProgressView()
                        .frame(width: 350, height: 300)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color(hex: editorMainContent.cardPaintingBackgroundColor))
            )
        })
        .fullScreenCover(isPresented: $showModal) {
            EditorDetailView(showModal: self.$showModal, filename: editorMainContent.contentID)
        }
    }
}

 struct EditorCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditorCardView(editorMainContent: .constant(EditorMainContent()), cardPaintingImage: Data())
    }
 }
