//
//  EquipmentSummary.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation

struct EquipmentList {
    let name: String
    let paintingName: String
    var paintingURL: String
    init(name: String = "", paintingName: String = "임시이미지", paintingURL: String = "") {
        self.name = name
        self.paintingName = paintingName
        self.paintingURL = paintingURL
    }
}
