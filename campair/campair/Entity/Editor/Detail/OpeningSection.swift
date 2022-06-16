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
    let cardPaintingTitle: String
    let cardPaintingURLString: String
    // opening ment part
    let titleColor: String
    let title: String
    let content: String
}
