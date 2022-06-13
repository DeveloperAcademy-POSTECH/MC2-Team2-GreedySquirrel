//
//  ModelPlaceHolder.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Foundation

enum EditorRepositoryError: Error {
    case invaildFilePath
    case failedToStringify
    case unableToUtf8Encoding
    case failedToDecode
}

protocol EditorcontentsFetchable {
    func fetchEditorCollection(completion: @escaping (Result<EditorCollection, Error>) -> Void )
}

struct EditorRepository: EditorcontentsFetchable {
    func fetchEditorCollection(completion: @escaping (Result<EditorCollection, Error>) -> Void ) {
        guard let filePath = Bundle.main.path(forResource: "EditorCollectionData", ofType: "json") else {
            completion(.failure(EditorRepositoryError.invaildFilePath))
            return
        }
        guard let jsonString = try?
                String(contentsOfFile: filePath) else {
            completion(.failure(EditorRepositoryError.failedToStringify))
            return
        }
        guard let data = jsonString.data(using: .utf8) else {
            completion(.failure(EditorRepositoryError.unableToUtf8Encoding))
            return
        }
        guard let editorCollection = try?
                JSONDecoder().decode(EditorCollection.self, from: data) else {
            completion(.failure(EditorRepositoryError.failedToDecode))
            return
        }
        completion(.success(editorCollection))
    }
}
