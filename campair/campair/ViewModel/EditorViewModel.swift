//
//  EditorViewModel.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Combine
import Foundation

// EditorMainViewModel라고 이름을 바꾸는 게 좋을 거 같아요 ..!
final class EditorViewModel: ObservableObject {
    private let editorUseCase = EditorUseCase(repository: EditorRepository())
    @Published var titleText = "test"
    func testButtonTouched() {
        self.editorUseCase.getEditorCollection { [weak self] editorCollection in
            print(editorCollection)
            // test code
            guard let self = self else { return }
            self.titleText = editorCollection.editorContents[0].equipmentContents[2].recommendedEquipments[0].content
        }
    }
}

final class EditorDetailViewModel: ObservableObject {
    @Published var content: EditorContent
    init(editorDetailContent: EditorContent) {
        self.content = editorDetailContent
    }
}
