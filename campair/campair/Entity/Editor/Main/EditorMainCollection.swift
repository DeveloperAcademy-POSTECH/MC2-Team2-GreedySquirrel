//
//  EditorCollection.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/12.
//

import Foundation

struct EditorMainCollection: Codable {
    var editorMainContents: [EditorMainContent]
    init(editorMainContents: [EditorMainContent]) {
        self.editorMainContents = editorMainContents
    }
    init() {
        self.editorMainContents = [EditorMainContent()]
    }
}
