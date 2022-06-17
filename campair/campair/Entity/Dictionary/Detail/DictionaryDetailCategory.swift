//
//  temp2.swift
//  campair
//
//  Created by Mijin CHOI on 2022/06/17.
//

import Foundation

struct DictionaryDetailCategory {
    let name: String
    var equipmentList: [EquipmentList]
    init() {
        self.name = ""
        self.equipmentList = [EquipmentList()]
    }
}
