//
//  ContentEquipment.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/16.
//

import Foundation

struct ContentEquipment: Codable {
    let name: String
    var paintingImageName: String
    var paintingURLString: String
    init(name: String = "", paintingImageName: String = "임시이미지", paintingURLString: String = "") {
            self.name = name
            self.paintingImageName = paintingImageName
            self.paintingURLString = paintingURLString
    }
}
