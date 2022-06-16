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
    let recommendedEquipments: [ContentEquipment]
    let lowerContent: String?
}
