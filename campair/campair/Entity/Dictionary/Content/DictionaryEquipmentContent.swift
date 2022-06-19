//
//  temp3.swift
//  campair
//
//  Created by Mijin CHOI on 2022/06/17.
//

import Foundation

struct DictionaryEquipmentContent: Codable {
    let categoryName: String
    let name: String
    let paintingName: String
    var paintingURLString: String
    let content: String
    let pros: [String]?
    let cons: [String]?
    let installationGuide: String?
    init(categoryName: String = "", name: String = "", paintingName: String = "임시이미지", paintingURLString: String = "", content: String = "", pros: [String]? = nil, cons: [String]? = nil, installationGuide: String? = nil) {
        self.categoryName = categoryName
        self.name = name
        self.paintingName = paintingName
        self.paintingURLString = paintingURLString
        self.content = content
        self.pros = pros
        self.cons = cons
        self.installationGuide = installationGuide
    }
}
