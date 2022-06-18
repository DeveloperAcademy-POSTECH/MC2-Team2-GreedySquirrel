//
//  DictionaryUseCase.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation
import OSLog

struct DictionaryUseCase {
    private let repository: DictionaryEquipmentsFetchable
    init(repository: DictionaryEquipmentsFetchable) {
        self.repository = repository
    }
    func getDictionaryMainCollection(completion: @escaping (DictionaryMainCollection) -> Void) {
        repository.fetchEditorCollection { result in
            switch result {
            case .success(let editorCollection) :
                completion(editorCollection)
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
                print(error)
            }
        }
    }
}
