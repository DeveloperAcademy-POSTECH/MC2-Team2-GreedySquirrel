//
//  InterestEquipmentRepository.swift
//  campair
//
//  Created by 이가은 on 2022/07/13.
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

protocol InterestEquipmentsFetchable {
    func fetchInterestEquipmentContent(fileName: String, completion: @escaping (Result<InterestEquipmentContent, Error>) -> Void )
    func fetchImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void)
}

struct InterestEquipmentRepository: InterestEquipmentsFetchable {
    func fetchInterestEquipmentContent(fileName: String, completion: @escaping (Result<InterestEquipmentContent, Error>) -> Void ) {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            completion(.failure(DataFetchingError.invalidURL))
            return
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            completion(.failure(DataFetchingError.urlNotConvertedToData))
            return
        }
        guard var interestEquipmentContent = try? JSONDecoder().decode(InterestEquipmentContent.self, from: data) else {
            completion(.failure(DataFetchingError.unableToDecode))
            return
        }
        guard let paintingURL = Bundle.main.url(forResource: interestEquipmentContent.paintingName, withExtension: "png") else {
            completion(.failure(DataFetchingError.unableToFindImage))
            return
        }
        interestEquipmentContent.paintingURLString = paintingURL.absoluteString
        completion(.success(interestEquipmentContent))
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
