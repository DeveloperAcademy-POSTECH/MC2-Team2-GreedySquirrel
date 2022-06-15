//
//  EditorContent .swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/12.
//

import Foundation

enum EditorVersion: Codable {
    case contents
    case list
}

struct EditorContent: Codable {
    let version: EditorVersion
    let opening: OpeningSection
    let equipmentContents: [EquipmentContent]
}
