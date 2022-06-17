//
//  EquipmentMainCategory.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation

struct DictionaryMainCategory {
    let categoryName: String
    let paintingName: String
    var paintingURL: String
    init(categoryName: String = "", paintingName: String = "임시이미지", paintingURL: String = "") {
        self.categoryName = categoryName
        self.paintingName = paintingName
        self.paintingURL = paintingURL
    }
}
