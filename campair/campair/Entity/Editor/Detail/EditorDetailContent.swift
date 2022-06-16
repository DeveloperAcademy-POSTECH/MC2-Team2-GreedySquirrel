//
//  EditorDetailContent.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/16.
//

import Foundation

// TODO !
enum EditorVersion: Codable {
    case contents
    case list
}

struct EditorDetailContent: Codable {
    let version: String
    let openingSection: OpeningSection
    let equipmentContents: [EquipmentContent]
}
