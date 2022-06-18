//
//  temp3.swift
//  campair
//
//  Created by Mijin CHOI on 2022/06/17.
//

import Foundation

struct DictionaryEquipmentContent: Codable{
    let name: String
    let paintingName: String
    var paintingURL: String
    let content: String
    let pros: [String]?
    let cons: [String]?
    let installationGuide: String?
    init(name: String = "", paintingName: String = "임시이미지", paintingURL: String = "", content: String = "", pros: [String]? = nil, cons: [String]? = nil, installationGuide: String? = nil) {
        self.name = name
        self.paintingName = paintingName
        self.paintingURL = paintingURL
        self.content = content
        self.pros = pros
        self.cons = cons
        self.installationGuide = installationGuide
    }
}
