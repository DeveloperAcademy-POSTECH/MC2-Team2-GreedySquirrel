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
    let cardPaintingTitleColor: String
    let cardPaintingTitle: String
    var cardPaintingImageName: String
    var cardPaintingURLString: String
    var contentEquipments: [ContentEquipment]
    init(contentID: String = "", cardPaintingBackgroundColor: String = "FFFFFF", cardPaintingSubTitleColor: String = "FFFFFF", cardPaintingSubTitle: String = "", cardPaintingTitleColor: String = "FFFFFF", cardPaintingTitle: String = "", cardPaintingImageName: String = "", cardPaintingURLString: String = "", contentEquipments: [ContentEquipment] = [ContentEquipment()]) {
        self.contentID = contentID
        self.cardPaintingBackgroundColor = cardPaintingBackgroundColor
        self.cardPaintingSubTitleColor = cardPaintingSubTitleColor
        self.cardPaintingSubTitle = cardPaintingSubTitle
        self.cardPaintingTitleColor = cardPaintingTitleColor
        self.cardPaintingTitle = cardPaintingTitle
        self.cardPaintingImageName = cardPaintingImageName
        self.cardPaintingURLString = cardPaintingURLString
        self.contentEquipments = contentEquipments
    }
}
