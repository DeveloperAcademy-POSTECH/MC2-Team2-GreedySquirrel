//
//  InterestEquipmentContent.swift
//  campair
//
//  Created by 이가은 on 2022/07/17.
//

import Foundation

struct InterestEquipmentContent: Codable {
    let name: String
    let paintingName: String
    var paintingURLString: String
    init(name: String = "", paintingName: String = "", paintingURLString: String = "") {
        self.name = name
        self.paintingName = paintingName
        self.paintingURLString = paintingURLString
    }
}
