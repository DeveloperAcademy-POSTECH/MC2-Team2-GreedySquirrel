//
//  EditorRepository.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Foundation

private enum DataFetchingError: Error {
    case invalidURL
    case urlNotConvertedToData
    case unableToDecode
    case unableToFindImage
}

private enum ImageFetchingError: Error {
    case invalidURL
    case invalidResponse
    case notSucceed
    case noData
}

protocol EditorcontentsFetchable {
    func fetchEditorCollection(completion: @escaping (Result<EditorMainCollection, Error>) -> Void )
    func fetchEditorDetailContent(completion: @escaping (Result<EditorDetailContent, Error>) -> Void )
    func fetchImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void)
}

struct EditorRepository: EditorcontentsFetchable {
    func fetchEditorCollection(completion: @escaping (Result<EditorMainCollection, Error>) -> Void ) {
        guard let fileURL = Bundle.main.url(forResource: "EditorMainCollectionData", withExtension: "json") else {
            completion(.failure(DataFetchingError.invalidURL))
            return
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            completion(.failure(DataFetchingError.urlNotConvertedToData))
            return
        }
        guard var editorMainCollection = try? JSONDecoder().decode(EditorMainCollection.self, from: data) else {
            completion(.failure(DataFetchingError.unableToDecode))
            return
        }
        for contentsIndex in editorMainCollection.editorMainContents.indices {
            // parsing & mapping fetch EditorMainContent's image url
            let editorMainContent = editorMainCollection.editorMainContents[contentsIndex]
            guard let cardPaintingURL = Bundle.main.url(forResource: editorMainContent.cardPaintingImageName, withExtension: "png") else {
                completion(.failure(DataFetchingError.unableToFindImage))
                return
            }
            editorMainCollection.editorMainContents[contentsIndex].cardPaintingURLString = cardPaintingURL.absoluteString
            // parsing & mapping ContentEquipment's image url
            for equipmentIndex in editorMainContent.contentEquipments.indices {
                let contentEquipment = editorMainContent.contentEquipments[equipmentIndex]
                guard let paintingURLString = Bundle.main.url(forResource: contentEquipment.paintingImageName, withExtension: "png") else {
                    completion(.failure(DataFetchingError.unableToFindImage))
                    return
                }
                editorMainCollection.editorMainContents[contentsIndex].contentEquipments[equipmentIndex].paintingURLString = paintingURLString.absoluteString
            }
        }
        completion(.success(editorMainCollection))
    }
    func fetchEditorDetailContent(completion: @escaping (Result<EditorDetailContent, Error>) -> Void ) {
        guard let fileURL = Bundle.main.url(forResource: "EditorDetailCollectionData", withExtension: "json") else {
            completion(.failure(DataFetchingError.invalidURL))
            return
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            completion(.failure(DataFetchingError.urlNotConvertedToData))
            return
        }
        guard let editorDetailContent = try? JSONDecoder().decode(EditorDetailContent.self, from: data) else {
            completion(.failure(DataFetchingError.unableToDecode))
            return
        }
        completion(.success(editorDetailContent))
    }
    func fetchImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(ImageFetchingError.invalidURL))
            return
        }
        // Because now on we only fetch local image, response is never used
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(ImageFetchingError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
