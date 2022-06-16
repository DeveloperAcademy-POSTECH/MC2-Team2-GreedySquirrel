//
//  EditorViewModel.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Combine
import Foundation

// EditorMainViewModel라고 이름을 바꾸는 게 좋을 거 같아요 ..!
final class EditorMainViewModel: ObservableObject {
    private let editorUseCase = EditorUseCase(repository: EditorRepository())
    @Published var titleText = "test"
    func testButtonTouched() {
        self.editorUseCase.getEditorCollection { [weak self] editorCollection in
            print(editorCollection)
            // test code
            guard let self = self else { return }
            self.titleText = editorCollection.editorMainContents[0].cardPaintingTitle
        }
    }
}

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
