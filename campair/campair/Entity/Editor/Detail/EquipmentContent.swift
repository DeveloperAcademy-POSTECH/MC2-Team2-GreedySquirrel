//
//  EquipmentContent.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/13.
//

import Foundation

struct EquipmentContent: Codable {
    let title: String?
    let upperContent: String?
    var recommendedEquipments: [ContentEquipment]
    init(title: String? = nil, upperContent: String? = nil, recommendedEquipments: [ContentEquipment] = []) {
        self.title = title
        self.upperContent = upperContent
        self.recommendedEquipments = recommendedEquipments
    }
}
