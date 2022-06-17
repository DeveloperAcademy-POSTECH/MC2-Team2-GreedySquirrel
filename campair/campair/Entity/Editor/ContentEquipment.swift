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
    init() {
        self.name = ""
        self.paintingImageName = "임시이미지"
        self.paintingURLString = ""
    }
}
