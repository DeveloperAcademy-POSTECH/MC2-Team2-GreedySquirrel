//
//  EditorContent .swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/12.
//

import Foundation

struct EditorMainContent: Codable {
    let cardPaintingBackgroundColor: String
    let cardPaintingSubTitleColor: String
    let cardPaintingSubTitle: String
    let cardPaintingTitle: String
    let cardPaintingURLString: String
    let contentEquipments: [ContentEquipment]
}
