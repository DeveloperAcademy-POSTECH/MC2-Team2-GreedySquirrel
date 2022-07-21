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
    func getUserDefault() -> [String: String] {
        UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
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
    func removeEquipment(equipmentName: String) -> [String: String] {
        var interestEquipments = UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
        interestEquipments[equipmentName] = nil
        UserDefaults.standard.set(interestEquipments, forKey: "interestEquipments")
        return UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
    }
    func addEquipment(equipmentName: String, equipmentPaintingImageName: String) -> [String: String] {
        var interestEquipments = UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
        interestEquipments[equipmentName] = equipmentPaintingImageName
        UserDefaults.standard.set(interestEquipments, forKey: "interestEquipments")
        return UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
    }
}
