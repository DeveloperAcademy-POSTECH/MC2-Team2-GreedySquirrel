//
//  EquipmentMainCategory.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation

struct DictionaryMainCategory: Codable{
    let categoryName: String
    let paintingName: String
    var paintingURLString: String
    init(categoryName: String = "", paintingName: String = "임시이미지", paintingURLString: String = "") {
        self.categoryName = categoryName
        self.paintingName = paintingName
        self.paintingURLString = paintingURLString
    }
}
