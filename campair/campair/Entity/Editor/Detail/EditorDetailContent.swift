//
//  EditorDetailContent.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/16.
//

import Foundation

enum EditorVersion: String, Codable {
    case contents
    case list
}

struct EditorDetailContent: Codable {
    let version: EditorVersion
    let openingSection: OpeningSection
    let equipmentContents: [EquipmentContent]
}
