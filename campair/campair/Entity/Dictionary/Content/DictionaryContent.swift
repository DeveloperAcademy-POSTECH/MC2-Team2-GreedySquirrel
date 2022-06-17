//
//  temp3.swift
//  campair
//
//  Created by Mijin CHOI on 2022/06/17.
//

import Foundation

struct DictionaryContent {
    let name: String
    let paintingName: String
    var paintingURL: String
    let content: String
    let pros: [String]?
    let cons: [String]?
    let installationGuide: String?
    init(name: String, paintingName: String, paintingURL: String, content: String, pros: [String]?, cons: [String]?, installationGuide: String?) {
        self.name = name
        self.paintingName = paintingName
        self.paintingURL = paintingURL
        self.content = content
        self.pros = pros
        self.cons = cons
        self.installationGuide = installationGuide
    }
    init() {
        self.name = ""
        self.paintingName = "임시이미지"
        self.paintingURL = ""
        self.content = ""
        self.pros = nil
        self.cons = nil
        self.installationGuide = nil
    }
}
