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
    init(categoryName: String, paintingName: String, paintingURL: String) {
        self.categoryName = categoryName
        self.paintingName = paintingName
        self.paintingURL = paintingURL
    }
    init() {
        self.categoryName = ""
        self.paintingName = "임시이미지"
        self.paintingURL = ""
    }
}
