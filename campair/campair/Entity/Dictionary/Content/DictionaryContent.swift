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
    let pros: [String]
    let cons: [String]
    let installationGuide: String
    init() {
        self.name = ""
        self.paintingName = "임시이미지"
        self.paintingURL = ""
        self.content = ""
        self.pros = [""]
        self.cons = [""]
        self.installationGuide = ""
    }
}
