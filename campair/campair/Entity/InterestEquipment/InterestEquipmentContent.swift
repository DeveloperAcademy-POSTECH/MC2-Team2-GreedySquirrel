//
//  InterestEquipmentCollection.swift
//  campair
//
//  Created by 이가은 on 2022/07/13.
//

import Foundation

struct InterestEquipmentCollection {
    var equipmentList: [EquipmentList]
    init(equipmentList: [EquipmentList] = [EquipmentList()]) {
        self.equipmentList = equipmentList
    }
}
