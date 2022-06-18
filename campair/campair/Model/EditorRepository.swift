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
    func fetchEditorDetailContent(fileName: String, completion: @escaping (Result<EditorDetailContent, Error>) -> Void )
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
    func fetchEditorDetailContent(fileName: String, completion: @escaping (Result<EditorDetailContent, Error>) -> Void ) {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            completion(.failure(DataFetchingError.invalidURL))
            return
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            completion(.failure(DataFetchingError.urlNotConvertedToData))
            return
        }
        guard var editorDetailContent = try? JSONDecoder().decode(EditorDetailContent.self, from: data) else {
            completion(.failure(DataFetchingError.unableToDecode))
            return
        }
        // parsing & mapping fetch cardPainting image url
        let openingSection = editorDetailContent.openingSection
        guard let url = Bundle.main.url(forResource: openingSection.cardPaintingImageName, withExtension: "png") else {
            completion(.failure(DataFetchingError.unableToFindImage))
            return
        }
        editorDetailContent.openingSection.cardPaintingURLString = url.absoluteString
        // parsing & mapping fetch ContentEquipment's image url
        for equipmentContentIndex in editorDetailContent.equipmentContents.indices {
            let contentEquipment = editorDetailContent.equipmentContents[equipmentContentIndex]
            for recommendedEquipmentIndex in contentEquipment.recommendedEquipments.indices {
                let imageName = contentEquipment.recommendedEquipments[recommendedEquipmentIndex].paintingImageName
                guard let url = Bundle.main.url(forResource: imageName, withExtension: "png") else {
                    print(imageName)
                    completion(.failure(DataFetchingError.unableToFindImage))
                    return
                }
                editorDetailContent.equipmentContents[equipmentContentIndex].recommendedEquipments[recommendedEquipmentIndex].paintingURLString = url.absoluteString
            }
        }
        completion(.success(editorDetailContent))
    }
    func fetchImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(ImageFetchingError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Because now on we only fetch local image, response is never used
            _ = response
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
