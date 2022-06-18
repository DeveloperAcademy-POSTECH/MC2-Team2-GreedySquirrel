//
//  OpeningSection.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/13.
//

import Foundation

struct OpeningSection: Codable {
    // card part
    let cardPaintingBackgroundColor: String
    let cardPaintingSubTitleColor: String
    let cardPaintingSubTitle: String
    let cardPaintingTitleColor: String
    let cardPaintingTitle: String
    var cardPaintingImageName: String
    var cardPaintingURLString: String
    // opening ment part
    let titleColor: String
    let title: String
    let content: String
    // TODO : fix this later (고반이 이미지 넣으면) cardPaintingImageName 변경
    init(cardPaintingBackgroundColor: String = "FFFFFF", cardPaintingSubTitleColor: String = "FFFFFF", cardPaintingSubTitle: String = "", cardPaintingTitleColor: String = "FFFFFF", cardPaintingTitle: String = "jj", cardPaintingImageName: String = "차로_떠나는_피크닉", cardPaintingURLString: String = "", titleColor: String = "", title: String = "FFFFFF", content: String = "") {
        self.cardPaintingBackgroundColor = cardPaintingBackgroundColor
        self.cardPaintingSubTitleColor = cardPaintingSubTitleColor
        self.cardPaintingSubTitle = cardPaintingSubTitle
        self.cardPaintingTitleColor = cardPaintingTitleColor
        self.cardPaintingTitle = cardPaintingTitle
        self.cardPaintingImageName = cardPaintingImageName
        self.cardPaintingURLString = cardPaintingURLString
        self.titleColor = titleColor
        self.title = title
        self.content = content
    }
}
