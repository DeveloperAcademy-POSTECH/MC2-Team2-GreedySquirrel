//
//  EditorContent .swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/12.
//

import Foundation

struct EditorContent: Codable {
    let title: String
    let concept: String
    let content: String
    let recommendedEquipment: [Equipment]
}
