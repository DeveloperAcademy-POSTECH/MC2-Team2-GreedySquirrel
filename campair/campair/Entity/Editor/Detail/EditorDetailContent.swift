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
    var openingSection: OpeningSection
    var equipmentContents: [EquipmentContent]
    init(version: EditorVersion = EditorVersion.contents, openingSection: OpeningSection = OpeningSection(), equipmentContents: [EquipmentContent] = []) {
        self.version = version
        self.openingSection = openingSection
        self.equipmentContents = equipmentContents
    }
}
