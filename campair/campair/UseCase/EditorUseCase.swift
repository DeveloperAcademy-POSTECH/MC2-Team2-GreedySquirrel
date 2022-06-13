//
//  EditorUseCase.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Foundation
import OSLog

struct EditorUseCase {
    private let repository: EditorcontentsFetchable
    init(repository: EditorcontentsFetchable) {
        self.repository = repository
    }
    func getEditorCollection(completion: @escaping (EditorCollection) -> Void) {
        repository.fetchEditorCollection { result in
            switch result {
            case .success(let editorCollection) :
                completion(editorCollection)
            case .failure(let error) :
                os_log(.error, log: .default, "\(error.localizedDescription)")
            }
        }
    }
}
