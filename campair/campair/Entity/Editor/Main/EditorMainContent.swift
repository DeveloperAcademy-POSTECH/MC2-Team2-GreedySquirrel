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
