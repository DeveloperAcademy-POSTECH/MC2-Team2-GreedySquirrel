//
//  InterestEquipmentUseCase.swift
//  campair
//
//  Created by 이가은 on 2022/07/13.
//

import Foundation
import OSLog

struct InterestEquipmentUseCase {
    private let repository: InterestEquipmentsFetchable
    init(repository: InterestEquipmentsFetchable) {
        self.repository = repository
    }
    func getInterestEquipmentContent(fileName: String, completion: @escaping (InterestEquipmentContent) -> Void) {
        repository.fetchInterestEquipmentContent(fileName: fileName) { result in
            switch result {
                case .success(let interestEquipmentContent) : completion(interestEquipmentContent)
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
