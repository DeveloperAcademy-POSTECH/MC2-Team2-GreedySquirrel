//
//  EditorContent .swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/12.
//

import Foundation

struct EditorMainContent: Codable {
    let contentID: String
    let cardPaintingBackgroundColor: String
    let cardPaintingSubTitleColor: String
    let cardPaintingSubTitle: String
    let cardPaintingTitle: String
    var cardPaintingImageName: String
    var cardPaintingURLString: String
    var contentEquipments: [ContentEquipment]
    init(contentID: String, cardPaintingBackgroundColor: String, cardPaintingSubTitleColor: String, cardPaintingSubTitle: String, cardPaintingTitle: String, cardPaintingImageName: String, cardPaintingURLString: String, contentEquipments: [ContentEquipment]) {
        self.contentID = contentID
        self.cardPaintingBackgroundColor = cardPaintingBackgroundColor
        self.cardPaintingSubTitleColor = cardPaintingSubTitleColor
        self.cardPaintingSubTitle = cardPaintingSubTitle
        self.cardPaintingTitle = cardPaintingTitle
        self.cardPaintingImageName = cardPaintingImageName
        self.cardPaintingURLString = cardPaintingURLString
        self.contentEquipments = contentEquipments
    }
    init() {
        self.contentID = ""
        self.cardPaintingBackgroundColor = "FFFFFF"
        self.cardPaintingSubTitleColor = "FFFFFF"
        self.cardPaintingSubTitle = ""
        self.cardPaintingTitle = ""
        self.cardPaintingImageName = "임시이미지"
        self.cardPaintingURLString = ""
        self.contentEquipments = [ContentEquipment()]
    }
}
