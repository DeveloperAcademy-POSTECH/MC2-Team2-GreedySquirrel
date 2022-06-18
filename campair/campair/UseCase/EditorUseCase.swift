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
    func getEditorCollection(completion: @escaping (EditorMainCollection) -> Void) {
        repository.fetchEditorCollection { result in
            switch result {
            case .success(let editorCollection) :
                completion(editorCollection)
            case .failure(let error) :
                os_log(.error, log: .default, "\(error.localizedDescription)")
            }
        }
    }
    func getEditorDetailContent(fileName: String, completion: @escaping (EditorDetailContent) -> Void) {
        self.repository.fetchEditorDetailContent(fileName: fileName) { result in
            switch result {
            case .success(let editorDetailContent) :
                completion(editorDetailContent)
            case .failure(let error) :
                os_log(.error, log: .default, "\(error.localizedDescription)")
            }
        }
    }
    func fetchImageData(fromURLString urlString: String, completion: @escaping (Data) -> Void) {
        repository.fetchImage(urlString: urlString) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                os_log(.error, log: .default, "\(error.localizedDescription)")
            }
        }
    }
}
