//
//  ViewModelPlaceHolder.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Foundation

class EditorViewModel: ObservableObject {
    let editorUseCase = EditorUseCase(repository: EditorRepository())
    @Published var titleText = "test"
    func testButtonTouched() {
        editorUseCase.getEditorCollection { editorCollection in
            self.titleText = editorCollection.editorContents[0].title
        }
    }
}
