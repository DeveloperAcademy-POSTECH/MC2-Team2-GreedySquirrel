//
//  temp1.swift
//  campair
//
//  Created by Mijin CHOI on 2022/06/17.
//

import Foundation

struct DictionaryMainCollection: Codable {
    var dictionaryMainCategory: [DictionaryMainCategory]
    init(dictionaryMainCategory: [DictionaryMainCategory] = [DictionaryMainCategory()]) {
        self.dictionaryMainCategory = dictionaryMainCategory
    }
}
