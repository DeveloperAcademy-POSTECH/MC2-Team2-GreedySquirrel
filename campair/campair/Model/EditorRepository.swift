//
//  ModelPlaceHolder.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Foundation

enum EditorRepositoryError: Error {
    case filePathError
    case stringifyError
    case dataConvertError
    case decodeError
}

protocol EditorcontentsFetchable {
    func fetchEditorCollection(completion: @escaping (Result<EditorCollection, Error>) -> Void )
}

struct EditorRepository: EditorcontentsFetchable {
    func fetchEditorCollection(completion: @escaping (Result<EditorCollection, Error>) -> Void ) {
        guard let filePath = Bundle.main.path(forResource: "EditorCollectionData", ofType: "json") else {
            completion(.failure(EditorRepositoryError.filePathError))
            return
        }
        guard let jsonString = try?
                String(contentsOfFile: filePath) else {
            completion(.failure(EditorRepositoryError.stringifyError))
            return
        }
        guard let data = jsonString.data(using: .utf8) else {
            completion(.failure(EditorRepositoryError.dataConvertError))
            return
        }
        guard let editorCollection = try?
                JSONDecoder().decode(EditorCollection.self, from: data) else {
            completion(.failure(EditorRepositoryError.decodeError))
            return
        }
        completion(.success(editorCollection))
    }
}
