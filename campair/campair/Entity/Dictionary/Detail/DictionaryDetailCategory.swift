//
//  temp2.swift
//  campair
//
//  Created by Mijin CHOI on 2022/06/17.
//

import Foundation

struct DictionaryPreDetailCategory: Codable {
     var dictionaryDetailCategory: [DictionaryDetailCategory]
     init(dictionaryDetailCategory: [DictionaryDetailCategory] = [DictionaryDetailCategory()]) {
         self.dictionaryDetailCategory = dictionaryDetailCategory
     }
 }

struct DictionaryDetailCategory: Codable {
    let name: String
    var equipmentList: [EquipmentList]
    init(name: String = "", equipmentList: [EquipmentList] = [EquipmentList()]) {
        self.name = name
        self.equipmentList = equipmentList
    }
}
