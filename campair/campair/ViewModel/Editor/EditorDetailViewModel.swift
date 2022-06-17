//
//  EditorDetailViewModel.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation

final class EditorDetailViewModel2: ObservableObject {
    private let editorUseCase = EditorUseCase(repository: EditorRepository())
    @Published var titleText = "test"
    func testButtonTouched() {
        self.editorUseCase.getEditorDetailContent { [weak self] editorDetailContents in
            print(editorDetailContents)
            // test code
            guard let self = self else { return }
            print(editorDetailContents.version)
            self.titleText = editorDetailContents.equipmentContents[0].recommendedEquipments[0].paintingURLString
        }
    }
}

final class EditorDetailViewModel: ObservableObject {
    @Published var content: EditorDetailContent
    init(editorDetailContent: EditorDetailContent) {
        self.content = editorDetailContent
    }
}
