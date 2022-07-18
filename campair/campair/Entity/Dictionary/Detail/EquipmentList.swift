//
//  EquipmentSummary.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation

struct EquipmentList: Codable {
    let name: String
    let paintingName: String
    var paintingURLString: String
    init(name: String = "", paintingName: String = "", paintingURLString: String = "") {
        self.name = name
        self.paintingName = paintingName
        self.paintingURLString = paintingURLString
    }
}
