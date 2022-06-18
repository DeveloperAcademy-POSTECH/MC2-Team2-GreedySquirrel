//
//  DictionaryRepository.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
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

protocol DictionaryEquipmentsFetchable {
    func fetchDictionaryMainCollection(completion: @escaping (Result<DictionaryMainCollection, Error>) -> Void )
    func fetchImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void)
}

struct DictionaryRepository: DictionaryEquipmentsFetchable {
    func fetchDictionaryMainCollection(completion: @escaping (Result<DictionaryMainCollection, Error>) -> Void ) {
        guard let fileURL = Bundle.main.url(forResource: "DictionaryMainCollectionData", withExtension: "json") else {
            completion(.failure(DataFetchingError.invalidURL))
            return
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            completion(.failure(DataFetchingError.urlNotConvertedToData))
            return
        }
        guard var dictionaryMainCollection = try? JSONDecoder().decode(DictionaryMainCollection.self, from: data) else {
            completion(.failure(DataFetchingError.unableToDecode))
            return
        }
        for groupIndex in dictionaryMainCollection.dictionaryMainCategory.indices {
            // parsing & mapping fetch equipmentGroupPaintingURL url
            let equipmentGroup = dictionaryMainCollection.dictionaryMainCategory[groupIndex]
            guard let equipmentGroupPaintingURL = Bundle.main.url(forResource: equipmentGroup.paintingName, withExtension: "png") else {
                completion(.failure(DataFetchingError.unableToFindImage))
                return
            }
            dictionaryMainCollection.dictionaryMainCategory[groupIndex].paintingURLString = equipmentGroupPaintingURL.absoluteString
        }
        completion(.success(dictionaryMainCollection))
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
